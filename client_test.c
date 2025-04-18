
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <uv.h>
#include "mqtt/paho.mqtt.embedded-c/MQTTPacket/src/MQTTPacket.h"

// Client will send the mqtt connect packet and recieve the connack packet


static void on_close(uv_handle_t* handle);
static void on_connect(uv_connect_t* req, int status);
static void on_write(uv_write_t* req, int status);

static uv_loop_t *loop;

static void alloc_cb(uv_handle_t* handle, size_t size, uv_buf_t* buf) {
    printf("size = %ld\n", size);
    size = 100;
    *buf = uv_buf_init(malloc(size), size);
}

void on_close(uv_handle_t* handle)
{
  printf("closed.");
  free(handle);
}

void on_write(uv_write_t* req, int status)
{
  if (status) {
    perror( "uv_write error ");
        return;
  }
    printf("wrote.\n");
    free(req);
    //uv_close((uv_handle_t*)req->handle, on_close);
}

void on_read(uv_stream_t* tcp, ssize_t nread, const uv_buf_t* buf)
{
    if(nread >= 0) {
        //printf("read: %s\n", tcp->data);
        printf("read: %s\n", buf->base);
        unsigned char sessionPresent;
        unsigned char connack_rc;

        int success = MQTTDeserialize_connack(
            &sessionPresent,
            &connack_rc,
            (unsigned char *)buf->base,
            nread
        );
        printf("sessionPresent %d, connack_rc = %d \n", sessionPresent,connack_rc );
        if(success && sessionPresent == 1 && connack_rc == 77){
            printf("got success\n");
        }else{
            printf("what the \n");
        }
    }
    else {
        //we got an EOF
    uv_close((uv_handle_t*)tcp, on_close);
    }

    //cargo-culted
    free(buf->base);
}

// void write2(uv_stream_t* stream, char *data, int len2) {
//     uv_buf_t buffer[] = {
//         {.base = data, .len = len2}
//     };
//     uv_write_t *req = malloc(sizeof(uv_write_t));
//     uv_write(req, stream, buffer, 1, on_write);
// }

void on_connect(uv_connect_t* connection, int status)
{
    if (status < 0) {
        printf("failed to connect\n"); return;
    }
    printf("connected. %p %d\n",connection, status);

    uv_stream_t* stream = connection->handle;
    free(connection);
    // write2(stream, "echo  world!", 12);
    uv_read_start(stream, alloc_cb, on_read);
}

void startConn(char *host, int port) {
    uv_tcp_t *pSock = malloc(sizeof(uv_tcp_t));
    uv_tcp_init(loop, pSock);
    uv_tcp_keepalive(pSock, 1, 60);

    struct sockaddr_in dest;
    uv_ip4_addr(host, port, &dest);

    uv_connect_t *pConn = malloc(sizeof(uv_connect_t));
    // printf("allocated %p\n", pConn);
    uv_tcp_connect(pConn, pSock, (const struct sockaddr*)&dest, on_connect);
}

int main(int argc, char **argv) {
    loop = uv_default_loop();
    int i;
    for (i=0; i<10; i++)
        startConn("127.0.0.1", 7000);

    uv_run(loop, UV_RUN_DEFAULT);
}
