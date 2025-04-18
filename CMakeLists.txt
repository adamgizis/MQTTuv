cmake_minimum_required(VERSION 3.10)
project(mqttuv C)

set(CMAKE_C_STANDARD 11)

# Find libuv
find_package(PkgConfig REQUIRED)
pkg_check_modules(LIBUV REQUIRED libuv)

add_subdirectory(mqtt/paho.mqtt.embedded-c)

# Collect all source files in src/
file(GLOB SRC_FILES src/*.c)

# Executable for main
add_executable(${PROJECT_NAME} main.c ${SRC_FILES})
target_include_directories(${PROJECT_NAME} PRIVATE
    ${LIBUV_INCLUDE_DIRS}
)
target_link_libraries(${PROJECT_NAME}
    ${LIBUV_LIBRARIES}
    paho-embed-mqtt3c
)

add_executable(client_test1 client_test.c ${SRC_FILES})
target_include_directories(client_test1 PRIVATE
    ${LIBUV_INCLUDE_DIRS}
)
target_link_libraries(client_test1
    ${LIBUV_LIBRARIES}
    paho-embed-mqtt3c
)

