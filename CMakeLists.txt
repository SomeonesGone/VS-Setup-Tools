#set project name
set(NAME AppName)
#----------------------------------------------------------------------
#set minimum required Cmake version

cmake_minimum_required(VERSION 3.22.1)

#----------------------------------------------------------------------
#set project properties

project(${NAME} C CXX) 
set(CMAKE_CXX_STANDARD 23)
set(CMAKE_C_STANDARD 23)

#----------------------------------------------------------------------
#set precompiled definitions

set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} -DMY_DEBUG")

#----------------------------------------------------------------------
#set optimization flags

if (CMAKE_BUILD_TYPE MATCHES Release)
    set(CMAKE_CXX_FLAGS "-O3")
elseif (CMAKE_BUILD_TYPE MATCHES Debug)
    set(CMAKE_CXX_FLAGS "-g")
endif ()

#----------------------------------------------------------------------
#set all cpp files in App as executables

file(GLOB_RECURSE APP App/*.cpp)
add_executable(${NAME} ${APP})

#----------------------------------------------------------------------
#precompile pch.h headers

target_precompile_headers(${NAME} PRIVATE App/pch.h)

#----------------------------------------------------------------------
#add core subdirectory for ease of including user made code in the app

include_directories("Core/")