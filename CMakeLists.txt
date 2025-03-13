cmake_minimum_required(VERSION 3.10)
project(speexdsp C)

# 设置默认编译类型为 Release
if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Release)
endif()

# 启用 C99
set(CMAKE_C_STANDARD 99)
set(CMAKE_C_STANDARD_REQUIRED ON)

# 查找源文件
file(GLOB SPEEXDSP_SRC libspeexdsp/*.c)
list(REMOVE_ITEM SPEEXDSP_SRC ${CMAKE_SOURCE_DIR}/libspeexdsp/testecho.c)
list(REMOVE_ITEM SPEEXDSP_SRC ${CMAKE_SOURCE_DIR}/libspeexdsp/testecho.c)
list(REMOVE_ITEM SPEEXDSP_SRC ${CMAKE_SOURCE_DIR}/libspeexdsp/testjitter.c)
list(REMOVE_ITEM SPEEXDSP_SRC ${CMAKE_SOURCE_DIR}/libspeexdsp/testresample.c)
list(REMOVE_ITEM SPEEXDSP_SRC ${CMAKE_SOURCE_DIR}/libspeexdsp/testresample2.c)

# 头文件路径
include_directories(
    ${CMAKE_SOURCE_DIR}/include
    ${CMAKE_SOURCE_DIR}/libspeexdsp
)

# 生成静态库
# add_library(speexdsp STATIC ${SPEEXDSP_SRC})
# target_compile_definitions(speexdsp PRIVATE EXPORT=)
# target_compile_definitions(speexdsp PRIVATE USE_KISS_FFT)
# target_compile_definitions(speexdsp PRIVATE "FLOATING_POINT")
# 生成动态库
add_library(speexdsp SHARED ${SPEEXDSP_SRC})
target_compile_definitions(speexdsp PRIVATE "FLOATING_POINT" "SPEEXDSP_EXPORTS")
target_compile_definitions(speexdsp PRIVATE USE_KISS_FFT)
target_compile_definitions(speexdsp PRIVATE EXPORT="__declspec(dllexport)")  # Windows
# target_compile_definitions(speexdsp_shared PRIVATE EXPORT=__attribute__((visibility("default"))))  # Linux/macOS