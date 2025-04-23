
#ifndef CORE_H
#define CORE_H

#include "trie.h"
#include "list.h"
#include "uthash.h"




struct topic {
    const char *name;
    List *subscribers;
};

struct session {
    List *subscriptions;
    // TODO add pending confirmed messages
};

struct info{
    struct client* clients;

};

struct client {
    char *client_id;
    struct session session;
    struct uv_stream_t* stream;
    UT_hash_handle hh; /* makes this structure hashable */
};


struct subscriber {
    unsigned qos;
    struct sol_client *client;
};


void ht_put_client(struct client **glob, struct client *new_client);


struct client *ht_find_client(struct client *glob, const char *id);

void ht_delete_client(struct client **glob, const char *id);

void ht_delete_all_clients(struct client **glob);



#endif
