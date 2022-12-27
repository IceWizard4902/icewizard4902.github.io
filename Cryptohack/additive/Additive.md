# Additive

This [video from NUS Greyhats](https://www.youtube.com/watch?v=fglP6Z9v3Vg) should help you with this challenge. Basically, in the additive group of $\mathcal F_p$, the discrete logarithms are simply the inverses. 

Denote $a, b$ as the secret keys of Alice and Bob. The public key of Alice and Bob are given by $A = ag \mod p$ and $B = bg \mod p$ (it's normally $g^a$, but we are working with addition here, hence). 

Hence, the secret key $a$ can be recovered by multiplying the multiplicative inverse of $g$ on both sides of $A = ag \mod p$. 

We have:

$$
Ag^{-1} = agg^{-1} \mod p
$$

$$
Ag^{-1} = a \mod p
$$

With this, we can derive the secret key of Alice, then create the shared secret to retrieve the flag.

Python Implementation:

```python
from pwn import * 
import json 
from sage.arith.misc import inverse_mod
from Crypto.Cipher import AES
from Crypto.Util.Padding import pad, unpad
import hashlib

def is_pkcs7_padded(message):
    padding = message[-message[-1]:]
    return all(padding[i] == len(padding) for i in range(0, len(padding)))

def decrypt_flag(shared_secret: int, iv: str, ciphertext: str):
    # Derive AES key from shared secret
    sha1 = hashlib.sha1()
    sha1.update(str(shared_secret).encode('ascii'))
    key = sha1.digest()[:16]
    # Decrypt flag
    ciphertext = bytes.fromhex(ciphertext)
    iv = bytes.fromhex(iv)
    cipher = AES.new(key, AES.MODE_CBC, iv)
    plaintext = cipher.decrypt(ciphertext)
    if is_pkcs7_padded(plaintext):
        return unpad(plaintext, 16).decode('ascii')
    else:
        return plaintext.decode('ascii')

io = remote('socket.cryptohack.org', 13380)
alice = json.loads(io.recvline().strip().decode().split("e: ")[1])

p = int(alice['p'], 16)
g = int(alice['g'], 16)
A = int(alice['A'], 16)

bob = json.loads(io.recvline().strip().decode().split("b: ")[1])
B = int(bob['B'], 16) 

ct = json.loads(io.recvline().strip().decode().split("e: ")[1])
iv = ct['iv']
enc_flag = ct['encrypted']

a = int(inverse_mod(g, p) * A) % p
shared_secret = int((a * B) % p)
print(decrypt_flag(shared_secret, iv, enc_flag))
```