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
 #include <ctype.h>
 #include <errno.h>
 #include <assert.h>
 #include <string.h>
 #include <stdlib.h>
 #include <stdarg.h>

 #include "util.h"
 
 
 static FILE *fh = NULL;
 

 /*
  * Custom malloc function, allocate a defined size of bytes plus 8, the size
  * of an unsigned long long, and append the length choosen at the beginning of
  * the memory chunk as an unsigned long long, returning the memory chunk
  * allocated just 8 bytes after the start; this way it is possible to track
  * the memory usage at every allocation
  */
 void *sol_malloc(size_t size) {
 
     assert(size > 0);
 
     void *ptr = malloc(size + sizeof(size_t));
 
     if (!ptr)
         return NULL;

 
     *((size_t *) ptr) = size;
 
     return (char *) ptr + sizeof(size_t);
 }
 
 /*
  * Same as sol_malloc, but with calloc, creating chunk o zero'ed memory.
  * TODO: still a suboptimal solution
  */
 void *sol_calloc(size_t len, size_t size) {
 
     assert(len > 0 && size > 0);
 
     void *ptr = calloc(len, size + sizeof(size_t));
 
     if (!ptr)
         return NULL;
 
     *((size_t *) ptr) = size;
     return (char *) ptr + sizeof(size_t);
 }
 
 /*
  * Same of sol_malloc but with realloc, resize a chunk of memory pointed by a
  * given pointer, again appends the new size in front of the byte array
  */
 void *sol_realloc(void *ptr, size_t size) {
 
     assert(size > 0);
 
     if (!ptr)
         return sol_malloc(size);
 
     void *realptr = (char *)ptr-sizeof(size_t);
 
     size_t curr_size = *((size_t *) realptr);
 
     if (size == curr_size)
         return ptr;
 
     void *newptr = realloc(realptr, size + sizeof(size_t));
 
     if (!newptr)
         return NULL;
 
     *((size_t *) newptr) = size;
 
     return (char *) newptr + sizeof(size_t);
 
 }
 
 /*
  * Custom free function, must be used on memory chunks allocated with t*
  * functions, it move the pointer 8 position backward by the starting address
  * of memory pointed by `ptr`, this way it knows how many bytes will be
  * free'ed by the call
  */
 void sol_free(void *ptr) {
 
     if (!ptr)
         return;
 
     void *realptr = (char *) ptr - sizeof(size_t);
 
     if (!realptr)
         return;
 
     size_t ptr_size = *((size_t *) realptr);
 
 
     free(realptr);
 }
 
 /*
  * Retrieve the bytes allocated by t* functions by backwarding the pointer of
  * 8 positions, the size of an unsigned long long in order to read the number
  * of allcated bytes
  */
 size_t malloc_size(void *ptr) {
 
     if (!ptr)
         return 0L;
 
     void *realptr = (char *) ptr - sizeof(size_t);
 
     if (!realptr)
         return 0L;
 
     size_t ptr_size = *((size_t *) realptr);
 
     return ptr_size;
 }
 
 /*
  * As strdup but using sol_malloc instead of malloc, to track the number of bytes
  * allocated and to enable use of sol_free on duplicated strings without having
  * to care when to use a normal free or a sol_free
  */
 char *sol_strdup(const char *s) {
 
     char *ds = sol_malloc(strlen(s) + 1);
 
     if (!ds)
         return NULL;
 
     // TODO: Bugged, change to snprintf
     strcpy(ds, s);
 
     return ds;
 }