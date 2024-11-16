#include <stdint.h>
#include <stddef.h>
#include <stdio.h>

int main(){
    const size_t N = 4;
    const size_t M = 3;
    uint8_t arr[3][4] = {{1,32,3,1},{4,7,12,1},{7,8,9,9}};
    uint8_t max = arr[0][0];
    size_t res = 0;
    for (size_t i = 0; i < M; i++){
        for (size_t j = 1; j < N; j++){
            if (arr[i][j] > max){
                max = arr[i][j];
                res = i*N+j;
            }
        }
    }
    printf("%ld\n", res);
    
}