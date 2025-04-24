# CMake generated Testfile for 
# Source directory: /local/MQTTuv
# Build directory: /local/MQTTuv/build
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(mqttuv_tests "/local/MQTTuv/build/tests/test_mqttuv")
set_tests_properties(mqttuv_tests PROPERTIES  _BACKTRACE_TRIPLES "/local/MQTTuv/CMakeLists.txt;32;add_test;/local/MQTTuv/CMakeLists.txt;0;")
subdirs("tests")
