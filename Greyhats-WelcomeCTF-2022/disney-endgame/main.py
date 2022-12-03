lines = [line.rstrip() for line in open('diff.txt')]
lines = list(filter(lambda a: a != "", lines))

original = lines[0::2]
alter = lines[1::2]

flag = ""
for i in range(len(original)):
	o = original[i]
	a = alter[i]
	found_diff = False

	for j in range(len(o)):
		if o[j] != a[j]:
			flag += a[j]
			found_diff = True 
			break 

	if not found_diff:
		flag += a[len(o)]

print(flag)