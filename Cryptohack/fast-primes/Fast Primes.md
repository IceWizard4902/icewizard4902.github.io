# Fast Primes

The primes are generated using the primorial and the sieve. This is known to be ROCA, the vulnerability CVE-2017-15361. More details can be found at this [link](https://bitsdeep.com/posts/analysis-of-the-roca-vulnerability/). This article is also a great start for understanding a bit of Coppersmith-Howgrave method for finding roots of polynomial. 

Again, an unintended solution is the fact that we can use FactorDB for a quick hack at the factorisation. 

Python Implementation: 

```python
from Crypto.PublicKey import RSA
from Crypto.Cipher import PKCS1_OAEP

f = open('key.pem', 'rb')
key = RSA.import_key(f.read())

p = 51894141255108267693828471848483688186015845988173648228318286999011443419469
q = 77342270837753916396402614215980760127245056504361515489809293852222206596161

totient = (p - 1) * (q - 1)

c = "249d72cd1d287b1a15a3881f2bff5788bc4bf62c789f2df44d88aae805b54c9a94b8944c0ba798f70062b66160fee312b98879f1dd5d17b33095feb3c5830d28"
c = bytes.fromhex(c)
d = pow(key.e, -1, totient)

key = RSA.construct((key.n, key.e, d))
cipher = PKCS1_OAEP.new(key)
plaintext = cipher.decrypt(c)

print(plaintext)
```

The intended solution is to use ROCA. An additional resource is at this [link](https://gist.github.com/zademn/6becc979f65230f70c03e82e4873e3ec). No point in retyping here, the above two resource are sufficient.