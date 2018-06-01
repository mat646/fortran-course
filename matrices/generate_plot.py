import matplotlib.pyplot as plt
import numpy as np
import matplotlib

t = np.arange(100, 1000, 10)

x = [100, 200, 300, 400, 500, 600, 700, 800, 900, 1000]
y1 = [0.066, 0.151, 0.245, 0.366, 0.541, 0.675, 0.896, 1.164, 1.454, 1.775]
y2 = [0.056, 0.110, 0.197, 0.291, 0.430, 0.496, 0.698, 0.963, 1.079, 1.308]
y3 = [0.031, 0.083, 0.168, 0.331, 0.391, 0.541, 0.803, 0.930, 1.146, 1.415]
y4 = [0.051, 0.094, 0.181, 0.305, 0.430, 0.566, 0.715, 0.990, 1.168, 1.394]

fig = plt.figure(figsize=(12,7))

ax = fig.add_subplot(111)
plt.semilogy(t, np.exp(t/5000))
ax.plot(x, y1, color='green', label='basic mm')
ax.plot(x, y2, color='red', label='-O2 option')
ax.plot(x, y3, color='purple', label='improved mm')
ax.plot(x, y4, color='yellow', label='improved mm -O2')
plt.title('Multiplication time')
plt.xlabel('number of rows')
plt.ylabel('time in seconds')
ax.legend(fontsize='x-large')
plt.show()