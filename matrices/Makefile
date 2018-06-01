OPT = -fPIC -ffree-form -std=f2008 -fimplicit-none -Wall -pedantic

PFUNIT = /home/mateusz/Aplikacje/pFunit
F90_VENDOR = GNU
F90=gfortran	
SHELL := /bin/bash

include $(PFUNIT)/include/base.mk

FFLAGS +=  -frecursive -ffree-form -std=f2008 -fimplicit-none -Wall -pedantic 
LIBS = $(PFUNIT)/lib/libpfunit.a

PFS = $(wildcard *.pf)
OBJS = $(PFS:.pf=.o)

%.f90: %.pf
	$(PFUNIT)/bin/pFUnitParser.py $< $@

%.o: %.f90
	$(F90) $(FFLAGS) -I$(PFUNIT)/mod -c $<

test: testSuites.inc multTest.o multTestImproved.o $(OBJS)
	$(F90) -fPIC  -o $@ -I. -I$(PFUNIT)/mod -I$(PFUNIT)/include \
		$(PFUNIT)/include/driver.F90 \
		./*$(OBJ_EXT) $(LIBS) $(FFLAGS)


build:
	gfortran $(OPT) -c mult.f90 main.f90 
	gfortran $(OPT) main.o mult.o -o main

build-opt:
	gfortran $(OPT) -c -O2 mult.f90 main.f90 
	gfortran $(OPT) -O2 main.o mult.o -o main

run:
	./main 10 10 basic

run-improv:
	./main 10 10 impro

time-measure:
	@eval $$((time ./main 100 100 impro > /dev/null) &> time.out)
	@eval $$((time ./main 100 200 impro > /dev/null) &>> time.out)
	@eval $$((time ./main 100 300 impro > /dev/null) &>> time.out)
	@eval $$((time ./main 100 400 impro > /dev/null) &>> time.out)
	@eval $$((time ./main 100 500 impro > /dev/null) &>> time.out)
	@eval $$((time ./main 100 600 impro > /dev/null) &>> time.out)
	@eval $$((time ./main 100 700 impro > /dev/null) &>> time.out)
	@eval $$((time ./main 100 800 impro > /dev/null) &>> time.out)
	@eval $$((time ./main 100 900 impro > /dev/null) &>> time.out)
	@eval $$((time ./main 100 1000 impro > /dev/null) &>> time.out)


clean:
	rm *.o *.mod main
