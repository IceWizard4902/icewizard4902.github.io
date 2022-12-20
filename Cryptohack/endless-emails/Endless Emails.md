# Endless Emails

We are given multiple messages, but from the hint, some of the messages are repeated. Hence, it is likely some (if not all) of the messages will be the same. That is, there is a message $m$, moduli $n_i$, and ciphertext $c_i$ such that: 

$$
\forall i, c_i \equiv m ^ 3 \mod n_i
$$

Hence, we can employ Chinese Remainder Theorem in this case. This is also a simplified form of Hastad's broadcast attack. Since $m < N$ for all modulo $N$, the result from the CRT is indeed the solution. We will take all triplets of the given ciphertexts and corresponding modulo since one of such triplets will contain the ciphertexts 

Sage Implementation: 

```python
from sage.all import*
from itertools import combinations

# we know that some messages are the same. I supposed, there'll be a triple of the same encrypted messages, cause:
# m^3 = c1 (mod n1) => m < n1 (rsa condition)
# m^3 = c2 (mod n2) => m < n2
# m^3 = c3 (mod n3) => m < n3
# hence m^3 < n1*n2*n3 => m^3 % n1*n2*n3 == m^3

# simple CRT and then taking a cube root(in real field) of the obtained variable is our answer


cs = ...
ns = ...

choices = [(x, y) for x, y in zip(cs, ns)] # making pairs (c, n)
triples = list(combinations(choices, 3))

ans = []

for i in triples:
    c = [x[0] for x in i]
    n = [x[1] for x in i]
    l = crt(c, n)
    l = pow(l, 1/3)
    if(l.is_integer()): ans.append(l)

for a in ans:
    print(bytes.fromhex(hex(a)[2:]))
```