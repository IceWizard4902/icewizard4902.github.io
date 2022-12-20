# Marin's secret 

The primes used for the modulus `N` is of the form `2 ^ x - 1`. Such primes are called [Mersenne's primes](https://en.wikipedia.org/wiki/Mersenne_prime), named after French mathematician Marin Mersenne. 

A quick hack for factorisation is to lookup FactorDB, as I assume the primes are studied extensively. The result from FactorDB shows two primes $2^{2203}-1$ and $2^{2281}-1$

Another solution involves a bit of math. Suppose the two primes used are $2 ^ a - 1$ and $2 ^ b - 1$, and $a \leq b$. We thus have: 

$$
n = (2 ^ a - 1)(2 ^ b - 1) = 2 ^ {a + b} - 2 ^ a - 2 ^ b + 1 = 2 ^ a (2 ^ b - 2 ^ {b - a} - 1) + 1
$$

Thus, we have:

$$
n - 1 = 2 ^ a (2 ^ b - 2 ^ {b - a} - 1)
$$

We thus can divide $n - 1$ by 2 until the result is odd. We can divide $n - 1$ by that odd result to obtain $2 ^ a$. Recovering `p,q` should be trivial after this.

Python Implementation: 

```python
from Crypto.Util.number import long_to_bytes, inverse

n = ...
e = 65537
c = ...

z = n-1
a = 0

while z % 2 == 0:
    z //= 2
    a += 1
    
p = (2**a - 1)
q = n // p

phi = (p-1)*(q-1)
d = inverse(e, phi)

m = pow(c, d, n)

print(long_to_bytes(m))
```
