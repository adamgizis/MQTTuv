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
include CMakeFiles/mqttuv.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/mqttuv.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/mqttuv.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/mqttuv.dir/flags.make

CMakeFiles/mqttuv.dir/src/config.c.o: CMakeFiles/mqttuv.dir/flags.make
CMakeFiles/mqttuv.dir/src/config.c.o: ../src/config.c
CMakeFiles/mqttuv.dir/src/config.c.o: CMakeFiles/mqttuv.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/local/MQTTuv/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/mqttuv.dir/src/config.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/mqttuv.dir/src/config.c.o -MF CMakeFiles/mqttuv.dir/src/config.c.o.d -o CMakeFiles/mqttuv.dir/src/config.c.o -c /local/MQTTuv/src/config.c

CMakeFiles/mqttuv.dir/src/config.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/mqttuv.dir/src/config.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /local/MQTTuv/src/config.c > CMakeFiles/mqttuv.dir/src/config.c.i

CMakeFiles/mqttuv.dir/src/config.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/mqttuv.dir/src/config.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /local/MQTTuv/src/config.c -o CMakeFiles/mqttuv.dir/src/config.c.s

CMakeFiles/mqttuv.dir/src/core.c.o: CMakeFiles/mqttuv.dir/flags.make
CMakeFiles/mqttuv.dir/src/core.c.o: ../src/core.c
CMakeFiles/mqttuv.dir/src/core.c.o: CMakeFiles/mqttuv.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/local/MQTTuv/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/mqttuv.dir/src/core.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/mqttuv.dir/src/core.c.o -MF CMakeFiles/mqttuv.dir/src/core.c.o.d -o CMakeFiles/mqttuv.dir/src/core.c.o -c /local/MQTTuv/src/core.c

CMakeFiles/mqttuv.dir/src/core.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/mqttuv.dir/src/core.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /local/MQTTuv/src/core.c > CMakeFiles/mqttuv.dir/src/core.c.i

CMakeFiles/mqttuv.dir/src/core.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/mqttuv.dir/src/core.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /local/MQTTuv/src/core.c -o CMakeFiles/mqttuv.dir/src/core.c.s

CMakeFiles/mqttuv.dir/src/hashtable.c.o: CMakeFiles/mqttuv.dir/flags.make
CMakeFiles/mqttuv.dir/src/hashtable.c.o: ../src/hashtable.c
CMakeFiles/mqttuv.dir/src/hashtable.c.o: CMakeFiles/mqttuv.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/local/MQTTuv/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object CMakeFiles/mqttuv.dir/src/hashtable.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/mqttuv.dir/src/hashtable.c.o -MF CMakeFiles/mqttuv.dir/src/hashtable.c.o.d -o CMakeFiles/mqttuv.dir/src/hashtable.c.o -c /local/MQTTuv/src/hashtable.c

CMakeFiles/mqttuv.dir/src/hashtable.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/mqttuv.dir/src/hashtable.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /local/MQTTuv/src/hashtable.c > CMakeFiles/mqttuv.dir/src/hashtable.c.i

CMakeFiles/mqttuv.dir/src/hashtable.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/mqttuv.dir/src/hashtable.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /local/MQTTuv/src/hashtable.c -o CMakeFiles/mqttuv.dir/src/hashtable.c.s

CMakeFiles/mqttuv.dir/src/list.c.o: CMakeFiles/mqttuv.dir/flags.make
CMakeFiles/mqttuv.dir/src/list.c.o: ../src/list.c
CMakeFiles/mqttuv.dir/src/list.c.o: CMakeFiles/mqttuv.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/local/MQTTuv/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object CMakeFiles/mqttuv.dir/src/list.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/mqttuv.dir/src/list.c.o -MF CMakeFiles/mqttuv.dir/src/list.c.o.d -o CMakeFiles/mqttuv.dir/src/list.c.o -c /local/MQTTuv/src/list.c

CMakeFiles/mqttuv.dir/src/list.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/mqttuv.dir/src/list.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /local/MQTTuv/src/list.c > CMakeFiles/mqttuv.dir/src/list.c.i

CMakeFiles/mqttuv.dir/src/list.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/mqttuv.dir/src/list.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /local/MQTTuv/src/list.c -o CMakeFiles/mqttuv.dir/src/list.c.s

CMakeFiles/mqttuv.dir/src/mqtt.c.o: CMakeFiles/mqttuv.dir/flags.make
CMakeFiles/mqttuv.dir/src/mqtt.c.o: ../src/mqtt.c
CMakeFiles/mqttuv.dir/src/mqtt.c.o: CMakeFiles/mqttuv.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/local/MQTTuv/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object CMakeFiles/mqttuv.dir/src/mqtt.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/mqttuv.dir/src/mqtt.c.o -MF CMakeFiles/mqttuv.dir/src/mqtt.c.o.d -o CMakeFiles/mqttuv.dir/src/mqtt.c.o -c /local/MQTTuv/src/mqtt.c

CMakeFiles/mqttuv.dir/src/mqtt.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/mqttuv.dir/src/mqtt.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /local/MQTTuv/src/mqtt.c > CMakeFiles/mqttuv.dir/src/mqtt.c.i

CMakeFiles/mqttuv.dir/src/mqtt.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/mqttuv.dir/src/mqtt.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /local/MQTTuv/src/mqtt.c -o CMakeFiles/mqttuv.dir/src/mqtt.c.s

CMakeFiles/mqttuv.dir/src/network.c.o: CMakeFiles/mqttuv.dir/flags.make
CMakeFiles/mqttuv.dir/src/network.c.o: ../src/network.c
CMakeFiles/mqttuv.dir/src/network.c.o: CMakeFiles/mqttuv.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/local/MQTTuv/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building C object CMakeFiles/mqttuv.dir/src/network.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/mqttuv.dir/src/network.c.o -MF CMakeFiles/mqttuv.dir/src/network.c.o.d -o CMakeFiles/mqttuv.dir/src/network.c.o -c /local/MQTTuv/src/network.c

CMakeFiles/mqttuv.dir/src/network.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/mqttuv.dir/src/network.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /local/MQTTuv/src/network.c > CMakeFiles/mqttuv.dir/src/network.c.i

CMakeFiles/mqttuv.dir/src/network.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/mqttuv.dir/src/network.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /local/MQTTuv/src/network.c -o CMakeFiles/mqttuv.dir/src/network.c.s

CMakeFiles/mqttuv.dir/src/pack.c.o: CMakeFiles/mqttuv.dir/flags.make
CMakeFiles/mqttuv.dir/src/pack.c.o: ../src/pack.c
CMakeFiles/mqttuv.dir/src/pack.c.o: CMakeFiles/mqttuv.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/local/MQTTuv/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building C object CMakeFiles/mqttuv.dir/src/pack.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/mqttuv.dir/src/pack.c.o -MF CMakeFiles/mqttuv.dir/src/pack.c.o.d -o CMakeFiles/mqttuv.dir/src/pack.c.o -c /local/MQTTuv/src/pack.c

CMakeFiles/mqttuv.dir/src/pack.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/mqttuv.dir/src/pack.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /local/MQTTuv/src/pack.c > CMakeFiles/mqttuv.dir/src/pack.c.i

CMakeFiles/mqttuv.dir/src/pack.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/mqttuv.dir/src/pack.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /local/MQTTuv/src/pack.c -o CMakeFiles/mqttuv.dir/src/pack.c.s

CMakeFiles/mqttuv.dir/src/server.c.o: CMakeFiles/mqttuv.dir/flags.make
CMakeFiles/mqttuv.dir/src/server.c.o: ../src/server.c
CMakeFiles/mqttuv.dir/src/server.c.o: CMakeFiles/mqttuv.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/local/MQTTuv/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building C object CMakeFiles/mqttuv.dir/src/server.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/mqttuv.dir/src/server.c.o -MF CMakeFiles/mqttuv.dir/src/server.c.o.d -o CMakeFiles/mqttuv.dir/src/server.c.o -c /local/MQTTuv/src/server.c

CMakeFiles/mqttuv.dir/src/server.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/mqttuv.dir/src/server.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /local/MQTTuv/src/server.c > CMakeFiles/mqttuv.dir/src/server.c.i

CMakeFiles/mqttuv.dir/src/server.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/mqttuv.dir/src/server.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /local/MQTTuv/src/server.c -o CMakeFiles/mqttuv.dir/src/server.c.s

CMakeFiles/mqttuv.dir/src/server2.c.o: CMakeFiles/mqttuv.dir/flags.make
CMakeFiles/mqttuv.dir/src/server2.c.o: ../src/server2.c
CMakeFiles/mqttuv.dir/src/server2.c.o: CMakeFiles/mqttuv.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/local/MQTTuv/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building C object CMakeFiles/mqttuv.dir/src/server2.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/mqttuv.dir/src/server2.c.o -MF CMakeFiles/mqttuv.dir/src/server2.c.o.d -o CMakeFiles/mqttuv.dir/src/server2.c.o -c /local/MQTTuv/src/server2.c

CMakeFiles/mqttuv.dir/src/server2.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/mqttuv.dir/src/server2.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /local/MQTTuv/src/server2.c > CMakeFiles/mqttuv.dir/src/server2.c.i

CMakeFiles/mqttuv.dir/src/server2.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/mqttuv.dir/src/server2.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /local/MQTTuv/src/server2.c -o CMakeFiles/mqttuv.dir/src/server2.c.s

CMakeFiles/mqttuv.dir/src/sol.c.o: CMakeFiles/mqttuv.dir/flags.make
CMakeFiles/mqttuv.dir/src/sol.c.o: ../src/sol.c
CMakeFiles/mqttuv.dir/src/sol.c.o: CMakeFiles/mqttuv.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/local/MQTTuv/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building C object CMakeFiles/mqttuv.dir/src/sol.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/mqttuv.dir/src/sol.c.o -MF CMakeFiles/mqttuv.dir/src/sol.c.o.d -o CMakeFiles/mqttuv.dir/src/sol.c.o -c /local/MQTTuv/src/sol.c

CMakeFiles/mqttuv.dir/src/sol.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/mqttuv.dir/src/sol.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /local/MQTTuv/src/sol.c > CMakeFiles/mqttuv.dir/src/sol.c.i

CMakeFiles/mqttuv.dir/src/sol.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/mqttuv.dir/src/sol.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /local/MQTTuv/src/sol.c -o CMakeFiles/mqttuv.dir/src/sol.c.s

CMakeFiles/mqttuv.dir/src/trie.c.o: CMakeFiles/mqttuv.dir/flags.make
CMakeFiles/mqttuv.dir/src/trie.c.o: ../src/trie.c
CMakeFiles/mqttuv.dir/src/trie.c.o: CMakeFiles/mqttuv.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/local/MQTTuv/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building C object CMakeFiles/mqttuv.dir/src/trie.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/mqttuv.dir/src/trie.c.o -MF CMakeFiles/mqttuv.dir/src/trie.c.o.d -o CMakeFiles/mqttuv.dir/src/trie.c.o -c /local/MQTTuv/src/trie.c

CMakeFiles/mqttuv.dir/src/trie.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/mqttuv.dir/src/trie.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /local/MQTTuv/src/trie.c > CMakeFiles/mqttuv.dir/src/trie.c.i

CMakeFiles/mqttuv.dir/src/trie.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/mqttuv.dir/src/trie.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /local/MQTTuv/src/trie.c -o CMakeFiles/mqttuv.dir/src/trie.c.s

CMakeFiles/mqttuv.dir/src/util.c.o: CMakeFiles/mqttuv.dir/flags.make
CMakeFiles/mqttuv.dir/src/util.c.o: ../src/util.c
CMakeFiles/mqttuv.dir/src/util.c.o: CMakeFiles/mqttuv.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/local/MQTTuv/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Building C object CMakeFiles/mqttuv.dir/src/util.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/mqttuv.dir/src/util.c.o -MF CMakeFiles/mqttuv.dir/src/util.c.o.d -o CMakeFiles/mqttuv.dir/src/util.c.o -c /local/MQTTuv/src/util.c

CMakeFiles/mqttuv.dir/src/util.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/mqttuv.dir/src/util.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /local/MQTTuv/src/util.c > CMakeFiles/mqttuv.dir/src/util.c.i

CMakeFiles/mqttuv.dir/src/util.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/mqttuv.dir/src/util.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /local/MQTTuv/src/util.c -o CMakeFiles/mqttuv.dir/src/util.c.s

# Object files for target mqttuv
mqttuv_OBJECTS = \
"CMakeFiles/mqttuv.dir/src/config.c.o" \
"CMakeFiles/mqttuv.dir/src/core.c.o" \
"CMakeFiles/mqttuv.dir/src/hashtable.c.o" \
"CMakeFiles/mqttuv.dir/src/list.c.o" \
"CMakeFiles/mqttuv.dir/src/mqtt.c.o" \
"CMakeFiles/mqttuv.dir/src/network.c.o" \
"CMakeFiles/mqttuv.dir/src/pack.c.o" \
"CMakeFiles/mqttuv.dir/src/server.c.o" \
"CMakeFiles/mqttuv.dir/src/server2.c.o" \
"CMakeFiles/mqttuv.dir/src/sol.c.o" \
"CMakeFiles/mqttuv.dir/src/trie.c.o" \
"CMakeFiles/mqttuv.dir/src/util.c.o"

# External object files for target mqttuv
mqttuv_EXTERNAL_OBJECTS =

../mqttuv: CMakeFiles/mqttuv.dir/src/config.c.o
../mqttuv: CMakeFiles/mqttuv.dir/src/core.c.o
../mqttuv: CMakeFiles/mqttuv.dir/src/hashtable.c.o
../mqttuv: CMakeFiles/mqttuv.dir/src/list.c.o
../mqttuv: CMakeFiles/mqttuv.dir/src/mqtt.c.o
../mqttuv: CMakeFiles/mqttuv.dir/src/network.c.o
../mqttuv: CMakeFiles/mqttuv.dir/src/pack.c.o
../mqttuv: CMakeFiles/mqttuv.dir/src/server.c.o
../mqttuv: CMakeFiles/mqttuv.dir/src/server2.c.o
../mqttuv: CMakeFiles/mqttuv.dir/src/sol.c.o
../mqttuv: CMakeFiles/mqttuv.dir/src/trie.c.o
../mqttuv: CMakeFiles/mqttuv.dir/src/util.c.o
../mqttuv: CMakeFiles/mqttuv.dir/build.make
../mqttuv: CMakeFiles/mqttuv.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/local/MQTTuv/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_13) "Linking C executable ../mqttuv"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/mqttuv.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/mqttuv.dir/build: ../mqttuv
.PHONY : CMakeFiles/mqttuv.dir/build

CMakeFiles/mqttuv.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/mqttuv.dir/cmake_clean.cmake
.PHONY : CMakeFiles/mqttuv.dir/clean

CMakeFiles/mqttuv.dir/depend:
	cd /local/MQTTuv/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /local/MQTTuv /local/MQTTuv /local/MQTTuv/build /local/MQTTuv/build /local/MQTTuv/build/CMakeFiles/mqttuv.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/mqttuv.dir/depend

