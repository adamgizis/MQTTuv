import paho.mqtt.client as mqtt
import time

# Test Description: Verifies that a client can connect and disconnect from the broker correctly

BROKER = "localhost"
PORT = 7000

def on_connect(client, userdata, flags, rc):
    print("Success: Connected to broker with return code:", rc)

def on_disconnect(mqttc, obj, flags):
    print("Success: Disconnected")

client = mqtt.Client(client_id = "hello")  # MQTT v3.1.1 client by default

client.on_connect = on_connect
client.on_disconnect = on_disconnect


client.connect(BROKER, PORT, keepalive = 10)

client.loop_start()
time.sleep(5)
client.disconnect()
client.loop_stop()


