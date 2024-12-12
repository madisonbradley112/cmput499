#include <stdio.h>
#include <string.h>

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

// Function for Type16 with increment of 1
void modifyType16Array() {
    Type16 array[50];
    for (int i = 0; i < 50; i += 1) {
        strcpy(array[i].field1, "Modified16");
    }
}

// Function for Type24 with increment of 2
void modifyType24Array() {
    Type24 array[50];
    for (int i = 0; i < 50; i += 2) {
        strcpy(array[i].field1, "Modified24");
    }
}

// Function for Type32 with increment of 3
void modifyType32Array() {
    Type32 array[50];
    for (int i = 0; i < 50; i += 3) {
        strcpy(array[i].field1, "Modified32");
    }
}

// Function for Type40 with increment of 4
void modifyType40Array() {
    Type40 array[50];
    for (int i = 0; i < 50; i += 4) {
        strcpy(array[i].field1, "Modified40");
    }
}

// Function for Type48 with increment of 5
void modifyType48Array() {
    Type48 array[50];
    for (int i = 0; i < 50; i += 5) {
        strcpy(array[i].field1, "Modified48");
    }
}

// Function for Type56 with increment of 6
void modifyType56Array() {
    Type56 array[50];
    for (int i = 0; i < 50; i += 6) {
        strcpy(array[i].field1, "Modified56");
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
