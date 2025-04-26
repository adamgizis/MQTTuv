import paho.mqtt.client as mqtt
import time


BROKER = "localhost"
PORT = 7000

client = mqtt.Client(client_id = "testpub")


client.connect(BROKER, PORT, 60)

topic = "a/b"
message = "Hello from Python!"

time.sleep(3)
client.publish(topic, message)

print(f"Published '{message}' to topic '{topic}'")

client.disconnect()