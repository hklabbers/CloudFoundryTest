# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.9

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Produce verbose output by default.
VERBOSE = 1

# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/bin/cmake

# The command to remove a file.
RM = /usr/local/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /workspace/TimeZoneService

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /workspace/TimeZoneService/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/TimeZoneService.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/TimeZoneService.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/TimeZoneService.dir/flags.make

CMakeFiles/TimeZoneService.dir/TimeZoneService.cpp.o: CMakeFiles/TimeZoneService.dir/flags.make
CMakeFiles/TimeZoneService.dir/TimeZoneService.cpp.o: ../TimeZoneService.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/workspace/TimeZoneService/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/TimeZoneService.dir/TimeZoneService.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/TimeZoneService.dir/TimeZoneService.cpp.o -c /workspace/TimeZoneService/TimeZoneService.cpp

CMakeFiles/TimeZoneService.dir/TimeZoneService.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/TimeZoneService.dir/TimeZoneService.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /workspace/TimeZoneService/TimeZoneService.cpp > CMakeFiles/TimeZoneService.dir/TimeZoneService.cpp.i

CMakeFiles/TimeZoneService.dir/TimeZoneService.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/TimeZoneService.dir/TimeZoneService.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /workspace/TimeZoneService/TimeZoneService.cpp -o CMakeFiles/TimeZoneService.dir/TimeZoneService.cpp.s

CMakeFiles/TimeZoneService.dir/TimeZoneService.cpp.o.requires:

.PHONY : CMakeFiles/TimeZoneService.dir/TimeZoneService.cpp.o.requires

CMakeFiles/TimeZoneService.dir/TimeZoneService.cpp.o.provides: CMakeFiles/TimeZoneService.dir/TimeZoneService.cpp.o.requires
	$(MAKE) -f CMakeFiles/TimeZoneService.dir/build.make CMakeFiles/TimeZoneService.dir/TimeZoneService.cpp.o.provides.build
.PHONY : CMakeFiles/TimeZoneService.dir/TimeZoneService.cpp.o.provides

CMakeFiles/TimeZoneService.dir/TimeZoneService.cpp.o.provides.build: CMakeFiles/TimeZoneService.dir/TimeZoneService.cpp.o


CMakeFiles/TimeZoneService.dir/date/src/tz.cpp.o: CMakeFiles/TimeZoneService.dir/flags.make
CMakeFiles/TimeZoneService.dir/date/src/tz.cpp.o: ../date/src/tz.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/workspace/TimeZoneService/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/TimeZoneService.dir/date/src/tz.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/TimeZoneService.dir/date/src/tz.cpp.o -c /workspace/TimeZoneService/date/src/tz.cpp

CMakeFiles/TimeZoneService.dir/date/src/tz.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/TimeZoneService.dir/date/src/tz.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /workspace/TimeZoneService/date/src/tz.cpp > CMakeFiles/TimeZoneService.dir/date/src/tz.cpp.i

CMakeFiles/TimeZoneService.dir/date/src/tz.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/TimeZoneService.dir/date/src/tz.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /workspace/TimeZoneService/date/src/tz.cpp -o CMakeFiles/TimeZoneService.dir/date/src/tz.cpp.s

CMakeFiles/TimeZoneService.dir/date/src/tz.cpp.o.requires:

.PHONY : CMakeFiles/TimeZoneService.dir/date/src/tz.cpp.o.requires

CMakeFiles/TimeZoneService.dir/date/src/tz.cpp.o.provides: CMakeFiles/TimeZoneService.dir/date/src/tz.cpp.o.requires
	$(MAKE) -f CMakeFiles/TimeZoneService.dir/build.make CMakeFiles/TimeZoneService.dir/date/src/tz.cpp.o.provides.build
.PHONY : CMakeFiles/TimeZoneService.dir/date/src/tz.cpp.o.provides

CMakeFiles/TimeZoneService.dir/date/src/tz.cpp.o.provides.build: CMakeFiles/TimeZoneService.dir/date/src/tz.cpp.o


CMakeFiles/TimeZoneService.dir/service/HandlerFactory.cpp.o: CMakeFiles/TimeZoneService.dir/flags.make
CMakeFiles/TimeZoneService.dir/service/HandlerFactory.cpp.o: ../service/HandlerFactory.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/workspace/TimeZoneService/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/TimeZoneService.dir/service/HandlerFactory.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/TimeZoneService.dir/service/HandlerFactory.cpp.o -c /workspace/TimeZoneService/service/HandlerFactory.cpp

CMakeFiles/TimeZoneService.dir/service/HandlerFactory.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/TimeZoneService.dir/service/HandlerFactory.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /workspace/TimeZoneService/service/HandlerFactory.cpp > CMakeFiles/TimeZoneService.dir/service/HandlerFactory.cpp.i

CMakeFiles/TimeZoneService.dir/service/HandlerFactory.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/TimeZoneService.dir/service/HandlerFactory.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /workspace/TimeZoneService/service/HandlerFactory.cpp -o CMakeFiles/TimeZoneService.dir/service/HandlerFactory.cpp.s

CMakeFiles/TimeZoneService.dir/service/HandlerFactory.cpp.o.requires:

.PHONY : CMakeFiles/TimeZoneService.dir/service/HandlerFactory.cpp.o.requires

CMakeFiles/TimeZoneService.dir/service/HandlerFactory.cpp.o.provides: CMakeFiles/TimeZoneService.dir/service/HandlerFactory.cpp.o.requires
	$(MAKE) -f CMakeFiles/TimeZoneService.dir/build.make CMakeFiles/TimeZoneService.dir/service/HandlerFactory.cpp.o.provides.build
.PHONY : CMakeFiles/TimeZoneService.dir/service/HandlerFactory.cpp.o.provides

CMakeFiles/TimeZoneService.dir/service/HandlerFactory.cpp.o.provides.build: CMakeFiles/TimeZoneService.dir/service/HandlerFactory.cpp.o


CMakeFiles/TimeZoneService.dir/service/TimeZoneValidationHandler.cpp.o: CMakeFiles/TimeZoneService.dir/flags.make
CMakeFiles/TimeZoneService.dir/service/TimeZoneValidationHandler.cpp.o: ../service/TimeZoneValidationHandler.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/workspace/TimeZoneService/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/TimeZoneService.dir/service/TimeZoneValidationHandler.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/TimeZoneService.dir/service/TimeZoneValidationHandler.cpp.o -c /workspace/TimeZoneService/service/TimeZoneValidationHandler.cpp

CMakeFiles/TimeZoneService.dir/service/TimeZoneValidationHandler.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/TimeZoneService.dir/service/TimeZoneValidationHandler.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /workspace/TimeZoneService/service/TimeZoneValidationHandler.cpp > CMakeFiles/TimeZoneService.dir/service/TimeZoneValidationHandler.cpp.i

CMakeFiles/TimeZoneService.dir/service/TimeZoneValidationHandler.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/TimeZoneService.dir/service/TimeZoneValidationHandler.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /workspace/TimeZoneService/service/TimeZoneValidationHandler.cpp -o CMakeFiles/TimeZoneService.dir/service/TimeZoneValidationHandler.cpp.s

CMakeFiles/TimeZoneService.dir/service/TimeZoneValidationHandler.cpp.o.requires:

.PHONY : CMakeFiles/TimeZoneService.dir/service/TimeZoneValidationHandler.cpp.o.requires

CMakeFiles/TimeZoneService.dir/service/TimeZoneValidationHandler.cpp.o.provides: CMakeFiles/TimeZoneService.dir/service/TimeZoneValidationHandler.cpp.o.requires
	$(MAKE) -f CMakeFiles/TimeZoneService.dir/build.make CMakeFiles/TimeZoneService.dir/service/TimeZoneValidationHandler.cpp.o.provides.build
.PHONY : CMakeFiles/TimeZoneService.dir/service/TimeZoneValidationHandler.cpp.o.provides

CMakeFiles/TimeZoneService.dir/service/TimeZoneValidationHandler.cpp.o.provides.build: CMakeFiles/TimeZoneService.dir/service/TimeZoneValidationHandler.cpp.o


CMakeFiles/TimeZoneService.dir/service/TimeZoneListHandler.cpp.o: CMakeFiles/TimeZoneService.dir/flags.make
CMakeFiles/TimeZoneService.dir/service/TimeZoneListHandler.cpp.o: ../service/TimeZoneListHandler.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/workspace/TimeZoneService/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object CMakeFiles/TimeZoneService.dir/service/TimeZoneListHandler.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/TimeZoneService.dir/service/TimeZoneListHandler.cpp.o -c /workspace/TimeZoneService/service/TimeZoneListHandler.cpp

CMakeFiles/TimeZoneService.dir/service/TimeZoneListHandler.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/TimeZoneService.dir/service/TimeZoneListHandler.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /workspace/TimeZoneService/service/TimeZoneListHandler.cpp > CMakeFiles/TimeZoneService.dir/service/TimeZoneListHandler.cpp.i

CMakeFiles/TimeZoneService.dir/service/TimeZoneListHandler.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/TimeZoneService.dir/service/TimeZoneListHandler.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /workspace/TimeZoneService/service/TimeZoneListHandler.cpp -o CMakeFiles/TimeZoneService.dir/service/TimeZoneListHandler.cpp.s

CMakeFiles/TimeZoneService.dir/service/TimeZoneListHandler.cpp.o.requires:

.PHONY : CMakeFiles/TimeZoneService.dir/service/TimeZoneListHandler.cpp.o.requires

CMakeFiles/TimeZoneService.dir/service/TimeZoneListHandler.cpp.o.provides: CMakeFiles/TimeZoneService.dir/service/TimeZoneListHandler.cpp.o.requires
	$(MAKE) -f CMakeFiles/TimeZoneService.dir/build.make CMakeFiles/TimeZoneService.dir/service/TimeZoneListHandler.cpp.o.provides.build
.PHONY : CMakeFiles/TimeZoneService.dir/service/TimeZoneListHandler.cpp.o.provides

CMakeFiles/TimeZoneService.dir/service/TimeZoneListHandler.cpp.o.provides.build: CMakeFiles/TimeZoneService.dir/service/TimeZoneListHandler.cpp.o


CMakeFiles/TimeZoneService.dir/service/TimeZoneConversionHandler.cpp.o: CMakeFiles/TimeZoneService.dir/flags.make
CMakeFiles/TimeZoneService.dir/service/TimeZoneConversionHandler.cpp.o: ../service/TimeZoneConversionHandler.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/workspace/TimeZoneService/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object CMakeFiles/TimeZoneService.dir/service/TimeZoneConversionHandler.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/TimeZoneService.dir/service/TimeZoneConversionHandler.cpp.o -c /workspace/TimeZoneService/service/TimeZoneConversionHandler.cpp

CMakeFiles/TimeZoneService.dir/service/TimeZoneConversionHandler.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/TimeZoneService.dir/service/TimeZoneConversionHandler.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /workspace/TimeZoneService/service/TimeZoneConversionHandler.cpp > CMakeFiles/TimeZoneService.dir/service/TimeZoneConversionHandler.cpp.i

CMakeFiles/TimeZoneService.dir/service/TimeZoneConversionHandler.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/TimeZoneService.dir/service/TimeZoneConversionHandler.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /workspace/TimeZoneService/service/TimeZoneConversionHandler.cpp -o CMakeFiles/TimeZoneService.dir/service/TimeZoneConversionHandler.cpp.s

CMakeFiles/TimeZoneService.dir/service/TimeZoneConversionHandler.cpp.o.requires:

.PHONY : CMakeFiles/TimeZoneService.dir/service/TimeZoneConversionHandler.cpp.o.requires

CMakeFiles/TimeZoneService.dir/service/TimeZoneConversionHandler.cpp.o.provides: CMakeFiles/TimeZoneService.dir/service/TimeZoneConversionHandler.cpp.o.requires
	$(MAKE) -f CMakeFiles/TimeZoneService.dir/build.make CMakeFiles/TimeZoneService.dir/service/TimeZoneConversionHandler.cpp.o.provides.build
.PHONY : CMakeFiles/TimeZoneService.dir/service/TimeZoneConversionHandler.cpp.o.provides

CMakeFiles/TimeZoneService.dir/service/TimeZoneConversionHandler.cpp.o.provides.build: CMakeFiles/TimeZoneService.dir/service/TimeZoneConversionHandler.cpp.o


CMakeFiles/TimeZoneService.dir/service/ConversionParameters.cpp.o: CMakeFiles/TimeZoneService.dir/flags.make
CMakeFiles/TimeZoneService.dir/service/ConversionParameters.cpp.o: ../service/ConversionParameters.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/workspace/TimeZoneService/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object CMakeFiles/TimeZoneService.dir/service/ConversionParameters.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/TimeZoneService.dir/service/ConversionParameters.cpp.o -c /workspace/TimeZoneService/service/ConversionParameters.cpp

CMakeFiles/TimeZoneService.dir/service/ConversionParameters.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/TimeZoneService.dir/service/ConversionParameters.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /workspace/TimeZoneService/service/ConversionParameters.cpp > CMakeFiles/TimeZoneService.dir/service/ConversionParameters.cpp.i

CMakeFiles/TimeZoneService.dir/service/ConversionParameters.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/TimeZoneService.dir/service/ConversionParameters.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /workspace/TimeZoneService/service/ConversionParameters.cpp -o CMakeFiles/TimeZoneService.dir/service/ConversionParameters.cpp.s

CMakeFiles/TimeZoneService.dir/service/ConversionParameters.cpp.o.requires:

.PHONY : CMakeFiles/TimeZoneService.dir/service/ConversionParameters.cpp.o.requires

CMakeFiles/TimeZoneService.dir/service/ConversionParameters.cpp.o.provides: CMakeFiles/TimeZoneService.dir/service/ConversionParameters.cpp.o.requires
	$(MAKE) -f CMakeFiles/TimeZoneService.dir/build.make CMakeFiles/TimeZoneService.dir/service/ConversionParameters.cpp.o.provides.build
.PHONY : CMakeFiles/TimeZoneService.dir/service/ConversionParameters.cpp.o.provides

CMakeFiles/TimeZoneService.dir/service/ConversionParameters.cpp.o.provides.build: CMakeFiles/TimeZoneService.dir/service/ConversionParameters.cpp.o


# Object files for target TimeZoneService
TimeZoneService_OBJECTS = \
"CMakeFiles/TimeZoneService.dir/TimeZoneService.cpp.o" \
"CMakeFiles/TimeZoneService.dir/date/src/tz.cpp.o" \
"CMakeFiles/TimeZoneService.dir/service/HandlerFactory.cpp.o" \
"CMakeFiles/TimeZoneService.dir/service/TimeZoneValidationHandler.cpp.o" \
"CMakeFiles/TimeZoneService.dir/service/TimeZoneListHandler.cpp.o" \
"CMakeFiles/TimeZoneService.dir/service/TimeZoneConversionHandler.cpp.o" \
"CMakeFiles/TimeZoneService.dir/service/ConversionParameters.cpp.o"

# External object files for target TimeZoneService
TimeZoneService_EXTERNAL_OBJECTS =

bin/TimeZoneService: CMakeFiles/TimeZoneService.dir/TimeZoneService.cpp.o
bin/TimeZoneService: CMakeFiles/TimeZoneService.dir/date/src/tz.cpp.o
bin/TimeZoneService: CMakeFiles/TimeZoneService.dir/service/HandlerFactory.cpp.o
bin/TimeZoneService: CMakeFiles/TimeZoneService.dir/service/TimeZoneValidationHandler.cpp.o
bin/TimeZoneService: CMakeFiles/TimeZoneService.dir/service/TimeZoneListHandler.cpp.o
bin/TimeZoneService: CMakeFiles/TimeZoneService.dir/service/TimeZoneConversionHandler.cpp.o
bin/TimeZoneService: CMakeFiles/TimeZoneService.dir/service/ConversionParameters.cpp.o
bin/TimeZoneService: CMakeFiles/TimeZoneService.dir/build.make
bin/TimeZoneService: /home/vagrant/dev-deps/lib/libcurl.a
bin/TimeZoneService: /home/vagrant/dev-deps/lib/libPocoAlld.a
bin/TimeZoneService: CMakeFiles/TimeZoneService.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/workspace/TimeZoneService/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Linking CXX executable bin/TimeZoneService"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/TimeZoneService.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/TimeZoneService.dir/build: bin/TimeZoneService

.PHONY : CMakeFiles/TimeZoneService.dir/build

CMakeFiles/TimeZoneService.dir/requires: CMakeFiles/TimeZoneService.dir/TimeZoneService.cpp.o.requires
CMakeFiles/TimeZoneService.dir/requires: CMakeFiles/TimeZoneService.dir/date/src/tz.cpp.o.requires
CMakeFiles/TimeZoneService.dir/requires: CMakeFiles/TimeZoneService.dir/service/HandlerFactory.cpp.o.requires
CMakeFiles/TimeZoneService.dir/requires: CMakeFiles/TimeZoneService.dir/service/TimeZoneValidationHandler.cpp.o.requires
CMakeFiles/TimeZoneService.dir/requires: CMakeFiles/TimeZoneService.dir/service/TimeZoneListHandler.cpp.o.requires
CMakeFiles/TimeZoneService.dir/requires: CMakeFiles/TimeZoneService.dir/service/TimeZoneConversionHandler.cpp.o.requires
CMakeFiles/TimeZoneService.dir/requires: CMakeFiles/TimeZoneService.dir/service/ConversionParameters.cpp.o.requires

.PHONY : CMakeFiles/TimeZoneService.dir/requires

CMakeFiles/TimeZoneService.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/TimeZoneService.dir/cmake_clean.cmake
.PHONY : CMakeFiles/TimeZoneService.dir/clean

CMakeFiles/TimeZoneService.dir/depend:
	cd /workspace/TimeZoneService/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /workspace/TimeZoneService /workspace/TimeZoneService /workspace/TimeZoneService/cmake-build-debug /workspace/TimeZoneService/cmake-build-debug /workspace/TimeZoneService/cmake-build-debug/CMakeFiles/TimeZoneService.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/TimeZoneService.dir/depend

