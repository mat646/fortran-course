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
	./main 10 10

time-measure:
	@eval $$((time ./main 100 100 > /dev/null) &> time.out)
	@eval $$((time ./main 100 200 > /dev/null) &>> time.out)
	@eval $$((time ./main 100 300 > /dev/null) &>> time.out)
	@eval $$((time ./main 100 400 > /dev/null) &>> time.out)
	@eval $$((time ./main 100 500 > /dev/null) &>> time.out)
	@eval $$((time ./main 100 600 > /dev/null) &>> time.out)
	@eval $$((time ./main 100 700 > /dev/null) &>> time.out)
	@eval $$((time ./main 100 800 > /dev/null) &>> time.out)
	@eval $$((time ./main 100 900 > /dev/null) &>> time.out)
	@eval $$((time ./main 100 1000 > /dev/null) &>> time.out)


clean:
	rm *.o *.mod main
