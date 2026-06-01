cmake_minimum_required(VERSION 3.20)

project(wxVideoProcessing LANGUAGES CXX RC)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# vcpkg + config mode
set(CMAKE_TOOLCHAIN_FILE "C:/vcpkg/scripts/buildsystems/vcpkg.cmake" CACHE STRING "")

# root paths
set(PROJECT_ROOT ${CMAKE_CURRENT_LIST_DIR})

# wxWidgets (CONFIG mode через vcpkg)
find_package(wxWidgets REQUIRED COMPONENTS base core adv aui net gl xml propgrid html)
find_package(OpenCV CONFIG REQUIRED)
include(${wxWidgets_USE_FILE})

# global include
include_directories(${PROJECT_ROOT}/include)

# subprojects
add_subdirectory(wxModularCore)
add_subdirectory(wxNonGuiPluginBase)
add_subdirectory(wxGuiPluginBase)

add_subdirectory(SampleNonGuiPlugin)
add_subdirectory(SampleGuiPlugin1)
add_subdirectory(SampleGuiPlugin2)

add_subdirectory(wxModularHost)