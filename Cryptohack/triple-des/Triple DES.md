# Triple DES

I did not manage to solve this, I was trying to brute force the `IV` used in the challenge, but seems like $2^{64}$ possibilities of possible `IV`s is simply too many for my laptop to handle. Peek at the solution and I'm glad I did because there is no shot that I know this.

`DES`, or `3DES` also, suffer the problem of [weak keys](https://en.wikipedia.org/wiki/Weak_key). These are keys that cause the encryption mode of DES to act identically to the decryption mode of DES (albeit potentially that of a different key). In operation, the secret 56-bit key is broken up into 16 subkeys according to the DES key schedule; one subkey is used in each of the sixteen DES rounds. DES weak keys produce sixteen identical subkeys. This problem apparently applies to [3DES](https://security.stackexchange.com/questions/6510/is-tdea-tripledes-invulnerable-to-the-weak-keys-of-des).

Since there is a check from `pycryptodome` for the weak keys listed (showing the error of 3DES degenerating into DES), we cannot use directly the keys listed. We can construct a weak key for triple DES by concatenating two distinct weak keys from single DES, needed to bypass PyCryptodome's check that ensures that triple DES does not degenerate into single DES.

Hence, since encryption and decryption are symmetrical now, we can apply encryption two times to retrieve back the plaintext of the flag. The script below is from `TG91aXM` from Cryptohack.

Python Implementation:

```python
import requests
from Crypto.Util.Padding import unpad

def encrypt_flag(key):
    res = requests.get(f"http://aes.cryptohack.org/triple_des/encrypt_flag/{key.hex()}")
    return bytes.fromhex(res.json()['ciphertext'])

def encrypt(key, plaintext):
    res = requests.get(f"http://aes.cryptohack.org/triple_des/encrypt/{key.hex()}/{plaintext.hex()}/")
    return bytes.fromhex(res.json()['ciphertext'])

# DES weak keys
key1 = b"\x01\x01\x01\x01\x01\x01\x01\x01"
key2 = b"\xfe\xfe\xfe\xfe\xfe\xfe\xfe\xfe"

# 3DES weak key = key1 || key2
key = key1 + key2

encrypted_flag = encrypt_flag(key)
flag = unpad(encrypt(key, encrypted_flag), 8)
print(flag.decode())
```