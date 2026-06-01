add_executable(wxModularHost WIN32
    MainFrame.cpp
    SampleModularCore.cpp
    wxModularHostApp.cpp
    MainFrame.h
    SampleModularCore.h
    wxModularHostApp.h
)

target_include_directories(wxModularHost PRIVATE
    ${PROJECT_ROOT}/include
    ${PROJECT_ROOT}/wxModularCore
    ${PROJECT_ROOT}/wxGuiPluginBase
    ${PROJECT_ROOT}/wxNonGuiPluginBase
)

target_link_libraries(wxModularHost PRIVATE
    wxModularCore
    wxNonGuiPluginBase
    wxGuiPluginBase
    wxWidgets::wxWidgets
)

add_dependencies(wxModularHost wxModularCore)