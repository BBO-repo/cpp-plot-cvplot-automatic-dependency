include(ExternalProject)

# opencv contrib
ExternalProject_Add(
    opencv-contrib
    GIT_REPOSITORY https://github.com/opencv/opencv_contrib.git
    GIT_TAG 4.5.2
    PREFIX opencv-contrib
    CONFIGURE_COMMAND cmake -E echo "Skipping configuring step."
    BUILD_COMMAND cmake -E echo "Skipping building step."
    INSTALL_COMMAND cmake -E echo "Skipping install step."
    UPDATE_COMMAND ""	
)
set(OPENCV_CONTRIB_MODULE_PATH ${CMAKE_CURRENT_BINARY_DIR}/opencv-contrib/src/opencv-contrib/modules)

# opencv 
ExternalProject_Add(
    opencv
    GIT_REPOSITORY https://github.com/opencv/opencv.git
    GIT_TAG 4.5.2
    CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=${CMAKE_SOURCE_DIR}/thirdparty/opencv
               -DBUILD_DOCS:BOOL=OFF
               -DBUILD_EXAMPLES:BOOL=OFF
               -DBUILD_NEW_PYTHON_SUPPORT:BOOL=OFF
               -DBUILD_JAVA:BOOL=OFF
               -DBUILD_PACKAGE:BOOL=OFF
               -DBUILD_SHARED_LIBS:BOOL=ON
               -DBUILD_TESTS:BOOL=OFF
               -DBUILD_PERF_TESTS:BOOL=OFF
               -DBUILD_opencv_apps:BOOL=OFF
               -DCMAKE_BUILD_TYPE:STRING=Release
               -DWITH_GTK:BOOL=ON
               -DWITH_V4L:BOOL=ON
               -DOPENCV_EXTRA_MODULES_PATH=${OPENCV_CONTRIB_MODULE_PATH}
    PREFIX opencv
    UPDATE_COMMAND ""
)
add_dependencies(opencv opencv-contrib)
set(OPENCV_LIBS ${CMAKE_SOURCE_DIR}/thirdparty/opencv/lib/${CMAKE_STATIC_LIBRARY_PREFIX}opencv_core${CMAKE_SHARED_LIBRARY_SUFFIX}
                ${CMAKE_SOURCE_DIR}/thirdparty/opencv/lib/${CMAKE_STATIC_LIBRARY_PREFIX}opencv_highgui${CMAKE_SHARED_LIBRARY_SUFFIX}
                ${CMAKE_SOURCE_DIR}/thirdparty/opencv/lib/${CMAKE_STATIC_LIBRARY_PREFIX}opencv_imgcodecs${CMAKE_SHARED_LIBRARY_SUFFIX}
                ${CMAKE_SOURCE_DIR}/thirdparty/opencv/lib/${CMAKE_STATIC_LIBRARY_PREFIX}opencv_imgproc${CMAKE_SHARED_LIBRARY_SUFFIX}
)
set(OPENCV_INCLUDE ${CMAKE_SOURCE_DIR}/thirdparty/opencv/include/opencv4)

# cvplot
ExternalProject_Add(
    cvplot
    GIT_REPOSITORY https://github.com/Profactor/cv-plot.git
    GIT_TAG v1.2.1
    PREFIX cvplot
    CONFIGURE_COMMAND ${CMAKE_COMMAND} -E echo "Skipping configuring step."
    BUILD_COMMAND ${CMAKE_COMMAND} -E echo "Skipping building step."
    INSTALL_COMMAND ${CMAKE_COMMAND} -E copy_directory ${CMAKE_CURRENT_BINARY_DIR}/cvplot/src/cvplot/CvPlot/inc ${CMAKE_SOURCE_DIR}/thirdparty/cvplot
    UPDATE_COMMAND ""	
)
add_dependencies(cvplot opencv)
set(CVPLOT_INCLUDE ${CMAKE_SOURCE_DIR}/thirdparty/cvplot)
