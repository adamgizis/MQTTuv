from multiprocessing import Process
from test_pub import test_publish_multi
from test_sub_unsub import test_subscribe_unsubscribe
import time

def main():
    topic = "test/topic"

    subscriber = Process(target=test_subscribe_unsubscribe, args=(topic,))
    subscriber.start()

    time.sleep(2)

    publisher = Process(target=test_publish_multi, args=(topic,))
    publisher.start()



    publisher.join()
    subscriber.join()
    

    print("Unsubscribe test completed.")

if __name__ == "__main__":
    main()
