
#ifndef CORE_H
#define CORE_H

#include "trie.h"
#include "list.h"
#include "uthash.h"
#include <uv.h>


struct subscriber {
    unsigned qos;
    struct client* client;
    struct subscriber *next;
};

struct topic {
    char *name;// topic name (same as key, but handy to keep)
    struct subscriber *head;
    struct subscriber *tail;
    UT_hash_handle hh; // required by uthash
};

struct session {
    List *subscriptions;
    // TODO add pending confirmed messages
};

struct info{
    struct client* clients;
    struct topic* topics;
};

struct client {
    char *client_id;
    struct session session;
    uv_stream_t* stream;
    UT_hash_handle hh; /* makes this structure hashable */
};


// client hashtables
void ht_put_client(struct client **glob, struct client *new_client);
struct client *ht_find_client(struct client *glob, const char *id);
void ht_delete_client(struct client **glob, const char *id);
void ht_delete_all_clients(struct client **glob);

// topic hashtables
void ht_put_topic(struct topic **glob, struct topic *new_topic);
struct topic *ht_find_topic(struct topic *glob, const char *name);
void ht_delete_topic(struct topic **glob, const char *name);
void ht_delete_all_topic(struct topic **glob);



#endif
