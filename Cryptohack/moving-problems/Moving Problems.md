# Moving Problems

Title suggest the use of MOV attack, which is a mapping from ECC to Bilinear Maps to solve DLP. More information can be found on [Crypto StackExchange](https://crypto.stackexchange.com/questions/1871/how-does-the-mov-attack-work). The code is based on [this writeup](https://www.hackthebox.com/blog/movs-like-jagger-ca-ctf-2022-crypto-writeup) on HackTheBox by WizardAlfredo, which the following solution uses the implementation from.

```python
from Crypto.Hash import SHA1
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

def movAttack(G, Q):
    k = 1
    while (p**k - 1) % E.order():
        k += 1

    Ee = EllipticCurve(GF(p**k, 'y'), [a, b])

    R = Ee.random_point()
    m = R.order()
    d = gcd(m, G.order())
    B = (m // d) * R

    assert G.order() / B.order() in ZZ
    assert G.order() == B.order()

    Ge = Ee(G)
    Qe = Ee(Q)

    n = G.order()
    alpha = Ge.weil_pairing(B, n)
    beta = Qe.weil_pairing(B, n)

    print('Computing log...')
    # nQ = discrete_log(beta, alpha)
    nQ = beta.log(alpha)
    return nQ

p = 1331169830894825846283645180581
a = -35
b = 98
E = EllipticCurve(GF(p), [a,b])

G = E(479691812266187139164535778017, 568535594075310466177352868412)
A = E(1110072782478160369250829345256, 800079550745409318906383650948)
B = E(1290982289093010194550717223760, 762857612860564354370535420319)
iv = 'eac58c26203c04f68d63dc2c58d79aca'
encrypted_flag = 'bb9ecbd3662d0671fd222ccb07e27b5500f304e3621a6f8e9c815bc8e4e6ee6ebc718ce9ca115cb4e41acb90dbcabb0d'

nB = movAttack(G, B)
shared_secret = (A * nB).xy()[0]

print(decrypt_flag(shared_secret, iv, encrypted_flag))
```

The script will run for quite some time, ~10 mins, but the flag will eventually come up.

`aloof` from Cryptohack has a similar idea but faster approach. The main idea is the brilliant use of CRT and the note that the order of the group can be factored into `q1 * q2` and we can solve DLP in `q1` and `q2` 