# Ron was Wrong, Whit is Right

Long challenge name, but short story. We are given an article at this [link](https://sbseminar.wordpress.com/2012/02/16/the-recent-difficulties-with-rsa/), outlining the difficulties in generating RSA keys such that there are no two public keys using the same prime. Because if that's the case, one can very efficiently recover the factorisation by doing Euclid's Algorithm, which runs in polynomial time (and thus much faster compared to factorising), to obtain one of the two primes used in the modulus. 

In other words, with two public modulo $n_1, n_2$, where $n_1 = p * q_1$ and $n_2 = p * q_2$, we can recover $p$ by using Euclid's Algorithm to calculate $gcd(n_1, n_2) = p$, assuming that $q_1$ and $q_2$ are relatively prime.

What's left in the challenge is the script to check every possible pair of modulo whether there exists some greatest common divisor greater than 1, then if one such pair is found, we can perform decryption. The name of the challenge is the name of the [paper](https://eprint.iacr.org/2012/064.pdf) on this topic. There are some syntax difficulties working with the `RSA` module of `pycryptodome`, but from the previous challenges we should have a good idea of how to do decryption on the Python module now.

```python
from Crypto.PublicKey import RSA
from Crypto.Cipher import PKCS1_OAEP
import itertools
import math 

public_keys = []
ciphertexts = []
public_exponents = []

for i in range(1, 51):
    ciphertext = "keys_and_messages/" + str(i) + ".ciphertext"
    public_key = "keys_and_messages/" + str(i) + ".pem"

    ciphertext = open(ciphertext, "r")
    ciphertext = bytes.fromhex(ciphertext.read())
    public_key = open(public_key, "r")
    public_key = RSA.import_key(public_key.read())
    
    ciphertexts.append(ciphertext)
    public_keys.append(public_key.n)
    public_exponents.append(public_key.e)

public_keys_combinations = list(itertools.combinations(public_keys, 2))
ciphertexts_combinations = list(itertools.combinations(ciphertexts, 2))
public_exponents_combinations = list(itertools.combinations(public_exponents, 2))

for i in range(len(public_keys_combinations)):
    n1, n2 = public_keys_combinations[i]

    p = math.gcd(n1, n2)

    if p != 1:
        q1 = n1 // p 
        q2 = n2 // p 

        c1, c2 = ciphertexts_combinations[i]
        e1, e2 = public_exponents_combinations[i]

        phi1 = (p - 1) * (q1 - 1)
        phi2 = (p - 1) * (q2 - 1)

        d1 = pow(e1, -1, phi1)
        d2 = pow(e2, -1, phi2)

        key1 = RSA.construct((n1, e1, d1))
        key2 = RSA.construct((n2, e2, d2))

        cipher1 = PKCS1_OAEP.new(key1)
        cipher2 = PKCS1_OAEP.new(key2)

        print(cipher1.decrypt(c1))
        print(cipher2.decrypt(c2))
```