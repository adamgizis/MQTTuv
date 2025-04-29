
#include <time.h>
#include <errno.h>
#include <unistd.h>
#include <string.h>
#include "../src/util.h"
#include "../src/pack.h"
#include "../src/core.h"
#include "../src/config.h"
#include "../src/server.h"
#include <uv.h> 
#include <stdlib.h>
#include "../src/uthash.h"
#include <assert.h>
#include "../src/mqtt.h"
#include "../src/trie.h"


// test to make sure root of topic trie is never null and create a not root sets it to the correct level
void test_get_or_create_child() {
    struct topic root = { .level = "", .children = NULL };

    struct topic *a = get_or_create_child(&root, "a");
    assert(a != NULL);
    assert(strcmp(a->level, "a") == 0);

    struct topic *again = get_or_create_child(&root, "a");
    assert(again == a); // should not create duplicate

    struct topic *b = get_or_create_child(&root, "b");
    assert(b != NULL);
    assert(strcmp(b->level, "b") == 0);
    printf("test_get_or_create_child passed\n");
}


// test to verify that node is created and client is added as a subscriber
void test_insert_subscription() {
    struct topic root = { .level = "", .children = NULL };
    struct client c1 = { .client_id = "client1" };

    insert_subscription(&root, "a/b", &c1, 1);

    struct topic *a = root.children;
    assert(a && strcmp(a->level, "a") == 0);

    struct topic *b = a->children;
    assert(b && strcmp(b->level, "b") == 0);
    assert(b->subscribers && b->subscribers->client == &c1);
    printf("test_insert_subscription passed\n");
}

// Using the test version of write2subs publishes to a single 
void test_publish_exact_and_wildcard() {
    struct topic root = { .level = "", .children = NULL };
    struct client c1 = { .client_id = "c1" };
    struct client c2 = { .client_id = "c2" };
    struct client c3 = { .client_id = "c3" };

    insert_subscription(&root, "foo/bar", &c1, 0);
    insert_subscription(&root, "foo/+", &c2, 0);
    insert_subscription(&root, "foo/#", &c3, 0);

    union mqtt_packet* pkt;
    
    // pack_mqtt_packet(pkt, CONNECT);

    publish(&root, "foo/bar", NULL, 0);

    printf("%d", delivered_log.count == 3);
    assert(delivered_log.count == 3);
    assert(delivered_log.clients[0] == &c3); 
    assert(delivered_log.clients[1] == &c2); 
    assert(delivered_log.clients[2] == &c1); 

    printf("test_publish_exact_and_wildcard passed\n");
}




int main() {
    test_get_or_create_child();
    test_insert_subscription();
    test_publish_exact_and_wildcard();
    return 0;
}