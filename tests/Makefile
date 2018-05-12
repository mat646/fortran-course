PFUNIT = /home/mateusz/Aplikacje/pFunit
F90_VENDOR = Intel

include $(PFUNIT)/include/base.mk

FFLAGS += -ffree-form -std=f2008 -fimplicit-none -Wall -pedantic
LIBS = $(PFUNIT)/lib/libpfunit.a

PFS = $(wildcard *.pf)
OBJS = $(PFS:.pf=.o)

%.f90: %.pf
	$(PFUNIT)/bin/pFUnitParser.py $< $@

%.o: %.f90
	$(F90) $(FFLAGS) -I$(PFUNIT)/mod -c $<

test: testSuites.inc multTest.o $(OBJS)
	$(F90) -o $@ -I. -I$(PFUNIT)/mod -I$(PFUNIT)/include \
		$(PFUNIT)/include/driver.F90 \
		./*$(OBJ_EXT) $(LIBS) $(FFLAGS)