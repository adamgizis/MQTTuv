import paho.mqtt.client as mqtt
import threading

BROKER = "localhost"
PORT = 7000

def make_client(name):
    def on_connect(client, userdata, flags, rc):
        print(f"[{name}] Connected to broker with return code: {rc}")
    
    client = mqtt.Client(client_id=name)
    client.on_connect = on_connect
    client.connect(BROKER, PORT)
    return client

def run_client(name):
    client = make_client(name)
    client.loop_forever()


threading.Thread(target=run_client, args=("client1",), daemon=True).start()
threading.Thread(target=run_client, args=("client2",), daemon=True).start()

try:
    while True:
        pass
except KeyboardInterrupt:
    print("Exiting...")
