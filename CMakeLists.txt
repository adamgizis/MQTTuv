cmake_minimum_required(VERSION 3.10)
project(mqttuv C)

set(CMAKE_C_STANDARD 11)


find_package(PkgConfig REQUIRED)
pkg_check_modules(LIBUV REQUIRED libuv)


include_directories(${LIBUV_INCLUDE_DIRS})
include_directories(${CMAKE_SOURCE_DIR}/src)  


file(GLOB SRC_FILES src/*.c)

list(REMOVE_ITEM SRC_FILES ${CMAKE_SOURCE_DIR}/src/sol.c)

# Main executable 
add_executable(mqttuv src/sol.c ${SRC_FILES})
target_link_libraries(mqttuv ${LIBUV_LIBRARIES} uuid)

# Test executable (excludes sol.c)
add_executable(test_trie tests/test_trie.c ${SRC_FILES})
target_link_libraries(test_trie ${LIBUV_LIBRARIES} uuid)


