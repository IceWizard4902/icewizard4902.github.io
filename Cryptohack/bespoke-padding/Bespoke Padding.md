# Bespoke Padding

This is a example of Franklin-Reiter attack on RSA. We can obtain two ciphertexts that correspond to the same plaintext encrypted with the same modulus, but padded differently. Denote the plaintext as $m$, the modulus $N$, the public exponent $e$, the ciphertexts $c_1$ and $c_2$, and the padding variables be $a_1, a_2, b_1, b_2$. We thus have the two polynomials with the common root of $m$: 

$$
p_1(x) = (a_1 x + b_1) ^ e - c_1 \mod N 
$$

$$
p_2(x) = (a_2 x + b_2) ^ e - c_2 \mod N 
$$

Hence, if both polynomials have the root $m$, then they are both divisible by $(x - m)$. This means we can compute the greatest common divisor of polynomials of $p_1$ and $p_2$. The resulting polynomial's constant term (polynomial should be of the form $x - c$) is thus our message. 

```python
import socket
import json
from Crypto.Util.number import long_to_bytes

e = 11

ct = []
pads = []
N = None
with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
    s.connect(("socket.cryptohack.org", 13386))
    s.recv(1024)
    for i in range(2):
        s.sendall(b'{"option":"get_flag"}')
        # the response may be longer than one packet, so make sure we get all of it
        data = b""
        while not data.endswith(b'\n'):
            data += s.recv(1024)
        data = json.loads(data)
        ct.append(data['encrypted_flag'])
        pads.append(data['padding'])
        N = data['modulus']

def gcd(a,b):
    # custom GCD implementation because Sage's one apparently doesn't work here
    while b:
        a, b = b, a % b
    return a.monic()

P.<x> = PolynomialRing(Zmod(N))
p1 = (pads[0][0] * x + pads[0][1]) ^ e - ct[0]
p2 = (pads[1][0] * x + pads[1][1]) ^ e - ct[1]
result = -gcd(p1, p2).coefficients()[0]
print(long_to_bytes(result))
```

Similar challenges that uses this idea can be found at this [link](https://jsur.in/posts/2020-05-13-sharkyctf-2020-writeups#noisy-rsa). Again, a repeat that this attack appears in the RSA attack survey, [Twenty Years of Attacks on the RSA cryptosystem](http://crypto.stanford.edu/~dabo/pubs/papers/RSA-survey.pdf). 

Takeaway from the challenge is if we can obtain a bunch of linearly related messages under the same modulo, then Franklin-Reiter attack can be carried out.