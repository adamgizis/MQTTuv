
import paho.mqtt.client as mqtt
import time

#Test Description: Client can connect to the broker and then disconnects gracefully. Graceful Disconnect is proven by successful reconnect using the same name


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

def on_disconnect(mqttc, obj, flags):
    print('Disconnected')

client = mqtt.Client(client_id="hello2")
client.on_connect = on_connect
client.on_subscribe = on_subscribe
client.on_message = on_message
client.on_disconnect = on_disconnect

client.connect(BROKER, PORT, keepalive = 10)
client.loop_start()
time.sleep(5)
client.disconnect()
client.loop_stop()
time.sleep(3)

#Clean disconnect should allow same client id to rejoin 
client.connect(BROKER, PORT, keepalive = 10)
client.loop_start()
time.sleep(5)
client.disconnect()
client.loop_stop()




