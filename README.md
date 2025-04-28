# MQTTuv
An MQTT broker with support for Quality of Service = 0 built using libuv. (QoS = 0 means packets are sent from the broker atmnost once and there is no guarantee of their delivery.)

## Functionality
The broker supports connecting, subscribing, publishing, disconnecting, unsubscribing, and MQTT keep alive funcitonality. 

### Subscribing and Publishing
A client can subscribe to a topic (a string using '/' to break it up into levels). A client can also subscribe to multi-level wildcards with '#' or single-level wildcards by using '+'. 
For example subscribing to 'a/#' would recieve all messages published to 'a/b', 'a/b/c', 'a/d', and subscribing to 'a/+/b' would get messages from 'a/b/b' and 'a/c/b'. A client can publish to any established topic. 

### Keepalive 
When a client connects to an MQTT broker is provides a keepalive time interval, if the client does not provide a message within 1.5x the interval provided, it is disconnected. A client can send PINGREQ packets to verify that the connection is still alive. This is implemented using uv_timer_t.

## Testing
Tests were written in C to verify the trie for storing the topic subscriptions is still working (isolated from publishing messages). Other tests were written using [paho-mqtt](https://pypi.org/project/paho-mqtt/) client python library. 

## Attributions
Packet parsing was done using functionality from the project [SOL](https://github.com/codepr/sol/tree/tutorial). Information about MQTT packet usage was taken from [HiveMQ](https://www.hivemq.com/). HashMap implementation was done using [Uthash](https://troydhanson.github.io/uthash/). 

## Building
Build and run using cmake. Python tests clients are provided in /tests. 

```
mkdir build
cd build
cmake ..
make 
./mqttuv -c ../sol/sol.conf
```

## Design
The design is heavily reliant on callback functions (it's libuv so obviously). Clients are accepts to the tcp server and sent to callback function on_accept. on_accept initalizes a stream for reading from the client. 
```
  if (uv_accept(server, (uv_stream_t *)client) == 0) {
        printf("accepted someone!! yipee\n");

        uv_read_start((uv_stream_t *)client, alloc_buffer, on_read);  
    } else {
        uv_close((uv_handle_t *)client, NULL);
    }
```
On_read() is then called when a packet is recieved. The packet is parsed and then based on the packet header is sent to the proper handler.
```
    switch(packet_type){
        case CONNECT:
            connect_handler( stream, &packet);
            break;
        case SUBSCRIBE:
            subscribe_handler( stream, &packet);
            break;
        case PUBLISH:
            printf("publish!\n");
            publish_handler(stream, &packet);
            break;
...
    }
```
In the connect handler, a client struct is created and added to a hashtable to store additional information. 
Topic subscribtions are added to a trie that breaks up a passed in string into levels. When a topic is published to, it walks through the trie and publishes, using recursion when a '#' or '+' is seen. 






