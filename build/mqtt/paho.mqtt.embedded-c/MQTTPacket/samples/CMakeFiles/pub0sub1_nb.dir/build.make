# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /local/MQTTuv

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /local/MQTTuv/build

# Include any dependencies generated for this target.
include mqtt/paho.mqtt.embedded-c/MQTTPacket/samples/CMakeFiles/pub0sub1_nb.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include mqtt/paho.mqtt.embedded-c/MQTTPacket/samples/CMakeFiles/pub0sub1_nb.dir/compiler_depend.make

# Include the progress variables for this target.
include mqtt/paho.mqtt.embedded-c/MQTTPacket/samples/CMakeFiles/pub0sub1_nb.dir/progress.make

# Include the compile flags for this target's objects.
include mqtt/paho.mqtt.embedded-c/MQTTPacket/samples/CMakeFiles/pub0sub1_nb.dir/flags.make

mqtt/paho.mqtt.embedded-c/MQTTPacket/samples/CMakeFiles/pub0sub1_nb.dir/pub0sub1_nb.c.o: mqtt/paho.mqtt.embedded-c/MQTTPacket/samples/CMakeFiles/pub0sub1_nb.dir/flags.make
mqtt/paho.mqtt.embedded-c/MQTTPacket/samples/CMakeFiles/pub0sub1_nb.dir/pub0sub1_nb.c.o: ../mqtt/paho.mqtt.embedded-c/MQTTPacket/samples/pub0sub1_nb.c
mqtt/paho.mqtt.embedded-c/MQTTPacket/samples/CMakeFiles/pub0sub1_nb.dir/pub0sub1_nb.c.o: mqtt/paho.mqtt.embedded-c/MQTTPacket/samples/CMakeFiles/pub0sub1_nb.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/local/MQTTuv/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object mqtt/paho.mqtt.embedded-c/MQTTPacket/samples/CMakeFiles/pub0sub1_nb.dir/pub0sub1_nb.c.o"
	cd /local/MQTTuv/build/mqtt/paho.mqtt.embedded-c/MQTTPacket/samples && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT mqtt/paho.mqtt.embedded-c/MQTTPacket/samples/CMakeFiles/pub0sub1_nb.dir/pub0sub1_nb.c.o -MF CMakeFiles/pub0sub1_nb.dir/pub0sub1_nb.c.o.d -o CMakeFiles/pub0sub1_nb.dir/pub0sub1_nb.c.o -c /local/MQTTuv/mqtt/paho.mqtt.embedded-c/MQTTPacket/samples/pub0sub1_nb.c

mqtt/paho.mqtt.embedded-c/MQTTPacket/samples/CMakeFiles/pub0sub1_nb.dir/pub0sub1_nb.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/pub0sub1_nb.dir/pub0sub1_nb.c.i"
	cd /local/MQTTuv/build/mqtt/paho.mqtt.embedded-c/MQTTPacket/samples && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /local/MQTTuv/mqtt/paho.mqtt.embedded-c/MQTTPacket/samples/pub0sub1_nb.c > CMakeFiles/pub0sub1_nb.dir/pub0sub1_nb.c.i

mqtt/paho.mqtt.embedded-c/MQTTPacket/samples/CMakeFiles/pub0sub1_nb.dir/pub0sub1_nb.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/pub0sub1_nb.dir/pub0sub1_nb.c.s"
	cd /local/MQTTuv/build/mqtt/paho.mqtt.embedded-c/MQTTPacket/samples && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /local/MQTTuv/mqtt/paho.mqtt.embedded-c/MQTTPacket/samples/pub0sub1_nb.c -o CMakeFiles/pub0sub1_nb.dir/pub0sub1_nb.c.s

mqtt/paho.mqtt.embedded-c/MQTTPacket/samples/CMakeFiles/pub0sub1_nb.dir/transport.c.o: mqtt/paho.mqtt.embedded-c/MQTTPacket/samples/CMakeFiles/pub0sub1_nb.dir/flags.make
mqtt/paho.mqtt.embedded-c/MQTTPacket/samples/CMakeFiles/pub0sub1_nb.dir/transport.c.o: ../mqtt/paho.mqtt.embedded-c/MQTTPacket/samples/transport.c
mqtt/paho.mqtt.embedded-c/MQTTPacket/samples/CMakeFiles/pub0sub1_nb.dir/transport.c.o: mqtt/paho.mqtt.embedded-c/MQTTPacket/samples/CMakeFiles/pub0sub1_nb.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/local/MQTTuv/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object mqtt/paho.mqtt.embedded-c/MQTTPacket/samples/CMakeFiles/pub0sub1_nb.dir/transport.c.o"
	cd /local/MQTTuv/build/mqtt/paho.mqtt.embedded-c/MQTTPacket/samples && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT mqtt/paho.mqtt.embedded-c/MQTTPacket/samples/CMakeFiles/pub0sub1_nb.dir/transport.c.o -MF CMakeFiles/pub0sub1_nb.dir/transport.c.o.d -o CMakeFiles/pub0sub1_nb.dir/transport.c.o -c /local/MQTTuv/mqtt/paho.mqtt.embedded-c/MQTTPacket/samples/transport.c

mqtt/paho.mqtt.embedded-c/MQTTPacket/samples/CMakeFiles/pub0sub1_nb.dir/transport.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/pub0sub1_nb.dir/transport.c.i"
	cd /local/MQTTuv/build/mqtt/paho.mqtt.embedded-c/MQTTPacket/samples && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /local/MQTTuv/mqtt/paho.mqtt.embedded-c/MQTTPacket/samples/transport.c > CMakeFiles/pub0sub1_nb.dir/transport.c.i

mqtt/paho.mqtt.embedded-c/MQTTPacket/samples/CMakeFiles/pub0sub1_nb.dir/transport.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/pub0sub1_nb.dir/transport.c.s"
	cd /local/MQTTuv/build/mqtt/paho.mqtt.embedded-c/MQTTPacket/samples && /usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /local/MQTTuv/mqtt/paho.mqtt.embedded-c/MQTTPacket/samples/transport.c -o CMakeFiles/pub0sub1_nb.dir/transport.c.s

# Object files for target pub0sub1_nb
pub0sub1_nb_OBJECTS = \
"CMakeFiles/pub0sub1_nb.dir/pub0sub1_nb.c.o" \
"CMakeFiles/pub0sub1_nb.dir/transport.c.o"

# External object files for target pub0sub1_nb
pub0sub1_nb_EXTERNAL_OBJECTS =

mqtt/paho.mqtt.embedded-c/MQTTPacket/samples/pub0sub1_nb: mqtt/paho.mqtt.embedded-c/MQTTPacket/samples/CMakeFiles/pub0sub1_nb.dir/pub0sub1_nb.c.o
mqtt/paho.mqtt.embedded-c/MQTTPacket/samples/pub0sub1_nb: mqtt/paho.mqtt.embedded-c/MQTTPacket/samples/CMakeFiles/pub0sub1_nb.dir/transport.c.o
mqtt/paho.mqtt.embedded-c/MQTTPacket/samples/pub0sub1_nb: mqtt/paho.mqtt.embedded-c/MQTTPacket/samples/CMakeFiles/pub0sub1_nb.dir/build.make
mqtt/paho.mqtt.embedded-c/MQTTPacket/samples/pub0sub1_nb: mqtt/paho.mqtt.embedded-c/MQTTPacket/src/libpaho-embed-mqtt3c.so
mqtt/paho.mqtt.embedded-c/MQTTPacket/samples/pub0sub1_nb: mqtt/paho.mqtt.embedded-c/MQTTPacket/samples/CMakeFiles/pub0sub1_nb.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/local/MQTTuv/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking C executable pub0sub1_nb"
	cd /local/MQTTuv/build/mqtt/paho.mqtt.embedded-c/MQTTPacket/samples && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/pub0sub1_nb.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
mqtt/paho.mqtt.embedded-c/MQTTPacket/samples/CMakeFiles/pub0sub1_nb.dir/build: mqtt/paho.mqtt.embedded-c/MQTTPacket/samples/pub0sub1_nb
.PHONY : mqtt/paho.mqtt.embedded-c/MQTTPacket/samples/CMakeFiles/pub0sub1_nb.dir/build

mqtt/paho.mqtt.embedded-c/MQTTPacket/samples/CMakeFiles/pub0sub1_nb.dir/clean:
	cd /local/MQTTuv/build/mqtt/paho.mqtt.embedded-c/MQTTPacket/samples && $(CMAKE_COMMAND) -P CMakeFiles/pub0sub1_nb.dir/cmake_clean.cmake
.PHONY : mqtt/paho.mqtt.embedded-c/MQTTPacket/samples/CMakeFiles/pub0sub1_nb.dir/clean

mqtt/paho.mqtt.embedded-c/MQTTPacket/samples/CMakeFiles/pub0sub1_nb.dir/depend:
	cd /local/MQTTuv/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /local/MQTTuv /local/MQTTuv/mqtt/paho.mqtt.embedded-c/MQTTPacket/samples /local/MQTTuv/build /local/MQTTuv/build/mqtt/paho.mqtt.embedded-c/MQTTPacket/samples /local/MQTTuv/build/mqtt/paho.mqtt.embedded-c/MQTTPacket/samples/CMakeFiles/pub0sub1_nb.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : mqtt/paho.mqtt.embedded-c/MQTTPacket/samples/CMakeFiles/pub0sub1_nb.dir/depend

