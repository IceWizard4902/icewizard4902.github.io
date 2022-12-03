import perm 
import random 

arr = [i for i in range(12)]
random.shuffle(arr)

g = perm.Perm(arr)

# FIRST TEST
def first_test(g, n):
    res = g
    for i in range(n - 1):
        res *= g 
    print(str(res) == str(g ** n))

first_test(g, 3) # Returns True
# first_test(g, 329394) # Returns True

## THIRD TEST
def third_test(g, n):
    for i in range(1, n):
        print(g ** i)

third_test(g, 20)

# THIRD, ADDITIONAL TEST
# VERIFY IF g ^ n = g ^ (n + cycle)
def find_cycle_naive(g):
    cycle = 2 
    while True:
        if (str(g ** cycle) == str(g)):
            return cycle 
        cycle += 1

cycle = find_cycle_naive(g) - 1
print(str(g ** 2 * g ** cycle) == str(g ** 2))
print()

# FOURTH TEST
g = [9, 7, 2, 1, 3, 6, 5, 4, 0, 8]
g = perm.Perm(g)
cycle = find_cycle_naive(g) - 1
print("Cycle:", cycle)

for i in range(cycle + 1):
    print(g ** i)
