# Crossed Wires

We are given `N, e, d` of the sender and `N, e` of his friends. The flag is encrypted using the friend's public keys `e1, e2, ..., e5` under the same modulo `N`.

As seen in this [link](https://www.di-mgt.com.au/rsa_factorize_n.html), we can factorise `N` given `e, d` using the given algorithm. From that, decrypting the plaintext should be trivial.

Sage Implementation (slight modification and this can work on Python too) 

```python
from Crypto.Util.number import long_to_bytes 
from sage.misc.prandom import randint

def factor(N, e, d):
    k = d * e - 1
    
    while True:
        t = k 
        g = Mod(randint(2, N - 1), N)
        
        while t % 2 == 0:
            t = t/2
            x = g ^ t
            
            y = gcd(x - 1, N)
            
            if (x > 1 and y > 1):
                p = y
                q = int(N) // int(p)
                return int(p), int(q)

N, d = ...
e = 0x10001

p, q = factor(N, e, d)
totient = (p - 1) * (q - 1)
friend_keys = ...

c = ...
c = Mod(c, N)

e_total = 1
for key in friend_keys: 
    e_total *= key[1]

d = inverse_mod(e_total, totient)
print(long_to_bytes(int(c ^ d)))
```

Another acute observation by `Draco` on Cryptohack, is that we do not actually need to factor `N`. Indeed, denote $e_1, e_2, e_3, e_4, e_5$ as the public exponents of the friends. If we encode the flag as the integer $m$, we have the ciphertext $c$ as 

$$
c = m ^ {e_1 e_2 e_3 e_4 e_5} \mod N
$$

Since we are given $e, d$, we have $ed = k\phi(N)$. Suppose we have $m ^ x = c \mod N$, then we can compute $y = x ^ {-1} \mod k\phi(N)$. From this, we actually have $xy = 1 \mod \phi(N)$, hence $c ^ y = m ^ {xy} = m \mod N$.

This lead to this insanely short solution:

```python
from Crypto.Util.number import long_to_bytes, inverse

e = 0x10001
N, d = ...

keys = [106979, 108533, 69557, 97117, 103231]
enc_flag = ...

prod = 1
for k in keys:
    prod *= k

dd = inverse(prod, e*d-1)
print(long_to_bytes(pow(enc_flag, dd, N)))
```