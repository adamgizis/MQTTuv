
 #ifndef CORE_H
 #define CORE_H
 
 #include "network.h"
 #include "uthash.h"
 
 
 struct topic {
     const char *name;
     List *subscribers;
 };
 
 /*
  * Main structure, a global instance will be instantiated at start, tracking
  * topics, connected clients and registered closures.
  */
 struct sol {
     HashTable *clients;
     HashTable *closures;
     Trie topics;
 };
 
 
 struct session {
     List *subscriptions;
     // TODO add pending confirmed messages
 };
 
 /*
  * Wrapper structure around a connected client, each client can be a publisher
  * or a subscriber, it can be used to track sessions too.
  */
 struct sol_client {
     char *client_id;
     int fd;
     struct session session;
     struct buffer buf;
 };
 
 
 struct subscriber {
     unsigned qos;
     struct sol_client *client;
 };
 
 
 struct topic *topic_create(const char *);
 
 void topic_init(struct topic *, const char *);
 
 void topic_add_subscriber(struct topic *, struct sol_client *, unsigned, bool);
 
 void topic_del_subscriber(struct topic *, struct sol_client *, bool);
 
 void sol_topic_put(struct sol *, struct topic *);
 
 void sol_topic_del(struct sol *, const char *);
 
 /* Find a topic by name and return it */
 struct topic *sol_topic_get(struct sol *, const char *);
 
 
 #endif