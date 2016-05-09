
all : cAll adaAll fortranAll cobolAll clean


cAll :
	gcc -Wall -ansi -std=c99 src/cIter.c -o bin/cIter
	gcc -Wall -ansi -std=c99 src/cRecur.c -o bin/cRecur

adaAll :
	gnatmake src/adarecur.adb -o bin/adarecur
	gnatmake src/adaiter.adb  -o bin/adaiter

fortranAll :
	gfortran  src/fortranRecur.f95 -o bin/fortranRecur
	gfortran  src/fortranIter.f95 -o bin/fortranIter

cobolAll :
	cobc -x -free -Wall src/cobolIter.cob -o bin/cobolIter

clean:
	rm *.o *.ali
