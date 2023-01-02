# Digestive

It is `ECDSA`, except that there is no hashing algorithm in use. Instead, the hashing algorithm just returns the `data` that it passes in. This makes it trivial to forge messages with the correct signatures.

```python
class HashFunc:
    def __init__(self, data):
        self.data = data

    def digest(self):
        # return hashlib.sha256(data).digest()
        return self.data
```

The following is referring to this [question](https://crypto.stackexchange.com/questions/86267/can-the-ecdsa-still-work-without-present-of-hashing-function) on Crypto StackExchange. The answer mentions how the signing of a message is [carried out](https://en.wikipedia.org/wiki/Elliptic_Curve_Digital_Signature_Algorithm). Referring to the Wikipedia post on `ECDSA` signing, in step 1, instead of passing through a hash function, the data is retained. In step 2, $z$ is the $L_n$ leftmost bits of $e$, where $L_n$ is the bit length of the group order $n$. From the [NIST entry](https://csrc.nist.gov/csrc/media/projects/cryptographic-standards-and-guidelines/documents/examples/ecdsa_prime.pdf) on ECDSA, the hashing algorithm output must be 160 bits, or 20 bytes. 

The first 20 bytes of the signed message is 

```python
msg = json.dumps({"admin": False, "username": "some_santized_username"})
print(msg.encode()[:20])
# b'{"admin": false, "us'
```

The signing algorithm does not care about the value of the username it is trying to sign, or more accurately the string following the first 20 characters. Hence, we can append almost anything to the `msg` sent to `verify`, with some previously generated signature from `sign(username)`, and it will be valid. 

Another crucial observation is that `{"admin": false, "username": "admin", "admin": true}` is equivalent to `{"admin": true, "username": "admin"}`. Hence, we can append `"admin": true` to the message previously signed, and send with this forged message the previously requested signature. 

Python Implementation: 

```python
import requests
import json 

url_sign = "https://web.cryptohack.org/digestive/sign/"
url_verify = "https://web.cryptohack.org/digestive/verify/"

# Any username value works
username = "admin"
r = requests.get(url_sign + username)

# Forging a new message with the signature obtained
response = json.loads(r.text)

# Append admin = True to the dictionary, note that we can't use json.dumps here
# as it will shrink into {"admin": true, "username": "admin"}, which will have
# a different first 20 characters
msg = '{"admin": false, "username": "admin", "admin": true}' 
signature = response['signature'] # previously requested signature

r = requests.get(url_verify + msg + "/" + signature)
print(r.text)
```