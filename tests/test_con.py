import paho.mqtt.client as mqtt

## Test to comfirm MQTT recieves connect and replies with a CONNACK

BROKER = "localhost"
PORT = 7000

def on_connect(client, userdata, flags, rc):
    print("Connected to broker with return code:", rc)

client = mqtt.Client(client_id = "hello")  # MQTT v3.1.1 client by default

client.on_connect = on_connect

client.connect(BROKER, PORT)
client.loop_forever()


