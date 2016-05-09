/*
* Dimitri Frederick
* Cis3190 A4
*
* C
* Recursive russian peasant Multiplication
*
*/

#include <stdio.h>

unsigned long long int peasantMult(unsigned long long int m, unsigned long long int n){
	if(m ==1 ){
		return n;
	}
	else if ((m > 1) && (m % 2)==0 ){
		return peasantMult((m/2),(n*2));
	}
	else if ((m > 1) && (m % 2)==1 ){
		return (peasantMult((m/2),(n*2)) + n);
	}
	else{
		return 0;
	}
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
