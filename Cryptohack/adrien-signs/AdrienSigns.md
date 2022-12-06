# Adrien's Signs

We are given the following Python code for encrypting the flag: 

```python
from random import randint

a = 288260533169915
p = 1007621497415251

FLAG = b'crypto{????????????????????}'


def encrypt_flag(flag):
    ciphertext = []
    plaintext = ''.join([bin(i)[2:].zfill(8) for i in flag])
    print(plaintext)
    for b in plaintext:
        e = randint(1, p)
        n = pow(a, e, p)
        if b == '1':
            ciphertext.append(n)
        else:
            n = -n % p
            ciphertext.append(n)
    return ciphertext
```

The way that the encryption works is that if it encounters a bit with value "1" in the binary representation of the plaintext (or the flag itself), then it appends $$a^e \mod p$$ to the ciphertext array, otherwise it appends $$-a^e \mod p$$.

The unintended solution, which is based on a naive "hunch" that we can only find the discrete log, or $$e$$ of a given number in the ciphertext array if and only if the value of the plaintext bit is `1`. Hence, we have a solution in Sage, which takes advantage of the `discrete_log` functionality: 

```python

from sage.groups.generic import discrete_log
from tqdm import tqdm

out = <array in output.txt given>


a = 288260533169915
p = 1007621497415251
a = Mod(a, p)

flag = ""

for c in tqdm(out): 
    try:
        discrete_log(c, a, bounds=(1, p))
        flag += "1"
    except ValueError:
        flag += "0"

for i in range(0, len(flag), 8):
    flag_original = flag[i:i + 8]
    print(chr(int(flag_original, 2)), end="")
```

The above relies on a unproven assumption that there does not exist $$b$$ and $$c$$ in the finite group such that $$a ^ b + a ^ c \equiv 0 \mod p$$.

The intended solution, however, relies on a "smarter" observation. We observe that the prime used is of the form $$4k + 3$$, and that the Legendre Symbol of $$a$$ is `1`. So if $$a$$ is a quadratic residue mod $$p$$, all powers of a will be too. With the encrypted bit $$b = 0$$, we store the value of $$-(a^e)$$, which is not a quadratic residue as the Legendre Symbol will be 

$$
(\frac{-1}{p}) = (-1)^{\frac{p - 1}{2}} = -1
$$

We have the above as $$\frac{p - 1}{2}$$ is odd (due to $$p = 3 \mod 4$$). To sum up, we compute the Legendre symbol of the number, if it's a quadratic residue, then we have a $$1$$ bit, otherwise $$0$$ bit.