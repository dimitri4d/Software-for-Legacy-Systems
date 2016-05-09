/*
* Dimitri Frederick
* Cis3190 A4
*
* C
* itterative russian peasant Multiplication
*
*/

#include <stdio.h>

unsigned long long int peasantMult(unsigned long long int m, unsigned long long int n){
	unsigned long long int p=0;
    
    while (m >= 1){
		
        // m is even, double n, halve m, no addition to sum
        if ((m > 1) && (m % 2)==0 ){
            n *= 2;
            m /= 2;
        }
        
        // m is odd, add n addition to sum, double n, halve m,
        if ((m > 1) && (m % 2)==1 ){
            p += n;
            n *= 2;
            m /= 2;
        }

        if (m == 1){
            p += n;
            break;
        }
    }
    return p;
}

int main(int argc, char **argv){
	unsigned long long int m ;
    unsigned long long int n ;
    unsigned long long int p=0;

    printf("Enter 2 numbers to Multiply \n");
    scanf("%lld %lld", &m, &n);
    p = peasantMult(m,n);
    printf("%llu \n",p);
    return 0;
}
