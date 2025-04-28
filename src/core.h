
#ifndef CORE_H
#define CORE_H

#include "uthash.h"
#include <uv.h>


struct subscriber {
    unsigned qos;
    struct client* client;
    struct subscriber *next;
};


// global data structures
struct info{
    struct client* clients;
    struct topic* topics;
};

struct client {
    char *client_id;
    uv_timer_t* timer;
    int keepalive; // number of seconds (i am already multiplying this by )
    // struct session session;
    uv_stream_t* stream;
    UT_hash_handle hh; /* makes this structure hashable */
};

// for testing trie
struct delivered {
    struct client *clients[10];
    int count;
};

extern struct delivered delivered_log;

struct topic{
    char *level;
    struct topic *children; // childern in next level
    struct topic *next; // siblings (in the same level)
    struct subscriber *subscribers; //list of clients to send to 
};


// client hashtables
void ht_put_client(struct client **glob, struct client *new_client);
struct client *ht_find_client(struct client *glob, const char *id);
void ht_delete_client(struct client **glob, const char *id);
void ht_delete_all_clients(struct client **glob);

// topic hashtables
// void ht_put_topic(struct topic **glob, struct topic *new_topic);
// struct topic *ht_find_topic(struct topic *glob, const char *name);
// void ht_delete_topic(struct topic **glob, const char *name);
// void ht_delete_all_topic(struct topic **glob);



#endif
