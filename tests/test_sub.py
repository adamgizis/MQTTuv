import paho.mqtt.client as mqtt

BROKER = "localhost"
PORT = 7000
TOPIC = "a/#"

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

client = mqtt.Client(client_id="hello2")
client.on_connect = on_connect
client.on_subscribe = on_subscribe
client.on_message = on_message

client.connect(BROKER, PORT)
client.loop_forever()
