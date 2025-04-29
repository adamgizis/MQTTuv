import paho.mqtt.client as mqtt
import sys

BROKER = "localhost"
PORT = 7000
count = 0
def on_message(client, userdata, msg):
    #print(f"Success received message: {msg.payload.decode()}")
    client.disconnect()
    sys.exit(0)

def test_subscribe(topic,id):
    
    client = mqtt.Client(client_id=id)
    client.on_message = on_message

    client.connect(BROKER, PORT)
    client.subscribe(topic, qos = 0)

    client.loop_forever()

