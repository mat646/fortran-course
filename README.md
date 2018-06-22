# Fortran Course

Completed assignments for Fortran Course

## Essentials
- lab1 basic operations
- lab2 numerical integration example

## FDM

Finite Difference Method implementation with error measurement.  
For given problem:

![eq1](https://latex.codecogs.com/gif.latex?-k\frac{d^2u}{dx^2}=0)

with boundary conditions:

![eq2](https://latex.codecogs.com/gif.latex?u(0)=0)  
![eq3](https://latex.codecogs.com/gif.latex?u(1)=1)

program creates system of equations using FDM and solves it with gauss method.
Having returned solution, program computes error connected with real precision.
Concretely single (kind = 4), double (kind = 8) and fourfold (kind = 16) precision.

### Usage

Change directory to /FDM and:

```sh
$ make bulid
```

For concrete kind (4, 8, 16) use option:

```sh
$ make build KIND=kind16
```

And then:

```sh
$ make run
```

Output shows sum of errors for every iteration.  

To inspect system of equations before and after solving change directory to concrete precision and type:

```sh
$ make verbose-run
```

### Results

Plots below show error values output on logarithmic scale.

![plot](https://image.ibb.co/nuqtbx/plot.png)

To generate these plots by yourself:

```sh
$ python3 generate_plot.py
```

## Tests

Simple hello world pFunit test. 


## Matrices

Testing matrices multiplication with pFunit. Module contains simple loop implementation and also improved version with dot product.


### Usage

(FIRST TASK) Change directory to /matrices and:

```sh
$ make bulid
```

And then:

```sh
$ make run
```

(SECOND TASK) To test improved version use:

```sh
$ make run-improv
```

To run tests start with:

```sh
$ rm main.o
```

Then build tests:

```sh
$ make test
```

And finally:

```sh
$ ./test
```

### Results

(THIRD TASK) Time and matrix size dependence for all cases:  

Input for plots generated with:

```sh
$ make time-measure
```

![plot](https://image.ibb.co/gnADNd/plot.png)


## MPI 

Examlpe usage of coarrays. Combining Fortran with Python (f2py). Doxygen documentation. 

### Usage

(TASK ONE) Python usage

```sh
$ make build  

$ make run
```

Generating docs

```sh
$ make docs
```  

(TASK TWO) MPI example

```sh
$ make build-mpi

$ make run-mpi
```  

### Results

(TASK THREE) Time execution comparison

```sh
$ make time-compare
```  

For given (simple) example execution of MPI version is significantly faster.  
