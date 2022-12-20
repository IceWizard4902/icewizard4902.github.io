# Infinite Descent 

From the code, we can observe that the way that the primes are generated is a bit weird - the primes are very close to each other. This is a very classic problem which happens in real life - some RSA modulus is cracked because of the distance of the primes being too small. The code opens up a vector for an attack - the Fermat's factorization method when the prime difference is small. This [post](https://crypto.stackexchange.com/questions/5262/rsa-and-prime-difference) from the Crypto StackExchange sums up everything there is for this challenge.

Sage Implementation:

```python
from Crypto.Util.number import long_to_bytes

def fermat_factorisation(N):
    a = ceil(sqrt(N))
    b2 = a ^ 2 - N
    
    while not b2.is_square():
        a += 1
        b2 = a ^ 2 - N
    
    return a - sqrt(b2)

n = ...
e = 65537
c = ...

p = fermat_factorisation(n)
q = n // p

totient = (p - 1) * (q - 1)
d = inverse_mod(e, totient)
print(long_to_bytes(int(pow(c, d, n))))
```
