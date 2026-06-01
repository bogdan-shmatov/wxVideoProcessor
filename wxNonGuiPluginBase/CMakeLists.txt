set(LIBRARY_NAME wxNonGuiPluginBase)

set(SRCS
    wxNonGuiPluginBase.cpp
)

set(HEADERS
    Declarations.h
    wxNonGuiPluginBase.h
)

if(WIN32)
    add_compile_definitions(
        _USRDLL
        DEMO_PLUGIN_EXPORTS
        __STDC_CONSTANT_MACROS
    )
endif()

add_library(${LIBRARY_NAME} SHARED ${SRCS} ${HEADERS})

target_include_directories(${LIBRARY_NAME}
    PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}
        ${PROJECT_ROOT}/include
)

target_link_libraries(${LIBRARY_NAME}
    PRIVATE
        wxWidgets::wxWidgets
)

target_precompile_headers(${LIBRARY_NAME}
    PRIVATE
        ${PROJECT_ROOT}/include/stdwx.h
)