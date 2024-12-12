#include <stdio.h>
#include <string.h>

// Prompt used to generate this test file: can you write a c script that contains 6 functions that each contain 1 loop. Within each
// function allocate an array on the stack that contains elements of an abstract data type.
// Each function's array should be a different abstract data type. Each loop should iterate through all elements within the array and modify one field. There should therefore be 6 abstract datatypes defined. The first data type should be 16 bytes in size. the second should be 24 bytes. the third should be 32 bytes. the fourth should be 40 bytes. the fifth should be 48 bytes. The sixth should be 56.  


// Define the 6 abstract data types
typedef struct {
    char field1[16]; // 16 bytes
} Type16;

typedef struct {
    char field1[24]; // 24 bytes
} Type24;

typedef struct {
    char field1[32]; // 32 bytes
} Type32;

typedef struct {
    char field1[40]; // 40 bytes
} Type40;

typedef struct {
    char field1[48]; // 48 bytes
} Type48;

typedef struct {
    char field1[56]; // 56 bytes
} Type56;

// Function for Type16
void modifyType16Array() {
    Type16 array[10];
    for (int i = 0; i < 10; ++i) {
        strcpy(array[i].field1, "Modified16");
        printf("%s", array[i].field1);
    }
}

// Function for Type24
void modifyType24Array() {
    Type24 array[10];
    for (int i = 0; i < 10; ++i) {
        strcpy(array[i].field1, "Modified24");
        printf("%s", array[i].field1);
    }
}

// Function for Type32
void modifyType32Array() {
    Type32 array[10];
    for (int i = 0; i < 10; ++i) {
        strcpy(array[i].field1, "Modified32");
        printf("%s", array[i].field1);
    }
}

// Function for Type40
void modifyType40Array() {
    Type40 array[10];
    for (int i = 0; i < 10; ++i) {
        strcpy(array[i].field1, "Modified40");
        printf("%s", array[i].field1);
    }
}

// Function for Type48
void modifyType48Array() {
    Type48 array[10];
    for (int i = 0; i < 10; ++i) {
        strcpy(array[i].field1, "Modified48");
        printf("%s", array[i].field1);
    }
}

// Function for Type56
void modifyType56Array() {
    Type56 array[10];
    for (int i = 0; i < 10; ++i) {
        strcpy(array[i].field1, "Modified56");
        printf("%s", array[i].field1);
    }
}

int main() {
    modifyType16Array();
    modifyType24Array();
    modifyType32Array();
    modifyType40Array();
    modifyType48Array();
    modifyType56Array();
    printf("All arrays modified.\n");
    return 0;
}
