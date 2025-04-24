# test/CMakeLists.txt
# Collect all test files in the test/ directory
file(GLOB TEST_FILES *.c)

# Define the test executable
add_executable(test_mqttuv ${TEST_FILES})

# Link necessary libraries
target_link_libraries(test_mqttuv
    ${LIBUV_LIBRARIES}
    uuid
)