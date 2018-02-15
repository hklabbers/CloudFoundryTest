cmake_minimum_required(VERSION 3.5)
project(TimeZoneService)

set(CMAKE_VERBOSE_MAKEFILE true)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
set(CMAKE_CXX_FLAGS ${CMAKE_CXX_FLAGS} -g)

add_definitions(-DUSE_OS_TZDB=1 -D_GLIBCXX_USE_CXX17_ABI=0)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

include_directories("/home/vagrant/dev-deps/include" "include" "date/include" "test/include")

set(CURL_LIBS /home/vagrant/dev-deps/lib/libcurl.a)
set(POCO_LIBS /home/vagrant/dev-deps/lib/libPocoAlld.a)
set(PLATFORM_LIBS pthread -static-libgcc -static-libstdc++)

set(DATE_SOURCE_FILES
        date/include/date/chrono_io.h
        date/include/date/date.h
        date/include/date/islamic.h
        date/include/date/iso_week.h
        date/include/date/julian.h
        date/include/date/tz.h
        )

set(SOURCE_FILES
        date/src/tz.cpp
        service/HandlerFactory.cpp include/service/HandlerFactory.h
        service/TimeZoneValidationHandler.cpp include/service/TimeZoneValidationHandler.h
        service/TimeZoneListHandler.cpp include/service/TimeZoneListHandler.h
        service/TimeZoneConversionHandler.cpp include/service/TimeZoneConversionHandler.h
        service/ConversionParameters.cpp include/service/ConversionParameters.h
        )

add_executable(TimeZoneService TimeZoneService.cpp include/TimeZoneService.h ${SOURCE_FILES})
target_link_libraries(TimeZoneService debug ${CURL_LIBS} ${POCO_LIBS} ${PLATFORM_LIBS} )

set(TEST_SOURCE_FILES
        test/include/catch.hpp
        test/service/TimeZoneServiceTest.cpp
        test/service/ConversionParameterTests.cpp
        test/service/ConversionParameterHourTests.cpp
        test/service/ConversionParameterYearTests.cpp
        test/service/ConversionParameterMonthTests.cpp
        test/service/ConversionParameterDayTests.cpp
        test/service/ConversionParameterMinuteTests.cpp
        test/service/TimeZoneConversionHandlerTest.cpp
        )

add_executable(TimeZoneServiceTest ${SOURCE_FILES} ${TEST_SOURCE_FILES})
target_link_libraries(TimeZoneServiceTest debug ${CURL_LIBS} ${POCO_LIBS} ${PLATFORM_LIBS} )

enable_testing()
add_test(NAME TimeZoneServiceTests COMMAND TimeZoneServiceTest)
