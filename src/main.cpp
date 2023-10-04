#include <iostream>
#include <cstring>
#include "avx_array_addition.h"

int main() {
    const int size = 32; // Change the array size as needed
    int a[size], b[size], result[size];

    // Initialize arrays 'a' and 'b' with some values
    for (int i = 0; i < size; i++) {
        a[i] = i;
        b[i] = 2 * i;
    }

    ::memset(result, 0, sizeof(result));

    // Call the AVX function to add the arrays
    addArraysAVX(a, b, result, size);

    // Print the result
    std::cout << "Result:" << std::endl;
    for (int i = 0; i < size; i++) {
        std::cout << result[i] << " ";
    }
    std::cout << std::endl;

    return 0;
}
