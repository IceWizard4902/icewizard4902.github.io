import re

file = open('ghost')
c = [x[:-1] for x in file.readlines()]
file.close()
flag = []

for line in c:
	num = re.findall(r"(\s+)", line)
	if num:
		num = ''.join(num).replace(' ', '0').replace('\t', '1')
		print(num)


print(''.join(flag))