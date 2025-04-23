#include <string.h>
#include <stdlib.h>
#include "uthash.h"
#include "core.h"

void ht_put_client(struct client **glob, struct client *new_client) {
    HASH_ADD_STR(*glob, client_id, new_client);
}

struct client *ht_find_client(struct client *glob, const char *id) {
    struct client *s;
    HASH_FIND_STR(glob, id, s);
    return s;
}

void ht_delete_client(struct client **glob, const char *id) {
    struct client *client;
    HASH_FIND_STR(*glob, id, client);
    if (client) {
        HASH_DEL(*glob, client);
        free(client);  // Ensure all internal data is heap-allocated
    }
}

void ht_delete_all_clients(struct client **glob) {
    struct client *current_client, *tmp;
    HASH_ITER(hh, *glob, current_client, tmp) {
        HASH_DEL(*glob, current_client);
        free(current_client);
    }
}

// topic hashtables
void ht_put_topic(struct topic **glob, struct topic *new_topic){
    HASH_ADD_STR(*glob, name, new_topic);
}
struct topic *ht_find_topic(struct topic *glob, const char *name){
    struct topic *s;
    HASH_FIND_STR(glob, name, s);
    return s;

}
void ht_delete_topic(struct topic **glob, const char *name){
    struct topic *top;
    HASH_FIND_STR(*glob, name, top);
    if (top) {
        HASH_DEL(*glob, top);
        free(top);  // Ensure all internal data is heap-allocated
    }
}
void ht_delete_all_topic(struct topic **glob){
    struct topic *current_top, *tmp;
    HASH_ITER(hh, *glob, current_top, tmp) {
        HASH_DEL(*glob, current_top);
        free(current_top);
    }
}