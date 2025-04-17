cmake_minimum_required(VERSION 3.10)
project(mqttuv C)

set(CMAKE_C_STANDARD 11)

# Find libuv
find_package(PkgConfig REQUIRED)
pkg_check_modules(LIBUV REQUIRED libuv)

# Add the MQTTPacket subdirectory
add_subdirectory(mqtt/paho.mqtt.embedded-c)

# Add your executable
add_executable(${PROJECT_NAME} main.c)

# Include headers
target_include_directories(${PROJECT_NAME} PRIVATE
    ${LIBUV_INCLUDE_DIRS}
)

# Link against libuv and MQTTPacket
target_link_libraries(${PROJECT_NAME}
    ${LIBUV_LIBRARIES}
    paho-embed-mqtt3c
)
