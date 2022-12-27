# Static Client 2

The idea may stem from this [question](https://crypto.stackexchange.com/questions/25027/verifying-diffie-hellman-parameters-someone-else-generated/25030#25030) on Crypto StackExchange. We use the same idea as the "nuke" solution in `Static Client` earlier. We will use some groups where the order is smooth, and thus we can efficiently use Pohlig-Hellman. We thus need to pick some weak primes that passes some checks on the server side.

Some of the checks are the following:
- Using number in the form of $p^k$: this may not work (the solution in `Static Client` won't work here) as there is some primality check on the server side. 
- Using some primes without sufficient bit length (the given prime is 1536 bits long): Just use a longer prime, but try to still use some primes where $p - 1$ is smooth. 
- Invalid public key: Should be straightforward, just do $g ^ a \mod p$ as in normal operations.
- Note that we still have to use same generator as in Diffie-Hellman between Alice and Bob earlier.

I am using the script from [Diffie-Hellman_Backdoor](https://github.com/mimoo/Diffie-Hellman_Backdoor/blob/master/backdoor_generator/backdoor_generator.sage#L84) by `mimoo`. In particular, I use the `B_smooth` function. Otherwise, the script is the same as the "nuke" script in `Static Client`.

Another idea for a smooth prime is to use some primorial + 1
Sage Implementation:

```python
from pwn import *
import json 
from Crypto.Util.number import getPrime
from Crypto.Cipher import AES
from Crypto.Util.Padding import pad, unpad
import hashlib

def B_smooth(total_size, small_factors_size, big_factor_size):
    """ Just picking at random should be enough, there is a very small probability
    we will pick the same factors twice
    """
    smooth_prime = 2
    factors = [2]
    # large B-sized prime
    large_prime = random_prime(1<<(big_factor_size + 1), lbound=1<<(big_factor_size-3))
    factors.append(large_prime)
    smooth_prime *= large_prime
    # all the other small primes
    number_small_factors = (total_size - big_factor_size) // small_factors_size
    i = 0
    for i in range(number_small_factors - 1):
        small_prime = random_prime(1<<(small_factors_size + 1), lbound=1<<(small_factors_size-3))
        factors.append(small_prime)
        smooth_prime *= small_prime
    # we try to find the last factor so that the total number is a prime
    # (it should be faster than starting from scratch every time)
    prime_test = 0
    while not is_prime(prime_test):    
        last_prime = random_prime(1<<(small_factors_size + 1), lbound=1<<(small_factors_size-3))
        prime_test = smooth_prime * last_prime + 1

    factors.append(last_prime)
    smooth_prime = smooth_prime * last_prime + 1

    return smooth_prime, factors

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

io = remote('socket.cryptohack.org', 13378)
alice = json.loads(io.recvline().strip().decode().split("e: ")[1])
p = int(alice['p'], 16)
g = int(alice['g'], 16)
A = int(alice['A'], 16)

bob = json.loads(io.recvline().strip().decode().split("b: ")[1])
B = int(bob['B'], 16) 

ct = json.loads(io.recvline().strip().decode().split("e: ")[1])
iv = ct['iv']
enc_flag = ct['encrypted']

send_bob = dict()
gen = B_smooth(2000, 15, 40)
n = gen[0]
# factors = gen[1]
# print(factors)

send_bob['p'] = hex(n)
send_bob['g'] = hex(g)
send_bob['A'] = hex(pow(g, getPrime(1024), n))

io.sendline(json.dumps(send_bob).encode())
bob_secret = json.loads(io.recvline().strip().decode().split("u: ")[1])
bob_encrypted = json.loads(io.recvline().strip().decode().split("u: ")[1])
bob_encrypted_iv = bob_encrypted['iv']
bob_encrypted_sth = bob_encrypted['encrypted']

bob_secret = int(bob_secret['B'], 16)
F = Zmod(n)
g = F(g)
bob_secret = F(bob_secret)
b = discrete_log(bob_secret, g)
shared_secret = pow(A, b, p)
print(decrypt_flag(shared_secret, iv, enc_flag))
```

Another solution is to use a smooth prime equals to some primorial + 1. The following script is from `Robin_Jadoul` from Cryptohack that uses this idea.

```python
from pwn import remote
from json import loads, dumps
from ecc_decrypt import decrypt_flag

io = remote("socket.cryptohack.org", 13378)
A = loads(io.recvline().split(b":", 1)[1])
B = loads(io.recvline().split(b":", 1)[1])
cipher = loads(io.recvline().split(b":",1)[1])
p = int(A["p"], 16)

# Primorial + 1 prime
i = 2
p2 = 1
while p2 < p or not is_prime(p2 + 1):
    p2 *= i
    i += 1
p2 += 1
# p2 = 3**1000
assert p2 > p
assert is_prime(p2)

io.sendline(dumps({"p": hex(p2), "g": "0x2", "A": A["A"]}))
reply = loads(io.recvline().split(b":", 2)[2])
print(reply)
b = discrete_log(Zmod(p2)(int(reply["B"], 16)), Zmod(p2)(2))
assert(int(Zmod(p)(2)^b) == int(B["B"], 16))

print(decrypt_flag(pow(int(A["A"], 16), b, p), cipher["iv"], cipher["encrypted"]))
cipher = loads(io.recvline().split(b":",1)[1])
print(decrypt_flag(0, cipher["iv"], cipher["encrypted"]))
```