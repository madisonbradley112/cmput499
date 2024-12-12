// RUN: clang -O3 -fpass-plugin=%shlibdir/libExperimentWithSCEV%shlibext -disable-output 2>&1 %s\
// RUN: | FileCheck %s

// Test the output of the experiment with SCEV pass for a simple example
// CHECK: loop trip count: 100
// CHECK: periodicity of the accesses: 2 
// CHECK: repeated sequence: [ -2; 4; ]
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
int main(int argc, char **argv) {
    char *a = (char *) malloc(sizeof(char) * 1000);
    a = "Hello! This is a string.";

    for (int i = 0; i < 100; i++){
        if (i % 2 == 0) {
            printf("%c", a[i + 3]);
        } else {
            printf("%c", a[i]);
        }
    }
    
    return 0;
}
