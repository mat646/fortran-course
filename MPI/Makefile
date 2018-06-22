OPT = -ffree-form -std=f2008 -fimplicit-none -Wall -pedantic

docs:
	doxygen DoxygenConfig

build:
	f2py -c -m matrix matrix.f90

run:
	python application.py

build-mpi:
	ifort -coarray matrix_mpi.f90 -o matrix_mpi

run-mpi:
	./matrix_mpi

time-compare:
	time python application.py
	time ./matrix_mpi