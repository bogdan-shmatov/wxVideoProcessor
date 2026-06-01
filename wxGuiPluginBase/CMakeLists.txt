add_library(wxGuiPluginBase SHARED
    wxGuiPluginBase.cpp
    wxGuiPluginWindowBase.cpp
)

target_compile_definitions(wxGuiPluginBase PRIVATE
    DEMO_PLUGIN_EXPORTS
    _USRDLL
    _STDC_CONSTANT_MACROS
)

target_include_directories(wxGuiPluginBase PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${PROJECT_ROOT}/include
)

target_link_libraries(wxGuiPluginBase PRIVATE
    wxWidgets::wxWidgets
    wxModularCore
)