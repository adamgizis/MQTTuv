from multiprocessing import Process
from test_pub import test_publish_multi
from test_sub_unsub import test_subscribe_unsubscribe
import paho.mqtt.client as mqtt
import time

BROKER = "localhost"
PORT = 7000
TOPIC = "a/b"

def on_connect(client, userdata, flags, rc):
    print("Connected to broker with return code:", rc)
    if rc == 0:
        client.subscribe((TOPIC, 0))  
    else:
        print("Failed to connect")

def on_subscribe(client, userdata, mid, granted_qos):
    print("Successfully subscribed to topic:", TOPIC)

def on_message(client, userdata, msg):
    print(f"Received message on topic {msg.topic}: {msg.payload.decode()}")
    client.unsubscribe(TOPIC)

def on_unsubscribe(client, userdate, mid):
    print(f"Unsubscribed {mid}")
client = mqtt.Client(client_id="unsub")
client.on_connect = on_connect
client.on_subscribe = on_subscribe
client.on_message = on_message
client.on_unsubscribe = on_unsubscribe

client.connect(BROKER, PORT)
client.loop_forever()