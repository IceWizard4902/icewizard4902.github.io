# Export-grade 

This challenge is simulating the infamous [Logjam](https://weakdh.org/) attack on many internet protocols like HTTPS, SSH, IPsec, SMTPS and protocols rely on TLS that uses Diffie-Hellman key exchange. The Logjam attack allows a man-in-the-middle attacker to downgrade vulnerable TLS connections to 512-bit export-grade cryptography, as there is an option for clients back when the paper is published to use `DHE_EXPORT` level of security. There is no indication of the cipher suites the server has chosen, so a MiTM can easily modify the client's ciphersuite to be `DHE_EXPORT`. More information can be found in this [paper](https://weakdh.org/imperfect-forward-secrecy-ccs15.pdf).

This idea is used in the challenge. Initially, Alice offered a list containing the list of supported ciphersuites, ranging from `DH1536` to `DH64`. There is nothing to stop us from modifying this message, hence we can pick the weakest option in the list, which is `DH64`. Afterwards, the usual key-exchange is performed, and we got information of the `g, p, A, B` and the `iv, encrypted_flag` generated from the shared secret. 

Python Implementation to obtain the above information:

```python
from pwn import *
import json 

io = remote('socket.cryptohack.org', 13379)
alice_suite = io.recvline().strip().decode().split("e: ")[1]
alice_suite = json.loads(alice_suite)
alice_suite["supported"] = alice_suite["supported"][-1:]
io.sendline(json.dumps(alice_suite).encode())

bob_suite = io.recvline().strip().decode().split("b: ")[2]
bob_suite = json.loads(bob_suite)
io.sendline(json.dumps(bob_suite).encode())

alice_secret = io.recvline().strip().decode().split("e: ")[2]
alice_secret = json.loads(alice_secret)

bob_secret = io.recvline().strip().decode().split("b: ")[1]
bob_secret = json.loads(bob_secret)

flag = io.recvline().strip().decode().split("e: ")[1]
flag = json.loads(flag)

io.close()

g = int(alice_secret["g"], 16)
p = int(alice_secret["p"], 16)
A = int(alice_secret["A"], 16)
B = int(bob_secret["B"], 16)
iv = flag['iv']
encrypted_flag = flag['encrypted_flag']

print("g =", g)
print("p =", p)
print("A =", A)
print("B =", B)
print("iv =", iv)
print("encrypted_flag =", encrypted_flag)
```

Again, `DH64` is weak, and a brute-force attack to derive the secret of either Alice and Bob can be performed on a laptop. I initially pick the Baby-step-Giant-step (BSGS) algorithm. Unfortunately, this did not end up well as the space on my hard drive got wiped out in seconds. Also, the runtime is very slow $O(\sqrt n)$, where $n = 2 ^ {64}$. Hence, the approach to solve this using simple Python code using BSGS is not possible.

Another solution is to use [Pohlig-Hellman algorithm](https://en.wikipedia.org/wiki/Pohlig%E2%80%93Hellman_algorithm). The prime is weak (we can always take a look at [FactorDB](http://factordb.com/)) and hence the number should be smooth. Or we can skip all of this work and use the `discrete_log` functionality provided by Sage. Sage unfortunately has some problems with installing `pwntools`, so at the end of the above Python script I decided to print out everything to solve the discrete log problem on Sage.

Sage Implementation

```python
from sage.groups.generic import discrete_log
from sage.arith.misc import power_mod
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

# From the Python script output
p = 16007670376277647657
g = Mod(2, p)
A = Mod(6328845784171041985, p)
B = 8437666211566471050
iv = "5bc3342857710fa5dfad65c1b1a41368"
encrypted_flag = "c8ac067b22b21f86201a0f4b701004288936fe86b9fbca93dd6df9be77fbc992"

a = discrete_log(A, g)
shared_secret = int(power_mod(B, a, p))
print(decrypt_flag(shared_secret, iv, encrypted_flag))
```

