cmake_minimum_required(VERSION 2.8)
project( Gray )
find_package( OpenCV REQUIRED )
include_directories( ${OpenCV_INCLUDE_DIRS} )
add_executable( Gray Gray.cpp )
target_link_libraries( Gray ${OpenCV_LIBS} )
