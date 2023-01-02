# Roll Your Own

No shot I would get this. This challenge is based on the [Paillier cryptosystem](https://en.wikipedia.org/wiki/Paillier_cryptosystem), an additive homomorphic cryptosystem. 

Paillier cryptosystem exploits the fact that certain discrete logarithms can be computed easily. Indeed, by binomial theorem:

$$
(1 + n) ^ x = 1 + nx + {x \choose 2} n ^ 2 + \text{higher powers of n}
$$

which, under modulo $n ^ 2$, leads to: 

$$
(1 + n) ^ x = 1 + nx \mod n^2
$$

This is the crux of the challenge. Given the prime $q$, to generate $g, n$ such that $g ^ q = 1 \mod n$, one can choose $g = q + 1$ and $n = q ^ 2$. This leads to: 

$$
(1 + q) ^ q = 1 + q ^ 2 = 1 \mod n^2
$$

and given the public key $p$, one can compute the discrete log quickly by $(p - 1) / q$.

Python Implementation:

```python
from pwn import *
import json 

io = remote('socket.cryptohack.org', 13403)
q = io.recvline().decode().strip().split(": ")[1]
q = int(q[1:-1], 0)

# Insane solution
g = q + 1 
n = q ** 2

io.recvuntil(b"Send integers (g,n) such that pow(g,q,n) = 1: ")

to_send = dict()
to_send['g'] = hex(g)
to_send['n'] = hex(n)

io.sendline(json.dumps(to_send).encode())
pub_key = io.recvline().decode().strip().split(": ")[1]
pub_key = int(pub_key[1:-1], 0)

x = (pub_key - 1) // q 

to_send = dict()
to_send['x'] = hex(x)

io.sendline(json.dumps(to_send).encode())
io.interactive()
```

This provides some new light on some group that we can easily compute the discrete log. I have a huge tunnel vision on Euler's theorem, and thought that we are forced to do this under some group of order $q$ - which is not easy for DLP as $q$ is not so smooth. One other solution that I think of is to pick $n = 2 ^ q$, but obviously this does not work as it would take too much time for calculation of this number. Although, DLP becomes very easy as we can specify the generator $g = 2$, and given the public key, we can just calculate the log base 2 of the public key for the private key.

