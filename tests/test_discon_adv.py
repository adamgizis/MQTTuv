import time
import threading
import paho.mqtt.client as mqtt

BROKER = "localhost"
PORT   = 7000
TOPIC  = "x"
KEEPALIVE = 5        

recv_first  = threading.Event()
recv_second = threading.Event()
sub_closed  = threading.Event()

def sub_on_connect(client, userdata, flags, rc):
    assert rc == 0, f"subscriber CONNECT failed rc={rc}"
    client.subscribe(TOPIC, qos=0)

def sub_on_message(client, userdata, msg):
    payload = msg.payload.decode()
    print(f"[sub] received '{payload}'")
    if payload == "first":
        recv_first.set()
    elif payload == "second":
        recv_second.set()

def sub_on_disconnect(client, userdata, rc):
    print("[sub] disconnected rc=", rc)
    sub_closed.set()

def pub_on_connect(client, userdata, flags, rc):
    assert rc == 0, f"publisher CONNECT failed rc={rc}"


sub = mqtt.Client(client_id="sub")
sub.on_connect    = sub_on_connect
sub.on_message    = sub_on_message
sub.on_disconnect = sub_on_disconnect
sub.connect(BROKER, PORT, KEEPALIVE)

pub = mqtt.Client(client_id="pub")
pub.on_connect = pub_on_connect
pub.connect(BROKER, PORT, KEEPALIVE)

sub.loop_start()
pub.loop_start()

time.sleep(1)               
pub.publish(TOPIC, "first")
assert recv_first.wait(3),   "subscriber never got first message"

sub.disconnect()            
assert sub_closed.wait(3),   "broker did not close TCP after DISCONNECT"

pub.publish(TOPIC, "second")
time.sleep(2)               

assert not recv_second.is_set(), (
    "FAIL: broker delivered message after subscriber disconnected"
)
print("PASS: broker cleaned up subscription and socket correctly")

pub.disconnect()
sub.loop_stop()
pub.loop_stop()

