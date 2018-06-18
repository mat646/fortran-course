OPT = -ffree-form -std=f2008 -fimplicit-none -Wall -pedantic

generate-docs:
	doxygen DoxygenConfig

build:
	f2py -c -m matrix matrix.f90

run:
	python application.py

run-mpi:
	ifort -coarray matrix_mpi.f90 -o matrix_mpi
	./matrix_mpi
