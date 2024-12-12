
#include <stdio.h>
#include <stdlib.h>

int main(){
  int arr[6] = {1,2,3,4,5,6};
  for(int i=0; i<6; i++){
    arr[i]=-(i+1);
	//printf("the element accessed is %d at array index %d\n", arr[i], i );
  }
}
