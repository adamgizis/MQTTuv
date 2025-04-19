/* BSD 2-Clause License
 *
 * Copyright (c) 2019, Andrea Giacomo Baldan All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * * Redistributions of source code must retain the above copyright notice,
 * this list of conditions and the following disclaimer.
 *
 * * Redistributions in binary form must reproduce the above copyright notice,
 * this list of conditions and the following disclaimer in the documentation
 * and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 */

 #include <time.h>
 #include <errno.h>
 #include <unistd.h>
 #include <string.h>
 #include <arpa/inet.h>
 #include <sys/socket.h>
 #include <sys/epoll.h>
 #include "network.h"
 #include "mqtt.h"
 #include "util.h"
 #include "pack.h"
 #include "core.h"
 #include "config.h"
 #include "server.h"
 #include "hashtable.h"
 #include <uv.h> 
 #include <stdlib.h>
 /*
  * General informations of the broker, all fields will be published
  * periodically to internal topics
  */
 static struct sol_info info;
 
 /* Broker global instance, contains the topic trie and the clients hashtable */
 static struct sol sol;

 // global event loop
 struct uv_loop_t* loop;
 
 /* Prototype for a command handler */
 typedef int handler(struct closure *, union mqtt_packet *);
 
 /* I/O closures, for the 3 main operation of the server
  * - Accept a new connecting client
  * - Read incoming bytes from connected clients
  * - Write output bytes to connected clients
  */
 
 static void on_accept( uv_stream_t *, int);
 static void on_read(uv_stream_t* , ssize_t, const uv_buf_t*);

// memory callback
 static void alloc_buffer(uv_handle_t *, size_t , uv_buf_t *);
 
 /* Command handler, each one have responsibility over a defined command packet */
 static int connect_handler(struct closure *, union mqtt_packet *);
 /*
  * Connection structure for private use of the module, mainly for accepting
  * new connections
  */
 struct connection {
     char ip[INET_ADDRSTRLEN + 1];
     int fd;
 };
 
 /*
  * Parse packet header, it is required at least the Fixed Header of each
  * packed, which is contained in the first 2 bytes in order to read packet
  * type and total length that we need to recv to complete the packet.
  *
  * This function accept a socket fd, a buffer to read incoming streams of
  * bytes and a structure formed by 2 fields:
  *
   * - buf -> a byte buffer, it will be malloc'ed in the function and it will
  *          contain the serialized bytes of the incoming packet
  * - flags -> flags pointer, copy the flag setting of the incoming packet,
  *            again for simplicity and convenience of the caller.
  */
 static ssize_t recv_packet(int clientfd, unsigned char *buf, char *command) {
 
     ssize_t nbytes = 0;
 
     /* Read the first byte, it should contain the message type code */
     if ((nbytes = recv_bytes(clientfd, buf, 1)) <= 0)
         return -ERRCLIENTDC;
 
     unsigned char byte = *buf;
     buf++;
 
     if (DISCONNECT < (byte >> 4) || CONNECT > (byte >> 4))
         return -ERRPACKETERR;
 
     /*
      * Read remaning length bytes which starts at byte 2 and can be long to 4
      * bytes based on the size stored, so byte 2-5 is dedicated to the packet
      * length.
      */
     unsigned char buff[4];
     int count = 0;
     int n = 0;
     do {
         if ((n = recv_bytes(clientfd, buf+count, 1)) <= 0)
             return -ERRCLIENTDC;
         buff[count] = buf[count];
         nbytes += n;
     } while (buff[count++] & (1 << 7));
 
     // Reset temporary buffer
     const unsigned char *pbuf = &buff[0];
     unsigned long long tlen = mqtt_decode_length(&pbuf);
 
     /*
      * Set return code to -ERRMAXREQSIZE in case the total packet len exceeds
      * the configuration limit `max_request_size`
      */
     if (tlen > conf->max_request_size) {
         nbytes = -ERRMAXREQSIZE;
         goto exit;
     }
 
     /* Read remaining bytes to complete the packet */
     if ((n = recv_bytes(clientfd, buf + 1, tlen)) < 0)
         goto err;
 
     nbytes += n;
 
     *command = byte;
 
 exit:
 
     return nbytes;
 
 err:
 
     shutdown(clientfd, 0);
     close(clientfd);
 
     return nbytes;
 
 }
 
 
 static int connect_handler(struct closure *cb, union mqtt_packet *pkt) {

    // IF ALREADY IN HASHTABLE DISCONNECT THE STREAM AND DELETE
    // ELSE ADD to client hashtable
    // send back CONNACK

    /* Record the new client connected */
    info.nclients++;
    info.nconnections++;
     
 }


 static void alloc_buffer(uv_handle_t *handle, size_t suggested_size, uv_buf_t *buf){
    buf->base = sol_malloc(conf->max_request_size);
    buf->len = suggested_size;
 }
 
 
 
 static void on_accept(uv_stream_t *server, int status) {
    if (status < 0) {
        sol_debug("New connection error: %s\n", uv_strerror(status));
        return;
    }

    uv_tcp_t *client = malloc(sizeof(uv_tcp_t));
    uv_tcp_init(server->loop, client);

    if (uv_accept(server, (uv_stream_t *)client) == 0) {
        uv_read_start((uv_stream_t *)client, alloc_buffer, on_read);  
    } else {
        uv_close((uv_handle_t *)client, NULL);
    }
 }

 static void on_read(uv_stream_t* client, ssize_t nread, const uv_buf_t* buf){
    // parse the buffer

    printf("here");
    // parse head send to 

 }
 



 /*
  * Cleanup function to be passed in as destructor to the Hashtable for
  * connecting clients
  */
 static int client_destructor(struct hashtable_entry *entry) {
 
     if (!entry)
         return -1;
 
     struct sol_client *client = entry->val;
 
     if (client->client_id)
         sol_free(client->client_id);
 
     buffer_release(&client->buf);
 
     sol_free(client);
 
     return 0;
 }
 
 /*
  * Cleanup function to be passed in as destructor to the Hashtable for
  * registered closures.
  */
 static int closure_destructor(struct hashtable_entry *entry) {
 
     if (!entry)
         return -1;
 
     struct closure *closure = entry->val;
 
     if (closure->payload)
         bytestring_release(closure->payload);
 
     sol_free(closure);
 
     return 0;
 }
 
 
 int start_server(const char *addr, const char *port) {
 
    /* Initialize global Sol instance */
    trie_init(&sol.topics);
    sol.clients = hashtable_create(client_destructor);
    sol.closures = hashtable_create(closure_destructor);

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
    hashtable_release(sol.clients);
    hashtable_release(sol.closures);

    sol_info("Sol v%s exiting", VERSION);

    return 0;
 }