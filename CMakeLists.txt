# windows ------------------
# cmake_minimum_required(VERSION 3.10)
# project(speexdsp C)

# # 设置默认编译类型为 Release
# if(NOT CMAKE_BUILD_TYPE)
#     set(CMAKE_BUILD_TYPE Release)
# endif()

# # 启用 C99
# set(CMAKE_C_STANDARD 99)
# set(CMAKE_C_STANDARD_REQUIRED ON)

# # 查找源文件
# file(GLOB SPEEXDSP_SRC libspeexdsp/*.c)
# list(REMOVE_ITEM SPEEXDSP_SRC ${CMAKE_SOURCE_DIR}/libspeexdsp/testecho.c)
# list(REMOVE_ITEM SPEEXDSP_SRC ${CMAKE_SOURCE_DIR}/libspeexdsp/testecho.c)
# list(REMOVE_ITEM SPEEXDSP_SRC ${CMAKE_SOURCE_DIR}/libspeexdsp/testjitter.c)
# list(REMOVE_ITEM SPEEXDSP_SRC ${CMAKE_SOURCE_DIR}/libspeexdsp/testresample.c)
# list(REMOVE_ITEM SPEEXDSP_SRC ${CMAKE_SOURCE_DIR}/libspeexdsp/testresample2.c)

# # 头文件路径
# include_directories(
#     ${CMAKE_SOURCE_DIR}/include
#     ${CMAKE_SOURCE_DIR}/libspeexdsp
# )

# # 生成静态库
# # add_library(speexdsp STATIC ${SPEEXDSP_SRC})
# # target_compile_definitions(speexdsp PRIVATE EXPORT=)
# # target_compile_definitions(speexdsp PRIVATE USE_KISS_FFT)
# # target_compile_definitions(speexdsp PRIVATE "FLOATING_POINT")
# # 生成动态库
# add_library(speexdsp SHARED ${SPEEXDSP_SRC})
# target_compile_definitions(speexdsp PRIVATE "FLOATING_POINT" "SPEEXDSP_EXPORTS")
# target_compile_definitions(speexdsp PRIVATE USE_KISS_FFT)
# target_compile_definitions(speexdsp PRIVATE EXPORT="__declspec(dllexport)")  # Windows
# # target_compile_definitions(speexdsp_shared PRIVATE EXPORT=__attribute__((visibility("default"))))  # Linux/macOS


# android ------------

cmake_minimum_required(VERSION 3.10)

project(speexdsp)
set(CMAKE_VERBOSE_MAKEFILE ON)
# 设置 C++ 标准
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# 指定编译器
# set(CMAKE_C_COMPILER clang)
# set(CMAKE_CXX_COMPILER clang++)

# 设置 Android 工具链文件的路径
# 设置您的 Android NDK 路径
set(ANDROID_NDK_PATH "D:/Android/Sdk/ndk/28.0.13004108")

# 设置 Android API 级别
set(ANDROID_API_LEVEL 11)

# 设置 Android 架构（可以选择armeabi-v7a, arm64-v8a, x86, x86_64等）
# set(ANDROID_ABI "armeabi-v7a")
set(ANDROID_ABI "arm64-v8a")

# 设置目标架构（ARM 64位或其他）
set(CMAKE_TOOLCHAIN_FILE "${ANDROID_NDK_PATH}/build/cmake/android.toolchain.cmake")

# 设置编译的目标 API 级别
set(ANDROID_NATIVE_API_LEVEL ${ANDROID_API_LEVEL})

# 设置 STL 类型（选择c++_static或c++_shared）
set(ANDROID_STL c++_static)

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


# 设置输出目录
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/libs)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/libs)

# 配置 Android NDK
# include_directories(${ANDROID_NDK_PATH}/sources/android/native_app_glue)

# 设置目标
add_library(speexdsp SHARED ${SPEEXDSP_SRC} )
target_compile_definitions(speexdsp PRIVATE EXPORT=)
target_compile_definitions(speexdsp PRIVATE USE_KISS_FFT)
target_compile_definitions(speexdsp PRIVATE "FLOATING_POINT")

# 安装目标
install(TARGETS speexdsp DESTINATION lib)