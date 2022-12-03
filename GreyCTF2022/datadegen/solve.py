import matplotlib.pyplot as plt
import numpy as np 

file1 = open('data.txt', 'r')
lines = file1.readlines()

arr = lines[0].split(", ")
num_arr = []

for i in arr:
	num_arr.append(float(i))

num_arr = sorted(num_arr)
index = [i for i in range(800)]
num_arr = np.array(num_arr)
# plt.scatter(index, num_arr)
# plt.show()

batch = [list() for i in range(3)]

current = num_arr[0]
batch_no = 0
for num in num_arr:
	if (num - current) >= 1:
		batch_no += 1 
	batch[batch_no].append(num)
	current = num 

for i in range(3):
	print(np.mean(batch[i]))