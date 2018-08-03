cmake_minimum_required(VERSION 2.8)
MESSAGE ("Set with MinewTech openWrt toolchain")
SET (HOST_TRIPLET "mipsel-openwrt-linux")

SET (CMAKE_SYSROOT $ENV{ARMGCC_DIR})

IF(NOT CMAKE_SYSROOT)
    MESSAGE(FATAL_ERROR "***Please set ARMGCC_DIR in envionment variables***")
ENDIF()

SET (TOOLCHAIN_BIN_DIR $ENV{ARMGCC_DIR}/bin)

SET(CMAKE_SYSTEM_NAME Linux)
SET(CMAKE_SYSTEM_PROCESSOR mips)

SET (CMAKE_C_COMPILER ${TOOLCHAIN_BIN_DIR}/${HOST_TRIPLET}-gcc CACHE FILEPATH "")
SET (CMAKE_CXX_COMPILER ${TOOLCHAIN_BIN_DIR}/${HOST_TRIPLET}-g++)
SET (CMAKE_ASM_COMPILER ${TOOLCHAIN_BIN_DIR}/${HOST_TRIPLET}-gcc)

SET (TOOLCHAIN_DIR ${CMAKE_SYSROOT})

SET(CMAKE_FIND_ROOT_PATH ${TOOLCHAIN_DIR})
#include_directories(${CMAKE_FIND_ROOT_PATH}/include/)
#SET(CMAKE_REQUIRED_INCLUDES ${CMAKE_FIND_ROOT_PATH}/include/)
SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set_property(GLOBAL PROPERTY TARGET_SUPPORTS_SHARED_LIBS TRUE)



# default to GNU99
set(CMAKE_C_FLAGS "$ENV{MCC_LINUX_X86_EXTRA_C_FLAGS} -std=gnu99 -fPIC " CACHE STRING "" FORCE)
# add extra args if found in the environment
set(CMAKE_CXX_FLAGS "$ENV{MCC_LINUX_X86_EXTRA_CXX_FLAGS} -fPIC -std=gnu99" CACHE STRING "" FORCE)
# ugly hack for fixing link issues
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} $ENV{MCC_LINUX_X86_EXTRA_LD_FLAGS} -Wl,--start-group" CACHE STRING "" FORCE)
# import definitions from environment
add_definitions($ENV{MCC_LINUX_X86_EXTRA_DEFS})
link_libraries($ENV{MCC_LINUX_X86_EXTRA_LIBS} rt pthread)
set(MBED_EDGE_BUILD_TARGET 1)

# check that we are actually running on Linux, if we're not then we may pull in
# incorrect dependencies.
if(NOT (${CMAKE_HOST_SYSTEM_NAME} MATCHES "Linux"))
    message(FATAL_ERROR "This Linux native target will not work on non-Linux platforms (your platform is ${CMAKE_HOST_SYSTEM_NAME}).")
endif()

message(STATUS "")
message(STATUS "        ---( Root Project Status:  )---")
message(STATUS "")
message(STATUS "CMAKE_SYSROOT: 			  " ${CMAKE_SYSROOT})
message(STATUS "TOOLCHAIN_BIN_DIR:        " ${TOOLCHAIN_BIN_DIR})
message(STATUS "CMAKE_FIND_ROOT_PATH: 	  " ${CMAKE_FIND_ROOT_PATH})
message(STATUS "CMAKE_C_COMPILER:         " ${CMAKE_C_COMPILER})
message(STATUS "CMAKE_CXX_COMPILER:       " ${CMAKE_CXX_COMPILER})
message(STATUS "CMAKE_ASM_COMPILER:       " ${CMAKE_ASM_COMPILER})
message(STATUS "CMAKE_C_FLAGS:            " ${CMAKE_C_FLAGS})
message(STATUS "CMAKE_CXX_FLAGS:          " ${CMAKE_CXX_FLAGS} )
message(STATUS "CMAKE_EXE_LINKER_FLAGS:   " ${CMAKE_EXE_LINKER_FLAGS} )
message(STATUS "")

