OPT = -ffree-form -std=f2008 -fimplicit-none -Wall -pedantic
KIND = kind8

build:
	gfortran $(OPT) -c $(KIND)/precision.f90
	gfortran $(OPT) -c gauss.f90
	gfortran $(OPT) -c fdm.f90 
	gfortran $(OPT) -c verbose_run.f90
	gfortran $(OPT) verbose_run.o fdm.o gauss.o precision.o -o verbose_run
	gfortran $(OPT) -c main.f90
	gfortran $(OPT) main.o fdm.o gauss.o precision.o -o main

verbose-run:
	./verbose_run 10

run:
	./main

clean:
	rm *.o *.mod main verbose_run
