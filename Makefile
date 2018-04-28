OPT = -ffree-form -std=f2008 -fimplicit-none -Wall -pedantic

build:
	gfortran $(OPT) -c FDM.f90
	gfortran $(OPT) -c gauss.f90
	gfortran $(OPT) -c lab3.f90
	gfortran $(OPT) -c main.f90
	gfortran $(OPT) main.o FDM.o gauss.o -o main
	gfortran $(OPT) lab3.o FDM.o gauss.o -o lab3

run:
	./lab3
	./main 10

clean:
	rm lab3 lab2 lab1 gauss.mod
