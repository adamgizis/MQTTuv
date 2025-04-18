
 #ifndef NETWORK_H
 #define NETWORK_H
 
 #include <stdio.h>
 #include <stdint.h>
 #include <sys/types.h>
 #include <uv.h>
 
 /*
  * Buffer queue, mainly for remaining bytes to send, for EWOULDBLOCK or EAGAIN
  * on non-blocking socket
  */
 struct buffer {
     size_t size;
     size_t start;
     size_t end;
     unsigned char *bytes;
 };
 
 // Buffer build functions
 void buffer_create(struct buffer *);
 
 void buffer_release(struct buffer *);
 
 /* Copy an array of bytes into the buffer */
 void buffer_push_back(struct buffer *, unsigned char *, size_t);
 
 /* Check if the buffer is empty by comparing start and end cursors */
 int buffer_empty(const struct buffer *);
 
 #endif