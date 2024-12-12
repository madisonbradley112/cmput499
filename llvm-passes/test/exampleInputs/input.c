#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
int main(int argc, char **argv) {
    char *a = (void *) malloc(sizeof(char) * 1000);
    a = "Hello! This is a string.";

	int j = 0;
	int k = 0;
        int ind = 0;
    for (int i = 0; i < 100; i++){
        if (i % 2 == 0) {
            printf("%c", a[i + 3]);
        } else {
            printf("%c", a[i]);
        }
    }
   
    return 0;
}
