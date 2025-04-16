cmake_minimum_required(VERSION 3.10)
project(mqttuv C)

set(CMAKE_C_STANDARD 11)

# Include libuv (system-wide)
find_package(PkgConfig REQUIRED)
pkg_check_modules(LIBUV REQUIRED libuv)

# Add Paho MQTT embedded C as a subdirectory
add_subdirectory(mqtt/paho.mqtt.embedded-c/MQTTPacket)

# Add your executable
add_executable(${PROJECT_NAME} main.c)

# Include headers
target_include_directories(${PROJECT_NAME} PRIVATE
    ${LIBUV_INCLUDE_DIRS}
    mqtt/paho.mqtt.embedded-c/MQTTPacket/src
)

# Link against Paho and libuv
target_link_libraries(${PROJECT_NAME}
    ${LIBUV_LIBRARIES}
)