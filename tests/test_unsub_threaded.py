from multiprocessing import Process
import paho.mqtt.client as mqtt
import time

BROKER = "localhost"
PORT = 7000
TOPIC = "a/b"

def publisher():
    client = mqtt.Client(client_id="testpub")
    client.connect(BROKER, PORT, 60)

    time.sleep(3)
    client.publish(TOPIC, "Hello")

    time.sleep(3)
    client.publish("a/d", "howdy")

    print(f"Published messages to topics.")

    client.loop_forever()

def subscriber():
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

    def on_unsubscribe(client, userdata, mid):
        print(f"Unsubscribed")

    client = mqtt.Client(client_id="unsub")
    client.on_connect = on_connect
    client.on_subscribe = on_subscribe
    client.on_message = on_message
    client.on_unsubscribe = on_unsubscribe

    client.connect(BROKER, PORT, 60)
    client.loop_forever()

def main():
    sub_proc = Process(target=subscriber)
    pub_proc = Process(target=publisher)

    sub_proc.start()
    time.sleep(2)  
    pub_proc.start()

    pub_proc.join()
    sub_proc.join()

    print("Done.")

if __name__ == "__main__":
    main()
