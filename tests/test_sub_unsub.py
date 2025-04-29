import paho.mqtt.client as mqtt
import time
import sys

BROKER = "localhost"
PORT = 7000

def test_subscribe_unsubscribe(topic, client_id=None):
    received_before_unsubscribe = False

    def on_message(client, userdata, msg):
        nonlocal received_before_unsubscribe
        if not received_before_unsubscribe:
            print(f"[{client._client_id.decode()}] First Message Now Unsubscribing")
            received_before_unsubscribe = True

            client.unsubscribe(topic)
        else:
            print(f"[{client._client_id.decode()}] Error: Message received AFTER unsubscribing! Test Failed.")
            sys.exit(1)

    if client_id is None:
        client_id = f"subscriber"

    client = mqtt.Client(client_id=client_id)
    client.on_message = on_message

    client.connect(BROKER, PORT)
    client.subscribe(topic, qos=0)

    client.loop_start()

    # Give it some time to receive messages
    try:
        while True:
            time.sleep(1)
    except KeyboardInterrupt:
        client.loop_stop()
        client.disconnect()

