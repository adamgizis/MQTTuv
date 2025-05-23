
 #include <time.h>
 #include <errno.h>
 #include <unistd.h>
 #include <string.h>
 #include "mqtt.h"
 #include "util.h"
 #include "pack.h"
 #include "core.h"
 #include "config.h"
 #include "server.h"
 #include <uv.h> 
 #include <stdlib.h>
 #include "uthash.h"
 #include "utlist.h"
 #include <assert.h>
 #include "trie.h"
 /*
  * General informations of the broker, all fields will be published
  * periodically to internal topics
  */
 static struct sol_info info;
 
 /* Broker global instance, contains the topic trie and the clients hashtable */
 static struct info mqttuv;

 // global event loop
 uv_loop_t* loop;
 
 /* Prototype for a command handler */
 typedef int handler(uv_stream_t* , union mqtt_packet *);
 
 /* I/O closures, for the 3 main operation of the server
  * - Accept a new connecting client
  * - Read incoming bytes from connected clients
  * - Write output bytes to connected clients
  */
  struct delivered delivered_log = {0};
 
 static void on_accept( uv_stream_t *, int);
 static void on_read(uv_stream_t* , ssize_t, const uv_buf_t*);
 static void on_write(uv_write_t*, int);

// memory callback
 static void alloc_buffer(uv_handle_t *, size_t , uv_buf_t *);
 // write2
 static void write2(uv_stream_t* , char *, int);
 static void write2subs(struct subscriber*, union mqtt_packet *);
 
 /* Command handler, each one have responsibility over a defined command packet */
 static int connect_handler(uv_stream_t* , union mqtt_packet *);
 static int disconnect_handler(uv_stream_t *stream, union mqtt_packet *pkt);
 static int subscribe_handler(uv_stream_t* , union mqtt_packet *);
 static int publish_handler(uv_stream_t* , union mqtt_packet *);
 static int pingreq_handler(uv_stream_t*, union mqtt_packet *);
 
 // keep alive
 static void on_keepalive_timeout(uv_timer_t*);
 static int to_interval_ms(int);
 static void reset_timer(uv_timer_t*);

 static void on_uv_handle_closed(uv_handle_t *handle);
 static int disconnect_client(struct client *client);
 void unsubscribe_all(struct topic *root, struct client *client);
 
 

 static int to_interval_ms(int seconds){
    // if 1.5 times the keep alive disconnect the guy
    return seconds * 1000 * 1.5;
 }

    static int connect_handler(uv_stream_t* stream, union mqtt_packet *pkt) {

        // IF ALREADY IN HASHTABLE DISCONNECT THE STREAM AND DELETE
        // TODO just return error_code and handle it on `on_read`
        struct client *existing_client = ht_find_client(mqttuv.clients, (const char *) pkt->connect.payload.client_id);
        if (existing_client) {

            // Already connected client, 2 CONNECT packet should be interpreted as
            // a violation of the protocol, causing disconnection of the client

            sol_info("CLIENT_ID=%s already exists, refusing connection", pkt->connect.payload.client_id);

            union mqtt_packet *response = sol_malloc(sizeof(*response));
            unsigned char byte = CONNACK_BYTE;     /* header flags 0x20         */
        
            unsigned char session_present = 0;     /* bit-0 of byte-2           */
            unsigned char connect_flags   = session_present;
            unsigned char rc              = 0x02;  /* 0x02 = “Identifier Rejected”
                                                      for MQTT 3.1.1             */
        
            response->connack = *mqtt_packet_connack(byte, connect_flags, rc);
        
            unsigned char *p = pack_mqtt_packet(response, CONNACK); /* 4 bytes   */

            //("writing failed connack\n");
            write2(stream, p, MQTT_ACK_LEN);

            uv_read_stop(stream);   
            uv_close((uv_handle_t*)stream, on_uv_handle_closed);
            return -1;
        }

        // create a new client and add to the hashtable

        struct client *new_client = sol_malloc(sizeof(*new_client));
        const char *cid = (const char *) pkt->connect.payload.client_id;
        stream->data = (char *) strdup(cid);
        new_client->client_id = (char*) stream->data;
        new_client->stream = stream;
        new_client->subs = NULL;

        //set up the keep alive timer
        new_client->keepalive = pkt->connect.payload.keepalive;
        uv_timer_t* keepalive_timer =malloc(sizeof(uv_timer_t));
        new_client->timer = keepalive_timer;
        new_client->timer->data = new_client->client_id;
        uv_timer_init(stream->loop, new_client->timer);
        //printf("starting timer");
        int kas = to_interval_ms(new_client->keepalive);
        uv_timer_start(new_client->timer, on_keepalive_timeout, kas, kas);


        // printf("created new client\n");
        ht_put_client(&mqttuv.clients, new_client);

        struct client* test = ht_find_client(mqttuv.clients, stream->data);


        // printf("added to hastable\n");
        if (pkt->connect.bits.clean_session == false){
            // new_client->session.subscriptions = list_create(NULL);
        }
        /* Record the new client connected */

        // send back a connack messgae 
        union mqtt_packet *response = sol_malloc(sizeof(*response));
        unsigned char byte = CONNACK_BYTE;


        unsigned char session_present = 0;
        unsigned char connect_flags = 0 | (session_present & 0x1) << 0;
        unsigned char rc = 0;  // 0 means connection accepted

        response->connack = *mqtt_packet_connack(byte, connect_flags, rc);

        unsigned char *p = pack_mqtt_packet(response, CONNACK);

        write2(stream, p, MQTT_ACK_LEN);
        
        info.nclients++;
        info.nconnections++;

        return 1;
        
    }

    static int disconnect_handler(uv_stream_t *stream, union mqtt_packet *pkt) {
        const char *client_id = (const char *)stream->data;

        if(!client_id) {
            //printf("null client id\n");
            return -1;
        }
        
        //printf("finding client in hashmap\n");
        struct client *client_info = ht_find_client(mqttuv.clients, client_id);
        //printf("hello?\n");
        if(!client_info){
            //printf("hashmap failed\n");
            return -1;
        }
        //printf("found client in hashmap\n");

        return disconnect_client(client_info);

    }

    static int disconnect_client(struct client *client) {
        if (!client) return -1;


        if (client->timer && !uv_is_closing((uv_handle_t*)client->timer)) {
            uv_timer_stop(client->timer);
            uv_close((uv_handle_t*)client->timer, on_uv_handle_closed);
            client->timer = NULL;
        }

        unsubscribe_all(mqttuv.topics, client);

        if (client->stream && !uv_is_closing((uv_handle_t*)client->stream)) {
            uv_read_stop(client->stream);
            uv_close((uv_handle_t*)client->stream, on_uv_handle_closed);
            client->stream = NULL;         
        }

        ht_delete_client(&mqttuv.clients, client->client_id);
        if (info.nclients)      info.nclients--;
        if (info.nconnections)  info.nconnections--;

        sol_debug("Client %s gracefully disconnected", client->client_id);

        sol_free(client);

        return 1;
    }

 static void on_uv_handle_closed(uv_handle_t *handle)
{   
    //printf("uv handle closed: %p\n", handle);
}

 static void on_keepalive_timeout(uv_timer_t* handle){
    struct client* cli = NULL;
    cli = ht_find_client(mqttuv.clients, (const char *) handle->data);
    // uv_timer_stop(handle);
    if(cli){
        disconnect_handler(cli->stream, NULL);
    }

 }

 static void reset_timer(uv_timer_t* keepalive_timer) {
    //printf("reset\n");
    //printf("due in before %ld\n", uv_timer_get_due_in(keepalive_timer));
    uv_timer_again(keepalive_timer);
    //printf("due in after %ld\n", uv_timer_get_due_in(keepalive_timer));
}


 static int publish_handler(uv_stream_t* client, union mqtt_packet *pkt){
        // // TODO ADD QOS logic
        // TODO improper string (starts with $ or ends with # return failure)
        (void) client;
        char *top = (char *) pkt->publish.topic;
        //printf("sending message %s\n", pkt->publish.payload);


        publish(mqttuv.topics, top, pkt, 0 );
        // TODO send back publish success or failure message to client based on what qos packet was sent with


        return 1;
 }

static int subscribe_handler(uv_stream_t* stream, union mqtt_packet *pkt){
    // TODO add QOS logic 
    // send back success and failure messages et
    const char *client_id = (const char *)stream->data;
  
    struct client *client_info = ht_find_client(mqttuv.clients, client_id);
    if(!client_info){
        //printf("hashmap failed\n");
        return -1;
    }
    //printf("subscibe tuples length %d\n", pkt->subscribe.tuples_len);
    unsigned char rcs[pkt->subscribe.tuples_len];
    //printf("got the client from the hashmap\n");
    for (unsigned i = 0; i < pkt->subscribe.tuples_len; i++) {
        // this not the correct qos
        int qos = pkt->subscribe.tuples[i].qos;
        //printf("associated qos %d\n", qos);
        char *topic = (char *) pkt->subscribe.tuples[i].topic;
        //printf("topic %s\n", topic);
        rcs[i] = qos;
        insert_subscription(mqttuv.topics, (char *) topic, client_info, qos);

        struct sub_topic *node = calloc(1, sizeof(*node));
        node->topic = strdup(topic);
        LL_PREPEND(client_info->subs, node);
    }

    struct mqtt_suback *suback = mqtt_packet_suback(SUBACK_BYTE,
        pkt->subscribe.pkt_id,
        rcs,
        pkt->subscribe.tuples_len);

    mqtt_packet_release(pkt, SUBSCRIBE);
    pkt->suback = *suback;
    unsigned char *packed = pack_mqtt_packet(pkt, SUBACK);
    size_t len = MQTT_HEADER_LEN + sizeof(uint16_t) + pkt->subscribe.tuples_len;
    
    write2(stream, packed, len);
    return 1;
}

static int unsubscribe_handler(uv_stream_t* stream, union mqtt_packet *pkt){
    struct client *client_info = ht_find_client(mqttuv.clients,(const char *) stream->data);
    if(!client_info){
        //printf("error not in hashmap\n");
    }

    for (unsigned i = 0; i < pkt->subscribe.tuples_len; i++) {
        //printf("unsubscribing in tuple loop\n");
        unsubscribe(mqttuv.topics, (const char *) pkt->unsubscribe.tuples[i].topic, client_info);

        struct sub_topic *node, *tmp;
        LL_FOREACH_SAFE(client_info->subs, node, tmp) {
            printf("inhere\n");
            if(strcmp(node->topic, pkt->unsubscribe.tuples[i].topic) == 0) {
                LL_DELETE(client_info->subs, node);
                free(node->topic);
                free(node);
                break;
            }
        }
    }

    // return unsuback
    pkt->ack = *mqtt_packet_ack(UNSUBACK_BYTE, pkt->unsubscribe.pkt_id);
    unsigned char *packed = pack_mqtt_packet(pkt, UNSUBACK);
    write2(stream, packed, MQTT_ACK_LEN);
    return 1;
}

static int pingreq_handler(uv_stream_t* stream, union mqtt_packet *pkt){
    // respond with ping response
    pkt->header = *mqtt_packet_header(PINGRESP_BYTE);
    unsigned char *packed = pack_mqtt_packet(pkt, PINGRESP);
    write2(stream, packed, MQTT_HEADER_LEN);
    return 1;
}

#ifdef TESTING
void write2subs(struct subscriber *subs, union mqtt_packet *pkt) {
    
    while (subs) {
        delivered_log.clients[delivered_log.count++] = subs->client;
        subs = subs->next;
    }

}
#else
static void write2subs(struct subscriber* head, union mqtt_packet *pkt){
    if(pkt == NULL){
        //printf("correctly writing to subs in test\n");
        return;
    }
    size_t publen;
    struct subscriber* tmp = head;
    while(tmp != NULL){

        //printf("sending to %s\n", tmp->client->client_id);
        publen = MQTT_HEADER_LEN + sizeof(uint16_t) + pkt->publish.topiclen + pkt->publish.payloadlen;
        pkt->publish.header.bits.qos = tmp->qos;
        unsigned char * packed = pack_mqtt_packet(pkt, PUBLISH);

        /*
        for (size_t i = 0; i < (size_t)publen; i++) {
            printf("%02X ", (unsigned char) packed[i]);
        }
        printf("\n");
        */
        
        write2(tmp->client->stream, packed, publen);

        tmp = tmp->next;
    }
    
}
#endif

 static void alloc_buffer(uv_handle_t *handle, size_t suggested_size, uv_buf_t *buf){
    
    buf->base = sol_malloc(conf->max_request_size);
    buf->len = suggested_size;
 }
 
 static void write2(uv_stream_t* stream, char *data, int len2) {
    uv_buf_t buffer[] = {
        {.base = data, .len = len2}
    };
    
    uv_write_t *req = malloc(sizeof(uv_write_t));
    uv_write(req, stream, buffer, 1, on_write);
}

static void on_write(uv_write_t* req,  int status){
    if (status) {
        perror( "uv_write error ");
            return;
      }
    //printf("wrote.\n");
    free(req);
};
 
 static void on_accept(uv_stream_t *server, int status) {
    if (status < 0) {
        sol_debug("New connection error: %s\n", uv_strerror(status));
        return;
    }

    uv_tcp_t *client = malloc(sizeof(uv_tcp_t));
    uv_tcp_init(server->loop, client);

    if (uv_accept(server, (uv_stream_t *)client) == 0) {
        //printf("accepted someone!! yipee\n");

        uv_read_start((uv_stream_t *)client, alloc_buffer, on_read);  
    } else {
        uv_close((uv_handle_t *)client, NULL);
    }
 }




static void on_read(uv_stream_t* stream, ssize_t nread, const uv_buf_t* buf){

    // AT THIS POINT THE PACKET MAY NOT BE IN THE HASHMAP
    // TODO - ACCEPT multiple packets in one stream


    // parse the buffer
    // parse head send to 
    if (nread < 0) {
        uv_close((uv_handle_t*) stream, NULL);
        //free(buf->base); // usually free outside after parse
        return;
    }

    /*
    printf("input_buf (%zd bytes): ", nread);  // use %zd for ssize_t
    for (size_t i = 0; i < (size_t)nread; i++) {
        printf("%02X ", (unsigned char) buf->base[i]);
    }
    printf("\n");
    */
    

    // error from the parsed function
    uint8_t command = (uint8_t) buf->base[0];
    uint8_t packet_type = command >> 4;

    //printf("packet type %d\n", packet_type );

    union mqtt_packet packet;
    
    union mqtt_header hdr = { .byte = command };
    printf("%d\n", unpack_mqtt_packet((unsigned char *)buf->base, &packet));

    struct client * cli = NULL;
    if(packet_type != CONNECT){
        cli = ht_find_client(mqttuv.clients,(const char *) stream->data);
    }
    if (cli){
        reset_timer(cli->timer);
    }



    switch(packet_type){
        case CONNECT:
            sol_info("New client sent CONNECT packet\n");
            connect_handler( stream, &packet);
            break;
        case SUBSCRIBE:
            sol_info("SUBSCRIBE packet sent by CLIENT_ID=%s\n", cli->client_id);
            subscribe_handler( stream, &packet);
            break;
        case PUBLISH:
            sol_info("PUBLISH packet sent by CLIENT_ID=%s\n", cli->client_id);
            publish_handler(stream, &packet);
            break;
        case UNSUBSCRIBE:
            sol_info("UNSUBSCRIBE packet sent by CLIENT_ID=%s\n", cli->client_id);
            unsubscribe_handler(stream, &packet);
            break;
        case PINGREQ:
            sol_info("PINGREQ packet sent by CLIENT_ID=%s\n", cli->client_id);
            pingreq_handler(stream, &packet);
            break;
        case DISCONNECT:
            sol_info("DISCONNECT packet sent by CLIENT_ID=%s\n", cli->client_id);
            disconnect_handler(stream, &packet);
            break;
    }

    //free(buf->base);
 }

struct topic *get_or_create_child(struct topic *parent, const char *level) {
    
    struct topic *cur = parent->children;

    while (cur) {
        // if at desired level return node
        if (strcmp(cur->level, level) == 0)
            return cur;
        cur = cur->next;
    }

    // create a new node
    struct topic *new_node = calloc(1, sizeof(struct topic));
    new_node->level = strdup(level);

    // i have questions about this
    new_node->next = parent->children;
    parent->children = new_node;
    return new_node;
}


void insert_subscription(struct topic *root, const char *topic, struct client *client, int qos) {
    char *dup = strdup(topic);

    char *token = strtok(dup, "/");
    struct topic *node = root;

    while (token) {
        // see if level exists or if else create a node
        node = get_or_create_child(node, token);
        
        // if multilevel wildcard break, # must be the last character and we just treat as such if included
        if (strcmp(token, "#") == 0)
            break;
        // contiune strtok to get next /
        token = strtok(NULL, "/");
    }

    // create a subscriber 
    struct subscriber *sub = calloc(1, sizeof(struct subscriber));
    
    sub->client = client;
    sub->qos = qos;


    // add to front of linked list
    sub->next = node->subscribers;
    node->subscribers = sub;

    free(dup);
}


void publish_recursive(struct topic *node, char **levels, int depth, int max_depth, union mqtt_packet *pkt, int test) {
    if (!node) return;
    int result = strcmp(node->level, "#");
    // deliver if i'm at the lest depth or to wild card
    if (depth == max_depth || strcmp(node->level, "#") == 0) {
        if(test == 1){
            //printf("Delivering message to client \n");
        }
        else{
            // give write2 subs the head
            write2subs(node->subscribers, pkt);
        }
    }


    for (struct topic *child = node->children; child; child = child->next) {
        // send to all childern of below
        if (strcmp(child->level, "#") == 0) {
            publish_recursive(child, levels, max_depth, max_depth, pkt,test);
        } else if (strcmp(child->level, levels[depth]) == 0 || strcmp(child->level, "+") == 0) {
            publish_recursive(child, levels, depth + 1, max_depth, pkt,test);
        }
    }

    return;
    
}

void publish(struct topic *root, const char *topic, union mqtt_packet *pkt, int test) {
    char *dup = strdup(topic); // get the full topic
    char *levels[16]; // get all the tokens and add to list of llevel
    int depth = 0;

    char *token = strtok(dup, "/");
    while (token && depth < 16) {
        levels[depth++] = token;
        token = strtok(NULL, "/");
    }

    // loop through the childern of the root
    for (struct topic *child = root->children; child; child = child->next) {
        // if match to one of the levels or
        if (strcmp(child->level, levels[0]) == 0 || strcmp(child->level, "#") == 0) {
            publish_recursive(child, levels, 1, depth, pkt, test);
        }
    }

    free(dup);
}



void unsubscribe(struct topic *root, const char *topic, struct client *client) {
    // TODO - if a topic has no subscribers get rid of it 
    char *dup = strdup(topic);

    struct topic *node = root;

    char *token = strtok(dup, "/");
    while (token) {
        struct topic *child = node->children;
        while (child && strcmp(child->level, token) != 0) {
            child = child->next;
        }
        if (!child) {
            // case not found
            return;
        }
        node = child;

        if (strcmp(token, "#") == 0)
            break;

        token = strtok(NULL, "/");
    } 
    

    // remove from susbscriber list
    struct subscriber **cur = &node->subscribers;
    while (*cur) {
        if ((*cur)->client == client) {
            struct subscriber *to_free = *cur;
            *cur = (*cur)->next;
            free(to_free);
            break;
        }
        cur = &(*cur)->next;
    }

    sol_info("CLIENT_ID=%s unsubsribing from TOPIC=%s", client->client_id, topic);

    free(dup);
}

void unsubscribe_all(struct topic *root, struct client *client)
{
    struct sub_topic *node, *tmp;

    LL_FOREACH_SAFE(client->subs, node, tmp) {
        unsubscribe(root, node->topic, client);  
        LL_DELETE(client->subs, node);           
        free(node->topic);                     
        free(node);                           
    }
}


int start_server(const char *addr, const char *port) {
 
    /* Initialize global Sol instance */
    mqttuv.clients = NULL;
    mqttuv.topics = calloc(1, sizeof(struct topic));;
    uv_loop_t *loop = uv_default_loop();
    uv_tcp_t *server = malloc(sizeof(uv_tcp_t));


    // was server successfully malloced
    if (!server) {
        sol_debug("Failed to allocate memory for server\n");
        return -1;
    }
    uv_tcp_init(loop, server);

    // atoi to get into for libuv
    struct sockaddr_in bind_addr;
    int port_num = atoi(port);
    if (uv_ip4_addr(addr, port_num, &bind_addr) != 0) {
        sol_debug( "Invalid address or port\n");
        return -1;
    }
    
    // tcp bind derver
    if (uv_tcp_bind(server, (const struct sockaddr*)&bind_addr, 0) != 0) {
        sol_debug("Failed to bind\n");
        return -1;
    }

    // listen (128 is the max number of pending requests allowed)
    int r = uv_listen((uv_stream_t*) server,128, on_accept);
    if (r) {
        sol_debug("Listen error: %s\n", uv_strerror(r));
        return -1;
    }



    uv_run(loop, UV_RUN_DEFAULT);

    // cleanup this is probably going to have to move somewhere else
    sol_info("Sol v%s exiting", VERSION);

    return 0;
 }