cmake_minimum_required(VERSION 3.10)
project(AVXArrayAddition)

# Set C++ standard to C++11 or newer if needed
set(CMAKE_CXX_STANDARD 11)
enable_language(ASM)

# Add your source files here
set(SOURCE_FILES
    ${CMAKE_BINARY_DIR}/../src/main.cpp
    ${CMAKE_BINARY_DIR}/../src/avx_array_addition.s
)

# Create an executable target
add_executable(avx_array_addition ${SOURCE_FILES})

# Add compiler flags
target_compile_options(avx_array_addition PRIVATE -mavx)
set_target_properties( avx_array_addition
    PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/../bin"
)