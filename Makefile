CC=gcc
CFLAGS=-I.

hellomake: src/hellomake.o src/hellofunc.o
	$(CC) -o build/hellomake src/hellomake.o src/hellofunc.o