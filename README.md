# MQTTuv
Attempting to use cmake. Must have libuv already installed

```
mkdir build
cd build
cmake ..
make 
./mqttuv -c ../sol/sol.conf
```

To Test the Subscription Trie alone
```
./test_trie
```
for now have been testing with nc localhost 7000 to verify connection is being made
