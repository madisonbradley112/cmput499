#include <stdio.h>

int main() {
    int intArray[] = {1, 2, 3, 4, 5};
    float floatArray[] = {1.1, 2.2, 3.3, 4.4, 5.5};
    const char *stringArray[] = {"one", "two", "three", "four", "five"};

    size_t intArraySize = sizeof(intArray) / sizeof(intArray[0]);
    size_t floatArraySize = sizeof(floatArray) / sizeof(floatArray[0]);
    size_t stringArraySize = sizeof(stringArray) / sizeof(stringArray[0]);

    printf("Elements of intArray: ");
    for (size_t i = 0; i < intArraySize; ++i) {
        printf("%d ", intArray[i]);
    }
    printf("\n");

    printf("Elements of floatArray: ");
    size_t j = 0;
    while (j < floatArraySize) {
        printf("%.1f ", floatArray[j]);
        ++j;
    }
    printf("\n");

    printf("Elements of stringArray: ");
    for (size_t k = 0; k < stringArraySize; ++k) {
        printf("%s ", stringArray[k]);
    }
    printf("\n");

    return 0;
}
