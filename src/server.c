
#include <time.h>
#include <errno.h>
#include <unistd.h>
#include <string.h>
#include <uv.h>
#include "network.h"
#include "mqtt.h"
#include "pack.h"
#include "server.h"
#include "uthash.h"


// info on number of current connections and total connections
static struct info info;

/* Broker global instance, contains the topic trie and the clients hashtable */
static struct sol sol;

/*
* Statistics topics, published every N seconds defined by configuration
* interval
*/
#define SYS_TOPICS 14

static const char *sys_topics[SYS_TOPICS] = {
   "$SOL/",
   "$SOL/broker/",
   "$SOL/broker/clients/",
   "$SOL/broker/bytes/",
   "$SOL/broker/messages/",
   "$SOL/broker/uptime/",
   "$SOL/broker/uptime/sol",
   "$SOL/broker/clients/connected/",
   "$SOL/broker/clients/disconnected/",
   "$SOL/broker/bytes/sent/",
   "$SOL/broker/bytes/received/",
   "$SOL/broker/messages/sent/",
   "$SOL/broker/messages/received/",
   "$SOL/broker/memory/used"
};


/* Prototype for a command handler */
typedef int handler(struct closure *, union mqtt_packet *);

/* I/O closures, for the 3 main operation of the server
* - Accept a new connecting client
* - Read incoming bytes from connected clients
* - Write output bytes to connected clients
*/
static void on_read(struct evloop *, void *);

static void on_write(struct evloop *, void *);

static void on_accept(struct evloop *, void *);

/* Command handler, each one have responsibility over a defined command packet */
static int connect_handler(struct closure *, union mqtt_packet *);

static int disconnect_handler(struct closure *, union mqtt_packet *);

static int subscribe_handler(struct closure *, union mqtt_packet *);

static int unsubscribe_handler(struct closure *, union mqtt_packet *);

static int publish_handler(struct closure *, union mqtt_packet *);

static int puback_handler(struct closure *, union mqtt_packet *);

static int pubrec_handler(struct closure *, union mqtt_packet *);

static int pubrel_handler(struct closure *, union mqtt_packet *);

static int pubcomp_handler(struct closure *, union mqtt_packet *);

static int pingreq_handler(struct closure *, union mqtt_packet *);

/* Command handler mapped usign their position paired with their type */
static handler *handlers[15] = {
   NULL,
   connect_handler,
   NULL,
   publish_handler,
   puback_handler,
}

/*
* Cleanup function to be passed in as destructor to the Hashtable for
* registered closures.
*/
static int closure_destructor(struct hashtable_entry *entry) {

   if (!entry)
       return -1;

   struct closure *closure = entry->val;

   if (closure->payload)
       bytestring_release(closure->payload);

   sol_free(closure);

   return 0;
}


int start_server(const char *addr, const char *port) {

   /* Initialize global Sol instance */
   trie_init(&sol.topics);
   sol.clients = hashtable_create(client_destructor);
   sol.closures = hashtable_create(closure_destructor);

   struct closure server_closure;

   /* Initialize the sockets, first the server one */
   server_closure.fd = make_listen(addr, port, conf->socket_family);
   server_closure.payload = NULL;
   server_closure.args = &server_closure;
   server_closure.call = on_accept;
   generate_uuid(server_closure.closure_id);

   /* Generate stats topics */
   for (int i = 0; i < SYS_TOPICS; i++)
       sol_topic_put(&sol, topic_create(sol_strdup(sys_topics[i])));

   struct evloop *event_loop = evloop_create(EPOLL_MAX_EVENTS, EPOLL_TIMEOUT);

   /* Set socket in EPOLLIN flag mode, ready to read data */
   evloop_add_callback(event_loop, &server_closure);

   /* Add periodic task for publishing stats on SYS topics */
   // TODO Implement
   struct closure sys_closure = {
       .fd = 0,
       .payload = NULL,
       .args = &sys_closure,
       .call = publish_stats
   };

   generate_uuid(sys_closure.closure_id);

   /* Schedule as periodic task to be executed every 5 seconds */
   evloop_add_periodic_task(event_loop, conf->stats_pub_interval,
                            0, &sys_closure);

   sol_info("Server start");
   info.start_time = time(NULL);

   run(event_loop);

   hashtable_release(sol.clients);
   hashtable_release(sol.closures);

   sol_info("Sol v%s exiting", VERSION);

   return 0;
}