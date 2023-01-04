# Micro Transmissions

Simple challenge, there are two key point to solve this. First, the order of the curve is [smooth](http://factordb.com/index.php?query=99061670249353652702595159229088680426160873357666659718134032418967620849171), and also the private keys are relatively small ($2 ^ {64}$). My approach is just simply relying on Sage magic to perform the heavy duty work.

Sage Implementation: 

```python
from Crypto.Cipher import AES
from Crypto.Util.Padding import pad, unpad
import hashlib

def gen_shared_secret(P, n):
	S = n * P
	return S.xy()[0]

p = 99061670249353652702595159229088680425828208953931838069069584252923270946291
a = 1 
b = 4 
E = EllipticCurve(GF(p), [a,b])

ax = 87360200456784002948566700858113190957688355783112995047798140117594305287669
bx = 6082896373499126624029343293750138460137531774473450341235217699497602895121

A = E.lift_x(ax)
B = E.lift_x(bx)
G = E(43190960452218023575787899214023014938926631792651638044680168600989609069200, 20971936269255296908588589778128791635639992476076894152303569022736123671173)

n_a = discrete_log(A, G, operation='+', bounds=(0, 2^64))
shared_secret = gen_shared_secret(B, n_a)

sha1 = hashlib.sha1()
sha1.update(str(shared_secret).encode('ascii'))
key = sha1.digest()[:16]
# Decrypt flag
iv = bytes.fromhex('ceb34a8c174d77136455971f08641cc5')
ct = bytes.fromhex('b503bf04df71cfbd3f464aec2083e9b79c825803a4d4a43697889ad29eb75453')

cipher = AES.new(key, AES.MODE_CBC, iv)
flag = unpad(cipher.decrypt(ct), 16)
print(flag)
```

The intended solution (but weirdly takes about the same time as the above approach), employs the fact that the private keys are so small, we can however enjoy the fact that we don't need to recover the discrete log in every subgroup to reconstruct it. We combine just enough subgroups to have the CRT modulus larger than the known upper bound, apply CRT, and in no time, we have our solution. 

Indeed, denote the order as $n = p * q$, and the secret multiplication factor be $d$. Suppose we have $p > d$, hence $d = x \mod p$ is equivalent to $d = x \mod n$. This is trivial but I just wanna write it out. The following is a slight modification to `Robin_Jadoul` script on Cryptohack, as his script does not work with a different $G$.

```python
max_val = 1 << 64
M = 99061670249353652702595159229088680425828208953931838069069584252923270946291
E = EllipticCurve(GF(M), [1,4]) 
G = E(43190960452218023575787899214023014938926631792651638044680168600989609069200, 20971936269255296908588589778128791635639992476076894152303569022736123671173)
A = E.lift_x(87360200456784002948566700858113190957688355783112995047798140117594305287669)
order = G.order()

subresults = []
factors = []
modulus = 1
for prime, exponent in factor(order):
    if modulus >= max_val: break
    _factor = prime ** exponent
    factors.append(_factor)
    G2 = G*(order//_factor)
    A2 = A*(order//_factor)
    subresults.append(discrete_log_lambda(A2, G2, bounds=(0,_factor), operation='+'))
    modulus *= _factor

n = crt(subresults,factors)
assert(n * G == A)
print("found private key:", n)
```