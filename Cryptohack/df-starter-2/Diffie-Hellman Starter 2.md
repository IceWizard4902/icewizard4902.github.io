# Diffie-Hellman Starter 2 

The task is to find the generator of the finite field. There are multiple ways to do this: 

Naive implementation (brute-force). Credits to `Landryl` @ Cryptohack.

```python
'''
Rather than using a set and checking if every element of Fp has been
generated, we can also rapidly disregard a number from being a generator
by checking if the cycle it generates is smaller in size than p.
If we detect a cycle before p elements, k can't be a generator of Fp.
'''

def is_generator(k, p):
  for n in range(2, p):
    if pow(k, n, p) == k:
      return False
  return True

p = 28151
for k in range(p):
  if is_generator(k, p):
    print(k)
```

My solution in Sage: 

```python
from sage.all import *

p = 28151
F = FiniteField(p, modulus='primitive')
print(F.gen())
```

Shorter solution in Sage:

```python
GF(28151).primitive_element()
```

