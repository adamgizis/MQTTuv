import paho.mqtt.client as mqtt
import time

## Test to comfirm MQTT recieves connect and replies with a CONNACK

BROKER = "localhost"
PORT = 7000

def on_connect(client, userdata, flags, rc):
    print("Connected to broker with return code:", rc)

client = mqtt.Client(client_id = "hello")  # MQTT v3.1.1 client by default

client.on_connect = on_connect


client.connect(BROKER, PORT, keepalive = 10)
client.loop_start()
time.sleep(5)
client.disconnect()
client.loop_stop()


