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
