cmake_minimum_required(VERSION 3.27)
project(ccr CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_GENERATOR Ninja)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

add_subdirectory(./packages)