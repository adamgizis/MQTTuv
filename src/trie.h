#include "core.h"
#include "mqtt.h"
// Publishing and subscribing to 
struct topic *get_or_create_child(struct topic *, const char *);
void publish(struct topic *, const char *, union mqtt_packet *, int );
void publish_recursive(struct topic *, char **, int , int , union mqtt_packet *, int );
void insert_subscription(struct topic *, const char *, struct client *, int );
void unsubscribe(struct topic *, const char *, struct client *);