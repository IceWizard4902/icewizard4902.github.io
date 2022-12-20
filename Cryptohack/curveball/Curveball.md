# Curveball

The name of the challenge is the name of the vulnerability [CVE-2020-0601](https://www.youtube.com/watch?v=8RI60aRyhoE) on the `crypto32.dll` utility on the Microsoft Windows operating system. This vulnerability only targets ECC, and that an adversary can specify their own generator, private key and curve used, as Windows allows for this specifying arbitrary curve behavior. 

The same idea applies for this challenge. From the source code of the challenge,

```python
def search_trusted(self, Q):
    for host, cert in self.trusted_certs.items():
        if Q == cert['public_key']:
            return True, host
    return False, None

def sign_point(self, g, d):
    return g * d

def connection_host(self, packet):
    d = packet['private_key']
    if abs(d) == 1:
        return "Private key is insecure, certificate rejected."
    packet_host = packet['host']
    curve = packet['curve']
    g = Point(*packet['generator'])
    Q = self.sign_point(g, d)
    cached, host = self.search_trusted(Q)
    if cached:
        return host
    else:
        self.trusted_certs[packet_host] = {
            "public_key": Q,
            "curve": "secp256r1",
            "generator": G
        }
        return "Site added to trusted connections"
... 
def challenge(self, your_input):
    host = self.connection_host(your_input)
    if host == "www.bing.com":
        return self.bing_it(FLAG)
    else:
        return self.bing_it(host)
```

The server does not check all parameters of the certificate correctly. In fact, it does not check the generating point used to generate the `public` points. Hence, we can send our own generator `G'` and `d'` so it passes the check in `search_trusted`, or in other words, the points signed has the same value as the value of `www.bing.com` stored in `self.trusted_certs`. 

There are multiple approaches to this. We can look up the specifications of [secp256r1](https://neuromancer.sk/std/secg/secp256r1) and get the same curve as the one used in the challenge. My idea is to use the `public_key` as the generator and find the appropriate private key `d'` such that `d * public_key = public_key`. Denote the order of the curve as O, we have `d = O + 1`. Denote the actual private key used to generate `public_key` with the original generator as `n` and `public_key` as p. This above works because

$$
p = nG
$$

$$
(O + 1) p = n(O + 1)G 
$$

As $O$ is the order of the group, we have $(O + 1)G = G$, hence 

$$
(O + 1) p = nG = p
$$

Hence, the signed point will have the same coordinates as the "new" generator used `public_key`. Send the correct parameters to the server and we should be able to retrieve the flag. 

Sage Implementation: 
```python
# secp256r1 parameters
p = 0xffffffff00000001000000000000000000000000ffffffffffffffffffffffff
a = 0xffffffff00000001000000000000000000000000fffffffffffffffffffffffc
b = 0x5ac635d8aa3a93e7b3ebbd55769886bc651d06b0cc53b0f63bce3c3e27d2604b
F = GF(p)
E = EllipticCurve(F, [a, b])

# Public key of www.bing.com
public = E(0x3B827FF5E8EA151E6E51F8D0ABF08D90F571914A595891F9998A5BD49DFA3531, 0xAB61705C502CA0F7AA127DEC096B2BBDC9BD3B4281808B3740C320810888592A)

# Order of the group a
# a = 115792089210356248762697446949407573529996955224135760342422259061068512044369
a = E.order()
print(public * (a + 1) == public)
```
Another solution, from `Robin_Jadoul` on Cryptohack is the same idea but slightly different. Instead of supplying the target public key as the generator, he supplied a multiple `x` of the public key. Then the private key is the modular inverse of `x` with the modulo as the order of the group. From the above notation, the private key $d$ is derived by $$d = inv(x, O)$$. The math to show that this indeed works is the same as the above.