cmake_minimum_required(VERSION 3.10)
project(mqttuv C)

set(CMAKE_C_STANDARD 11)

# Find libuv
find_package(PkgConfig REQUIRED)
pkg_check_modules(LIBUV REQUIRED libuv)

# Add include directories from libuv pkg-config
include_directories(${LIBUV_INCLUDE_DIRS})
link_directories(${LIBUV_LIBRARY_DIRS})

# Collect all source files in src/
file(GLOB SRC_FILES src/*.c)

# Add sol.c as the main entry point
set(MAIN_FILE src/sol.c)

# Define the executable
add_executable(mqttuv ${MAIN_FILE} ${SRC_FILES})

# Link necessary libraries
target_link_libraries(mqttuv
    ${LIBUV_LIBRARIES}
    uuid
)


