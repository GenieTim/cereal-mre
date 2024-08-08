cmake_minimum_required(VERSION 3.5.0)
project(CerealMRE VERSION 0.1.0 LANGUAGES C CXX)

# specify the C++ standard
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED True)

include(${CMAKE_CURRENT_LIST_DIR}/vendor/cereal.CMakeLists.cmake)

add_executable(CerealMRE main.cpp)

add_dependencies(CerealMRE cerealLib)

include_directories(${cereal_INCLUDE_DIRS})
