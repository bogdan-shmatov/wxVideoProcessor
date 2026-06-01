set(LIBRARY_NAME wxModularCore)

set(SRCS
    wxModularCore.cpp
    wxModularCoreSettings.cpp
)

set(HEADERS
    wxModularCore.h
    wxModularCoreSettings.h
)

if(WIN32)
    add_compile_definitions(__STDC_CONSTANT_MACROS)
endif()

add_library(${LIBRARY_NAME} STATIC ${SRCS} ${HEADERS})

target_include_directories(${LIBRARY_NAME}
    PUBLIC
        ${PROJECT_ROOT}/include
    PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}
)

target_precompile_headers(${LIBRARY_NAME}
    PRIVATE
        ${PROJECT_ROOT}/include/stdwx.h
)