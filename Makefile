OPT = -ffree-form -std=f2008 -fimplicit-none -Wall -pedantic

build:
	gfortran $(OPT) -c fdm.f90
	gfortran $(OPT) -c gauss.f90
	gfortran $(OPT) -c main.f90
	gfortran $(OPT) main.o fdm.o gauss.o -o main

run:
	./main 50

clean:
	rm *.o *.mod gauss.mod main
