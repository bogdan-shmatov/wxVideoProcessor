add_library(SampleGuiPlugin1 SHARED
    SampleGuiPlugin1.cpp
    SampleGuiPlugin1Exports.cpp
    SampleGuiPluginWindow1.cpp
    SampleGuiPlugin1.def
    SampleGuiPlugin1.h
    SampleGuiPluginWindow1.h
)

target_include_directories(SampleGuiPlugin1 PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${PROJECT_ROOT}/include
    ${PROJECT_ROOT}/wxGuiPluginBase
)

target_link_libraries(SampleGuiPlugin1 PRIVATE
    wxGuiPluginBase
    wxWidgets::wxWidgets
    opencv_core
    opencv_imgproc
)