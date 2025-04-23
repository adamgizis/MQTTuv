
 #include <time.h>
 #include <errno.h>
 #include <unistd.h>
 #include <string.h>
 #include <arpa/inet.h>
 #include <sys/socket.h>
 #include <sys/epoll.h>
 #include "mqtt.h"
 #include "util.h"
 #include "pack.h"
 #include "core.h"
 #include "config.h"
 #include "server.h"
 #include <uv.h> 
 #include <stdlib.h>
 #include "uthash.h"
 #include <assert.h>
 /*
  * General informations of the broker, all fields will be published
  * periodically to internal topics
  */
 static struct sol_info info;
 
 /* Broker global instance, contains the topic trie and the clients hashtable */
 static struct info mqttuv;

 // global event loop
 struct uv_loop_t* loop;
 
 /* Prototype for a command handler */
 typedef int handler(uv_stream_t* , union mqtt_packet *);
 
 /* I/O closures, for the 3 main operation of the server
  * - Accept a new connecting client
  * - Read incoming bytes from connected clients
  * - Write output bytes to connected clients
  */
 
 static void on_accept( uv_stream_t *, int);
 static void on_read(uv_stream_t* , ssize_t, const uv_buf_t*);
 static void on_write(uv_write_t*, int);

// memory callback
 static void alloc_buffer(uv_handle_t *, size_t , uv_buf_t *);
 // write2
 static void write2(uv_stream_t* , char *, int);
 
 /* Command handler, each one have responsibility over a defined command packet */
 static int connect_handler(uv_stream_t* , union mqtt_packet *);
 /*
  * Connection structure for private use of the module, mainly for accepting
  * new connections
  */
 struct connection {
     char ip[INET_ADDRSTRLEN + 1];
     int fd;
 };
 
 /*
This is my  attempt at the parse
  */
  static ssize_t parse_packet(const unsigned char *input_buf, size_t input_len, char *command) {
    if (input_len < 2)  // header and 
        return -ERRPACKETERR;

    size_t offset = 0;
    unsigned char byte = input_buf[offset++];
    
    //
    if ((byte >> 4) > DISCONNECT || (byte >> 4) < CONNECT)
        return -ERRPACKETERR;


    unsigned char buff[4];
    int count = 0;
    do {
        if (offset >= input_len || count >= 4) 
            return -ERRPACKETERR;
        buff[count++] = input_buf[offset++];
    } while (buff[count - 1] & (1 << 7));

    const unsigned char *pbuf = buff;
    unsigned long long tlen = mqtt_decode_length(&pbuf);

    if (tlen > conf->max_request_size)
        return -ERRMAXREQSIZE;

    size_t total_packet_size = offset + tlen;
    if (total_packet_size > input_len)
        return -ERRPACKETERR;

    // command is the first byte used to send to correct handler
    *command = byte;
    return total_packet_size;  // Number of bytes parsed
}
 
 
 static int connect_handler(uv_stream_t* client, union mqtt_packet *pkt) {

    // IF ALREADY IN HASHTABLE DISCONNECT THE STREAM AND DELETE
    // TODO just return error_code and handle it on `on_read`
    if (ht_find_client(mqttuv.clients,
        (const char *) pkt->connect.payload.client_id)) {

        // Already connected client, 2 CONNECT packet should be interpreted as
        // a violation of the protocol, causing disconnection of the client

        sol_info("Received double CONNECT from %s, disconnecting client",
        pkt->connect.payload.client_id);
        ht_delete_client(&mqttuv.clients, (const char *) pkt->connect.payload.client_id);

        // Update stats
        info.nclients--;
        info.nconnections--;

        return -1;
        }

        // create a new client and add to the hashtable
        printf("in connect \n");


        struct client *new_client = sol_malloc(sizeof(*new_client));

        printf("here");
        const char *cid = (const char *) pkt->connect.payload.client_id;
        //assert(pkt != NULL);
        //assert(pkt->connect != NULL);
        assert(pkt->connect.payload.client_id != NULL);
        new_client->client_id = sol_strdup(cid);

        // printf("created new client\n");
        ht_put_client(&mqttuv.clients, new_client);
        // printf("added to hastable\n");
        if (pkt->connect.bits.clean_session == false){
            new_client->session.subscriptions = list_create(NULL);
        }

        if (pkt->connect.bits.clean_session == false)
            new_client->session.subscriptions = list_create(NULL);
        printf("connecting\n");
        /* Record the new client connected */

        // send back a connack messgae 
        union mqtt_packet *response = sol_malloc(sizeof(*response));
        unsigned char byte = CONNACK_BYTE;

    
        unsigned char session_present = 0;
        unsigned char connect_flags = 0 | (session_present & 0x1) << 0;
        unsigned char rc = 0;  // 0 means connection accepted
    
        response->connack = *mqtt_packet_connack(byte, connect_flags, rc);
    
        unsigned char *p = pack_mqtt_packet(response, CONNACK);

        write2(client, p, MQTT_ACK_LEN);
        
        info.nclients++;
        info.nconnections++;
     
 }


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
    printf("wrote.\n");
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
        printf("accepted someone!! yipee\n");
        uv_read_start((uv_stream_t *)client, alloc_buffer, on_read);  
    } else {
        uv_close((uv_handle_t *)client, NULL);
    }
 }


 static void on_read(uv_stream_t* client, ssize_t nread, const uv_buf_t* buf){
    // parse the buffer
    // parse head send to 
    if (nread < 0) {
        uv_close((uv_handle_t*) client, NULL);
        //free(buf->base);
        return;
    }

    char command;
    ssize_t parsed = parse_packet((unsigned char *)buf->base, nread, &command);

    // error from the parsed function
    if (parsed < 0){
        uv_close((uv_handle_t*) client, NULL);
        // free(buf->base);
        return;
    }
    union mqtt_packet packet;
    unpack_mqtt_packet((unsigned char *)buf->base, &packet);
    union mqtt_header hdr = { .byte = command };
    printf("command %d\n", command);
    switch(command >> 4){
        case(MQTT_CONNECT):
            // pass in the client stream, and the packet to the specfic handler
            connect_handler(client, &packet);
    }

    //free(buf->base);
 }
 
 
 
 
 int start_server(const char *addr, const char *port) {
 
    /* Initialize global Sol instance */
    mqttuv.clients = NULL;
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