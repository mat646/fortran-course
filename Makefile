build:
	gfortran -ffree-form -std=f2008 -fimplicit-none -Wall -pedantic lab3.f90 -o lab3

run:
	./lab3

clean:
	rm lab3 lab2 lab1 gauss.mod
