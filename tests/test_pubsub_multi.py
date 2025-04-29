from multiprocessing import Process
from test_pub import test_publish
from test_sub import test_subscribe
import time
import random
#Test publishes to a topic with subscribers
#Subscribers Recieve message and then exit
# All three return == success

def multi(topic, subscribed_to):

    # Create multiple subscribers
    subscribers = []
    num_subscribers = 3

    for i in range(num_subscribers):
        clientid = f"client{random.randint(1, 100)}"
        subscriber = Process(target=test_subscribe, args=(subscribed_to,clientid))
        subscribers.append(subscriber)
        subscriber.start()
        time.sleep(0.5)  # Stagger just in case

    time.sleep(2)  # Give subscribers enough time to connect

    # Start publisher
    publisher = Process(target=test_publish, args=(topic,))
    publisher.start()

    publisher.join()

    for subscriber in subscribers:
        subscriber.join()

    print(f"SUCCESS: topic {topic}, subscribers subscribed to {subscribed_to} ")

def main():

    #Test for same topic, same subscription
    multi(topic = "a/b", subscribed_to = "a/b")
    time.sleep(3) # ENSURE all disconnects went out
    #Test for multi level wildcard
    multi(topic = "a/b/c", subscribed_to = "a/#")
    time.sleep(3) # ENSURE all disconnects went out
    #Test for single level wildcard
    multi(topic = "a/b/c", subscribed_to = "a/+/c")
    time.sleep(3) # ENSURE all disconnects went out



if __name__ == "__main__":
    main()