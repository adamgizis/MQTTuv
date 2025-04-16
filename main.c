#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <uv.h>
#include "MQTTPacket.h"

uv_loop_t *loop;

void alloc_buffer(uv_handle_t *handle, size_t suggested_size, uv_buf_t *buf) {
    buf->base = malloc(suggested_size);
    buf->len = suggested_size;
}

void on_write_complete(uv_write_t *req, int status) {
    if (status < 0) {
        fprintf(stderr, "Write failed: %s\n", uv_strerror(status));
    }
    free(req);
}

void on_new_connection(uv_stream_t *server, int status) {
    if (status < 0) {
        fprintf(stderr, "New connection error: %s\n", uv_strerror(status));
        return;
    }

    uv_tcp_t *client = malloc(sizeof(uv_tcp_t));
    uv_tcp_init(loop, client);

    if (uv_accept(server, (uv_stream_t *)client) == 0) {
        printf("connected client\n");
        // Create a message to send to the client
        const char *message = "Hello from server!";
        uv_buf_t write_buf = uv_buf_init((char *)message, strlen(message));

        uv_write_t *write_req = malloc(sizeof(uv_write_t));
        uv_write(write_req, (uv_stream_t *)client, &write_buf, 1, on_write_complete);


    } else {
        uv_close((uv_handle_t *)client, NULL);
    }
}

int main() {
    loop = uv_default_loop();

    uv_tcp_t server;
    uv_tcp_init(loop, &server);

    struct sockaddr_in addr;
    uv_ip4_addr("0.0.0.0", 7000, &addr);

    uv_tcp_bind(&server, (const struct sockaddr*)&addr, 0);

    int r = uv_listen((uv_stream_t *)&server, 128, on_new_connection);
    if (r) {
        fprintf(stderr, "Listen error: %s\n", uv_strerror(r));
        return 1;
    }

    return uv_run(loop, UV_RUN_DEFAULT);
}
