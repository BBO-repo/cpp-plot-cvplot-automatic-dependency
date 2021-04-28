cmake_minimum_required(VERSION 3.14)
project(cvdemo)

set(CMAKE_BINARY_DIR ${CMAKE_SOURCE_DIR}/bin)
set(EXECUTABLE_OUTPUT_PATH ${CMAKE_BINARY_DIR})
add_executable(cvdemo ${PROJECT_SOURCE_DIR}/main.cpp)

# include thirdparty dependencies
include(externals/externals.cmake)

add_dependencies(cvdemo cvplot)
include_directories(cvdemo ${OPENCV_INCLUDE} ${CVPLOT_INCLUDE})
target_link_libraries(cvdemo ${OPENCV_LIBS})
target_compile_definitions(cvdemo PUBLIC CVPLOT_HEADER_ONLY)
