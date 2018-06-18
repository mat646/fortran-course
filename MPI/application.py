import matrix
import numpy as np


mat1 = np.random.rand(3,3) 
mat2 = np.random.rand(3)  
mat3 = np.random.rand(3,3) 


r1, r2 = matrix.gauss(mat1, mat2, 3)

result = matrix.mult(mat3, mat1, 3, 3)

print(result)
