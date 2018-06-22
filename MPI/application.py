import matrix
import numpy as np


mat1 = np.random.rand(8, 8) 
mat2 = np.random.rand(8)  
mat3 = np.random.rand(8, 8) 


r1, r2 = matrix.gauss(mat1, mat2, 8)

result = matrix.mult(mat3, mat1, 8, 8)

print(result)
