cmake_minimum_required(VERSION 3.21)
project(cpp17)

set(CMAKE_CXX_STANDARD 17)

list( APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake)
include(stringPrefix)
include(devtoolset)

enable_testing()

add_subdirectory(filesystem)
add_subdirectory(lang)
add_subdirectory(lib)
add_subdirectory(pmr)
add_subdirectory(poly)
add_subdirectory(tmpl)