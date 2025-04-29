import paho.mqtt.client as mqtt
import time
import sys

BROKER = "localhost"
PORT = 7000


def test_publish(topic):
    client = mqtt.Client(client_id="publisher")
    client.connect(BROKER, PORT)
    client.loop_start()

    client.publish(topic, payload=f"Message", qos=0)

    client.loop_stop()
    client.disconnect()

def test_publish_multi(topic):
    client = mqtt.Client(client_id="publisher")
    client.connect(BROKER, PORT)
    client.loop_start()

    for i in range(2):
        client.publish(topic, payload=f"Message{i}", qos=0)
        time.sleep(2)
        

    client.loop_stop()
    client.disconnect()