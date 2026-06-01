add_library(SampleNonGuiPlugin SHARED
    SampleNonGuiPlugin.cpp
    SampleNonGuiPluginExports.cpp
)

target_include_directories(SampleNonGuiPlugin PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${PROJECT_ROOT}/include
    ${PROJECT_ROOT}/wxNonGuiPluginBase
)

target_link_libraries(SampleNonGuiPlugin PRIVATE
    wxNonGuiPluginBase
    wxWidgets::wxWidgets
)