#set Solution name (The thing that contains everything)
set(NAME name)
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

#add App and Core subdirectories

add_subdirectory(App)
add_subdirectory(Core)