add_library(SampleGuiPlugin2 SHARED
    SampleGuiPlugin2.cpp
    SampleGuiPlugin2Exports.cpp
    SampleGuiPluginWindow2.cpp
    SampleGuiPlugin2.h
    SampleGuiPluginWindow2.h
)

target_include_directories(SampleGuiPlugin2 PRIVATE
    ${PROJECT_ROOT}/include
    ${PROJECT_ROOT}/wxGuiPluginBase
)

target_link_libraries(SampleGuiPlugin2 PRIVATE
    wxGuiPluginBase
    wxWidgets::wxWidgets
)