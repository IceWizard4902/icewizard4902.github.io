# Let's Decrypt Again

The challenge has the most code in it so far, but should not take too long to realize the task we had to do. This follows the same idea as the prequel challenge Let's Decrypt - that is to find an appropriate `N, e` such that the `pow(sig, e, N)` is equal to the value of the PKCS1 padded messages.

However, in this challenge, we had a twist - we can only use one non-prime modulus `N` but has to generate three `e`s such that `pow(sig, e_n, N) = m_n` with `e_n` being the public exponent correlated to the nth message `m_n`. 

Also, the messages has to end with a given suffix and passes the regex checks. Combining the checks together, the form of the three messages should be like this 

```python
btc_addr = "1F1tAaz5x1HUXrCNLbtMDqcw6o5GNn4xqX"
msg1 = "This is a test for a fake signature." + suffix
msg2 = "My name is Vinh and I own CryptoHack.org" + suffix
msg3 = "Please send all my money to " + btc_addr + suffix
```

Now we need to find the appropriate `N` so we can find the discrete logs of the three messages after being padded with PKCS1. This is essentially the Duplicate Signature Key Selection (DSKS) attack on RSA. More information can be found in [this paper](http://mpqs.free.fr/corr98-42.pdf#page=11). Basically, we want to find an `N` such that the prime factors are smooth primes so that we can solve discrete log in `N` using Pohlig-Hellman. 

Before moving to the solution, let's walk through a bit on my failed attempts. 

I initially had the idea of using some special `N` in the form of $p ^ k$, where $p$ is a small prime. However, I only tested on primes like 2, 3, 17 and primes that are less than 5 bits, so none of them returned a solution for the discrete log. So I jumped to the conclusion that this idea is not feasible.

Later, when consulting `ConnorM` from the Cryptohack Discord, he gave me a hint of the idea to generate a smooth prime using the following Python code, then the modulus `N` is the result of squaring a prime.

```python
def smooth_prime(size):
    smooth_p = 1
    i = 2
    while smooth_p < size or not (smooth_p + 1).is_prime():
        smooth_p *= i
        i += 1
    smooth_p += 1
    return smooth_p

n = smooth_prime(2 ^ 400) ** 2
```

`n` should be bigger than the padded messages, else the check of `pow(sig, e, N) == msg` will never be satisfied. However, after consulting `yassinebelarbi`, again from the Cryptohack Discord, this approach is really bad. This is simply because the order of the group, or $\phi(n)$ is equal to $p(p-1)$, hence Pohlig-Hellman will run insanely slow as it will try to run until it reaches `p` (then later retrieve the solution using CRT). 

Hence, `yassinebelarbi` hinted at the use of a different modulo `N = p ^ k` again, but this time `p` is a randomly picked 15-bit prime. This added another layer of randomness to the result of the discrete log, which is beneficial as sometimes discrete logs does not exist for some value of the messages. The challenge creator helps us a bit here - the suffix is there to make the message probabilistic, so we have a higher chance of having a discrete log. This runs significantly faster as `p` is much smaller, hence the Pohlig-Hellman algorithm should not take that long to output the result.

It sometimes will be the case that the discrete log does not exist, if that's the case then just retry until we obtain the flag.

```python
from Crypto.Util.number import bytes_to_long, long_to_bytes, getPrime
from pwn import * 
import json 
from pkcs1 import emsa_pkcs1_v15

BIT_LENGTH = 768

io = remote('socket.cryptohack.org', 13394)
io.recvline()

sig = dict()
sig['option'] = 'get_signature'
io.sendline(json.dumps(sig).encode())
sig = json.loads(io.recvline().decode())['signature']
sig = int(sig, 16)

n = int(getPrime(15) ** 55)

modulus = dict()
modulus['option'] = 'set_pubkey'
modulus['pubkey'] = hex(n)

io.sendline(json.dumps(modulus).encode())
suffix = json.loads(io.recvline().decode())['suffix']

btc_addr = "1F1tAaz5x1HUXrCNLbtMDqcw6o5GNn4xqX"
msg1 = "This is a test for a fake signature." + suffix
msg2 = "My name is Vinh and I own CryptoHack.org" + suffix
msg3 = "Please send all my money to " + btc_addr + suffix

m1 = bytes_to_long(emsa_pkcs1_v15.encode(msg1.encode(), BIT_LENGTH // 8))
m2 = bytes_to_long(emsa_pkcs1_v15.encode(msg2.encode(), BIT_LENGTH // 8))
m3 = bytes_to_long(emsa_pkcs1_v15.encode(msg3.encode(), BIT_LENGTH // 8))

sig = Mod(sig, n)
m1 = Mod(m1, n)
m2 = Mod(m2, n)
m3 = Mod(m3, n)

e1 = int(discrete_log(m1, sig))
e2 = int(discrete_log(m2, sig))
e3 = int(discrete_log(m3, sig))

claim = dict()
claim['option'] = 'claim'
claim['msg'] = msg1 
claim['index'] = int(0) 
claim['e'] = hex(e1)

io.sendline(json.dumps(claim).encode())
s1 = json.loads(io.recvline().decode())['secret']
s1 = bytes.fromhex(s1)

claim['msg'] = msg2 
claim['index'] = int(1) 
claim['e'] = hex(e2)

io.sendline(json.dumps(claim).encode())
s2 = json.loads(io.recvline().decode())['secret']
s2 = bytes.fromhex(s2)

claim['msg'] = msg3 
claim['index'] = int(2)
claim['e'] = hex(e3)

io.sendline(json.dumps(claim).encode())
s3 = json.loads(io.recvline().decode())['secret']
s3 = bytes.fromhex(s3)

print(xor(xor(s1, s2), s3))
```

Some other ideas from `ciphr` at Cryptohack. We can improve a bit the speed of the discrete log calculation knowing the factorization of `N` (which we obviously know as we are constructing `N`). 

```python
x = discrete_log(Zmod(p)(digest), Zmod(p)(SIG0))
y = discrete_log(Zmod(q)(digest), Zmod(q)(SIG0))
e = int(crt(x, y, p-1, q-1))
```

The above can also be found in the general implementation of Pohlig-Hellman anyways, but I was not aware of this way and probably my Sage instance can run a lot faster knowing this technique.

There is also a implementation in Sage that can help generate the smooth primes that we needed. Check out the awesome Sage script by [mimoo](https://github.com/mimoo/Diffie-Hellman_Backdoor/blob/master/backdoor_generator/backdoor_generator.sage#L84). 
