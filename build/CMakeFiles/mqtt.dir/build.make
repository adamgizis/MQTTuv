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
include CMakeFiles/mqtt.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/mqtt.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/mqtt.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/mqtt.dir/flags.make

CMakeFiles/mqtt.dir/src/config.c.o: CMakeFiles/mqtt.dir/flags.make
CMakeFiles/mqtt.dir/src/config.c.o: ../src/config.c
CMakeFiles/mqtt.dir/src/config.c.o: CMakeFiles/mqtt.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/local/MQTTuv/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/mqtt.dir/src/config.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/mqtt.dir/src/config.c.o -MF CMakeFiles/mqtt.dir/src/config.c.o.d -o CMakeFiles/mqtt.dir/src/config.c.o -c /local/MQTTuv/src/config.c

CMakeFiles/mqtt.dir/src/config.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/mqtt.dir/src/config.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /local/MQTTuv/src/config.c > CMakeFiles/mqtt.dir/src/config.c.i

CMakeFiles/mqtt.dir/src/config.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/mqtt.dir/src/config.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /local/MQTTuv/src/config.c -o CMakeFiles/mqtt.dir/src/config.c.s

CMakeFiles/mqtt.dir/src/core.c.o: CMakeFiles/mqtt.dir/flags.make
CMakeFiles/mqtt.dir/src/core.c.o: ../src/core.c
CMakeFiles/mqtt.dir/src/core.c.o: CMakeFiles/mqtt.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/local/MQTTuv/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/mqtt.dir/src/core.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/mqtt.dir/src/core.c.o -MF CMakeFiles/mqtt.dir/src/core.c.o.d -o CMakeFiles/mqtt.dir/src/core.c.o -c /local/MQTTuv/src/core.c

CMakeFiles/mqtt.dir/src/core.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/mqtt.dir/src/core.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /local/MQTTuv/src/core.c > CMakeFiles/mqtt.dir/src/core.c.i

CMakeFiles/mqtt.dir/src/core.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/mqtt.dir/src/core.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /local/MQTTuv/src/core.c -o CMakeFiles/mqtt.dir/src/core.c.s

CMakeFiles/mqtt.dir/src/hashtable.c.o: CMakeFiles/mqtt.dir/flags.make
CMakeFiles/mqtt.dir/src/hashtable.c.o: ../src/hashtable.c
CMakeFiles/mqtt.dir/src/hashtable.c.o: CMakeFiles/mqtt.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/local/MQTTuv/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object CMakeFiles/mqtt.dir/src/hashtable.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/mqtt.dir/src/hashtable.c.o -MF CMakeFiles/mqtt.dir/src/hashtable.c.o.d -o CMakeFiles/mqtt.dir/src/hashtable.c.o -c /local/MQTTuv/src/hashtable.c

CMakeFiles/mqtt.dir/src/hashtable.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/mqtt.dir/src/hashtable.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /local/MQTTuv/src/hashtable.c > CMakeFiles/mqtt.dir/src/hashtable.c.i

CMakeFiles/mqtt.dir/src/hashtable.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/mqtt.dir/src/hashtable.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /local/MQTTuv/src/hashtable.c -o CMakeFiles/mqtt.dir/src/hashtable.c.s

CMakeFiles/mqtt.dir/src/list.c.o: CMakeFiles/mqtt.dir/flags.make
CMakeFiles/mqtt.dir/src/list.c.o: ../src/list.c
CMakeFiles/mqtt.dir/src/list.c.o: CMakeFiles/mqtt.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/local/MQTTuv/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object CMakeFiles/mqtt.dir/src/list.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/mqtt.dir/src/list.c.o -MF CMakeFiles/mqtt.dir/src/list.c.o.d -o CMakeFiles/mqtt.dir/src/list.c.o -c /local/MQTTuv/src/list.c

CMakeFiles/mqtt.dir/src/list.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/mqtt.dir/src/list.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /local/MQTTuv/src/list.c > CMakeFiles/mqtt.dir/src/list.c.i

CMakeFiles/mqtt.dir/src/list.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/mqtt.dir/src/list.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /local/MQTTuv/src/list.c -o CMakeFiles/mqtt.dir/src/list.c.s

CMakeFiles/mqtt.dir/src/mqtt.c.o: CMakeFiles/mqtt.dir/flags.make
CMakeFiles/mqtt.dir/src/mqtt.c.o: ../src/mqtt.c
CMakeFiles/mqtt.dir/src/mqtt.c.o: CMakeFiles/mqtt.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/local/MQTTuv/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object CMakeFiles/mqtt.dir/src/mqtt.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/mqtt.dir/src/mqtt.c.o -MF CMakeFiles/mqtt.dir/src/mqtt.c.o.d -o CMakeFiles/mqtt.dir/src/mqtt.c.o -c /local/MQTTuv/src/mqtt.c

CMakeFiles/mqtt.dir/src/mqtt.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/mqtt.dir/src/mqtt.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /local/MQTTuv/src/mqtt.c > CMakeFiles/mqtt.dir/src/mqtt.c.i

CMakeFiles/mqtt.dir/src/mqtt.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/mqtt.dir/src/mqtt.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /local/MQTTuv/src/mqtt.c -o CMakeFiles/mqtt.dir/src/mqtt.c.s

CMakeFiles/mqtt.dir/src/network.c.o: CMakeFiles/mqtt.dir/flags.make
CMakeFiles/mqtt.dir/src/network.c.o: ../src/network.c
CMakeFiles/mqtt.dir/src/network.c.o: CMakeFiles/mqtt.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/local/MQTTuv/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building C object CMakeFiles/mqtt.dir/src/network.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/mqtt.dir/src/network.c.o -MF CMakeFiles/mqtt.dir/src/network.c.o.d -o CMakeFiles/mqtt.dir/src/network.c.o -c /local/MQTTuv/src/network.c

CMakeFiles/mqtt.dir/src/network.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/mqtt.dir/src/network.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /local/MQTTuv/src/network.c > CMakeFiles/mqtt.dir/src/network.c.i

CMakeFiles/mqtt.dir/src/network.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/mqtt.dir/src/network.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /local/MQTTuv/src/network.c -o CMakeFiles/mqtt.dir/src/network.c.s

CMakeFiles/mqtt.dir/src/pack.c.o: CMakeFiles/mqtt.dir/flags.make
CMakeFiles/mqtt.dir/src/pack.c.o: ../src/pack.c
CMakeFiles/mqtt.dir/src/pack.c.o: CMakeFiles/mqtt.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/local/MQTTuv/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building C object CMakeFiles/mqtt.dir/src/pack.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/mqtt.dir/src/pack.c.o -MF CMakeFiles/mqtt.dir/src/pack.c.o.d -o CMakeFiles/mqtt.dir/src/pack.c.o -c /local/MQTTuv/src/pack.c

CMakeFiles/mqtt.dir/src/pack.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/mqtt.dir/src/pack.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /local/MQTTuv/src/pack.c > CMakeFiles/mqtt.dir/src/pack.c.i

CMakeFiles/mqtt.dir/src/pack.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/mqtt.dir/src/pack.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /local/MQTTuv/src/pack.c -o CMakeFiles/mqtt.dir/src/pack.c.s

CMakeFiles/mqtt.dir/src/server.c.o: CMakeFiles/mqtt.dir/flags.make
CMakeFiles/mqtt.dir/src/server.c.o: ../src/server.c
CMakeFiles/mqtt.dir/src/server.c.o: CMakeFiles/mqtt.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/local/MQTTuv/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building C object CMakeFiles/mqtt.dir/src/server.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/mqtt.dir/src/server.c.o -MF CMakeFiles/mqtt.dir/src/server.c.o.d -o CMakeFiles/mqtt.dir/src/server.c.o -c /local/MQTTuv/src/server.c

CMakeFiles/mqtt.dir/src/server.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/mqtt.dir/src/server.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /local/MQTTuv/src/server.c > CMakeFiles/mqtt.dir/src/server.c.i

CMakeFiles/mqtt.dir/src/server.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/mqtt.dir/src/server.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /local/MQTTuv/src/server.c -o CMakeFiles/mqtt.dir/src/server.c.s

CMakeFiles/mqtt.dir/src/sol.c.o: CMakeFiles/mqtt.dir/flags.make
CMakeFiles/mqtt.dir/src/sol.c.o: ../src/sol.c
CMakeFiles/mqtt.dir/src/sol.c.o: CMakeFiles/mqtt.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/local/MQTTuv/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building C object CMakeFiles/mqtt.dir/src/sol.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/mqtt.dir/src/sol.c.o -MF CMakeFiles/mqtt.dir/src/sol.c.o.d -o CMakeFiles/mqtt.dir/src/sol.c.o -c /local/MQTTuv/src/sol.c

CMakeFiles/mqtt.dir/src/sol.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/mqtt.dir/src/sol.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /local/MQTTuv/src/sol.c > CMakeFiles/mqtt.dir/src/sol.c.i

CMakeFiles/mqtt.dir/src/sol.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/mqtt.dir/src/sol.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /local/MQTTuv/src/sol.c -o CMakeFiles/mqtt.dir/src/sol.c.s

CMakeFiles/mqtt.dir/src/trie.c.o: CMakeFiles/mqtt.dir/flags.make
CMakeFiles/mqtt.dir/src/trie.c.o: ../src/trie.c
CMakeFiles/mqtt.dir/src/trie.c.o: CMakeFiles/mqtt.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/local/MQTTuv/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building C object CMakeFiles/mqtt.dir/src/trie.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/mqtt.dir/src/trie.c.o -MF CMakeFiles/mqtt.dir/src/trie.c.o.d -o CMakeFiles/mqtt.dir/src/trie.c.o -c /local/MQTTuv/src/trie.c

CMakeFiles/mqtt.dir/src/trie.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/mqtt.dir/src/trie.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /local/MQTTuv/src/trie.c > CMakeFiles/mqtt.dir/src/trie.c.i

CMakeFiles/mqtt.dir/src/trie.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/mqtt.dir/src/trie.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /local/MQTTuv/src/trie.c -o CMakeFiles/mqtt.dir/src/trie.c.s

CMakeFiles/mqtt.dir/src/util.c.o: CMakeFiles/mqtt.dir/flags.make
CMakeFiles/mqtt.dir/src/util.c.o: ../src/util.c
CMakeFiles/mqtt.dir/src/util.c.o: CMakeFiles/mqtt.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/local/MQTTuv/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building C object CMakeFiles/mqtt.dir/src/util.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/mqtt.dir/src/util.c.o -MF CMakeFiles/mqtt.dir/src/util.c.o.d -o CMakeFiles/mqtt.dir/src/util.c.o -c /local/MQTTuv/src/util.c

CMakeFiles/mqtt.dir/src/util.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/mqtt.dir/src/util.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /local/MQTTuv/src/util.c > CMakeFiles/mqtt.dir/src/util.c.i

CMakeFiles/mqtt.dir/src/util.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/mqtt.dir/src/util.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /local/MQTTuv/src/util.c -o CMakeFiles/mqtt.dir/src/util.c.s

# Object files for target mqtt
mqtt_OBJECTS = \
"CMakeFiles/mqtt.dir/src/config.c.o" \
"CMakeFiles/mqtt.dir/src/core.c.o" \
"CMakeFiles/mqtt.dir/src/hashtable.c.o" \
"CMakeFiles/mqtt.dir/src/list.c.o" \
"CMakeFiles/mqtt.dir/src/mqtt.c.o" \
"CMakeFiles/mqtt.dir/src/network.c.o" \
"CMakeFiles/mqtt.dir/src/pack.c.o" \
"CMakeFiles/mqtt.dir/src/server.c.o" \
"CMakeFiles/mqtt.dir/src/sol.c.o" \
"CMakeFiles/mqtt.dir/src/trie.c.o" \
"CMakeFiles/mqtt.dir/src/util.c.o"

# External object files for target mqtt
mqtt_EXTERNAL_OBJECTS =

../mqtt: CMakeFiles/mqtt.dir/src/config.c.o
../mqtt: CMakeFiles/mqtt.dir/src/core.c.o
../mqtt: CMakeFiles/mqtt.dir/src/hashtable.c.o
../mqtt: CMakeFiles/mqtt.dir/src/list.c.o
../mqtt: CMakeFiles/mqtt.dir/src/mqtt.c.o
../mqtt: CMakeFiles/mqtt.dir/src/network.c.o
../mqtt: CMakeFiles/mqtt.dir/src/pack.c.o
../mqtt: CMakeFiles/mqtt.dir/src/server.c.o
../mqtt: CMakeFiles/mqtt.dir/src/sol.c.o
../mqtt: CMakeFiles/mqtt.dir/src/trie.c.o
../mqtt: CMakeFiles/mqtt.dir/src/util.c.o
../mqtt: CMakeFiles/mqtt.dir/build.make
../mqtt: CMakeFiles/mqtt.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/local/MQTTuv/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Linking C executable ../mqtt"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/mqtt.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/mqtt.dir/build: ../mqtt
.PHONY : CMakeFiles/mqtt.dir/build

CMakeFiles/mqtt.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/mqtt.dir/cmake_clean.cmake
.PHONY : CMakeFiles/mqtt.dir/clean

CMakeFiles/mqtt.dir/depend:
	cd /local/MQTTuv/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /local/MQTTuv /local/MQTTuv /local/MQTTuv/build /local/MQTTuv/build /local/MQTTuv/build/CMakeFiles/mqtt.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/mqtt.dir/depend

