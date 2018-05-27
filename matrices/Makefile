OPT = -ffree-form -std=f2008 -fimplicit-none -Wall -pedantic

build:
	gfortran $(OPT) -c mult.f90 main.f90 
	gfortran $(OPT) main.o mult.o -o main

run:
	./main

clean:
	rm *.o *.mod main
