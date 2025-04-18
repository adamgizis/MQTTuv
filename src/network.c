#include <uv.h>
#include <stdlib.h>
#include <stdio.h>
#include <errno.h>
#include <netdb.h>
#include <unistd.h>
#include <fcntl.h>
#include <string.h>
#include "util.h"
#include "network.h"

static const int INITIAL_BUFLEN = 4;


void buffer_create(struct buffer *buf) {
    buf->bytes = malloc(INITIAL_BUFLEN);
    buf->size = INITIAL_BUFLEN;
    buf->start = buf->end = 0;
}


void buffer_release(struct buffer *buf) {
    free(buf->bytes);
    buf->bytes = NULL;
    buf->start = buf->end = 0;
}


void buffer_push_back(struct buffer *buf, unsigned char *bytes, size_t len) {

    // Re-size buffer in case of len surpassing buffer size
    if (len > buf->size / 2) {
        buf->size *= 2;
        buf->bytes = sol_realloc(buf->bytes, buf->size);
    }

    memcpy(buf->bytes + buf->end, bytes, len);
    buf->end += len;

}

int buffer_empty(const struct buffer *buf) {
    return buf->end == buf->start;
}