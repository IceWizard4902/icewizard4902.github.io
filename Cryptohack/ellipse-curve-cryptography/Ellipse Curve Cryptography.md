# Ellipse Curve Cryptography

I did not know the way to solve the challenge after some naive idea of using Pohlig-Hellman on the smooth prime given. Nonetheless, it was a good try as after peeking at the solution, there is no shot that I can solve this without knowing some group theory of have acute observation of the number patterns. 

The first way to solve this, and one can look up in [this paper](https://web.archive.org/web/20210506165729/https://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.66.8688&rep=rep1&type=pdf), about `Genus 0 Curves`. We are basically given a conic, or a hyperbola whose equation looks like: 

$$
x ^ 2 - dy^2 = 1
$$

over a prime finite field. Using some math on group theory (can read from the paper or read the excellent writeup from `aloof`), there exists a group isomorphism between the hyperbola $\mathcal H$ and $F_p$ (under multiplication):

$$
\varphi: \mathcal H \rightarrow F_p
$$

$$
(x, y) \rightarrow u = x - \sqrt{d}y
$$

This only works (the mapping is well defined) if $d$ is a square root. Hence with this knowledge, to solve the challenge, we need to map the point $G$ and $A$ given to the finite group under multiplication $F_p$

$$
g = \varphi(G)
$$

$$
h = \varphi(A)
$$

and the remaining task is to calculate the discrete log of $h$ in base $g$, and then we have the value of `n_a`. We have this relation:

$$
h = \varphi(A) = \varphi(n_a G) = \varphi(G) ^ {n_a} = g ^ {n_a}
$$

Sage Implementation:

```python
from Crypto.Cipher import AES
from Crypto.Util.Padding import unpad
from hashlib import sha1
from collections import namedtuple
Point = namedtuple("Point", "x y")

# reused code from the challenge
def point_addition(P, Q):
    Rx = (P.x*Q.x + D*P.y*Q.y) % p
    Ry = (P.x*Q.y + P.y*Q.x) % p
    return Point(Rx, Ry)

def scalar_multiplication(P, n):
    Q = Point(1, 0)
    while n > 0:
        if n % 2 == 1:
            Q = point_addition(Q, P)
        P = point_addition(P, P)
        n = n//2
    return Q

def gen_shared_secret(P, d):
    return scalar_multiplication(P, d).x

# parameters and public data
p = 173754216895752892448109692432341061254596347285717132408796456167143559
D = 529
Dsqrt = 23 # 23^2 = 529
G = Point(29394812077144852405795385333766317269085018265469771684226884125940148,
          94108086667844986046802106544375316173742538919949485639896613738390948)
A = Point(155781055760279718382374741001148850818103179141959728567110540865590463,
          73794785561346677848810778233901832813072697504335306937799336126503714)
B = Point(171226959585314864221294077932510094779925634276949970785138593200069419,
          54353971839516652938533335476115503436865545966356461292708042305317630)

# transfering the discrete log and solving it
# (note: p-1 is smooth so it's very fast to compute)
g = G.x - Dsqrt*G.y
h = A.x - Dsqrt*A.y
n_a = discrete_log(GF(p)(h), GF(p)(g))

# finally, we extract the flag
shared_secret = gen_shared_secret(B, n_a)
key = sha1(str(shared_secret).encode('ascii')).digest()[:16]
iv = bytes.fromhex('64bc75c8b38017e1397c46f85d4e332b')
encrypted_flag = bytes.fromhex('13e4d200708b786d8f7c3bd2dc5de0201f0d7879192e6603d7c5d6b963e1df2943e3ff75f7fda9c30a92171bbbc5acbf')
cipher = AES.new(key, AES.MODE_CBC, iv)
flag = unpad(cipher.decrypt(encrypted_flag), 16).decode()
print(f'FLAG: {flag}')
```

The second solution, which requires INSANE fuzzing to find some patterns, is to use the symbolic math functionality of Sage to hunt for some patterns. I did do this, but was not serious in my approach enough (and also I put `D` as a number - keep in mind not to do this next time). Kudos to `Nightshade999` on Cryptohack for this creative solution.

Again, we can represent the coordinates of scalar multiplication between $G$ and $i$ as polynomials in coordinates of $G$. The following Sage script does so: 

```python
p = 173754216895752892448109692432341061254596347285717132408796456167143559
x = GF(p)['D,x,y'].gens()
Px = x[1]
Py = x[2]
Qx = x[1]
Qy = x[2]
for j in range(1,11):
    for i in range(1, j):  
        Rx = (Px * Qx + x[0] * Py * Qy)
        Ry = (Px * Qy + Py * Qx)
        Qx = Rx
        Qy = Ry
    print("x", j, ":", Qx)
    print("y", j, ":", Qy)
    print("*"*200)
```

What the output look like is something very similar to some binomial expansion. We thus can try writing the polynomial in the binomial expansion form. We can notice that `x` is fairly well-behaved, it is just `y` that is causing us some issues. 

The form that is returned back for $y$, after some great observation, is hinting at the fact that we can do a multiply of `23` on `y`. We eventually arrive at the general formula for this problem, for $G \times n = P$ and $\sqrt{d} = D$

$$
P.x + D \times P.y = (G.x + D \times G.y)^n
$$

What is left is just calculating discrete log on $F_p$ again, and it should be easy given that $p$ is smooth.

Sage Implementation (kudos to `soon_haari`)

```python
from Crypto.Cipher import AES
from Crypto.Util.Padding import pad, unpad
from Crypto.Util.number import *
from hashlib import sha1
import random
from collections import namedtuple

Point = namedtuple("Point", "x y")

def point_addition(P, Q):
    Rx = (P.x*Q.x + D*P.y*Q.y) % p
    Ry = (P.x*Q.y + P.y*Q.x) % p
    return Point(Rx, Ry)


def scalar_multiplication(P, n):
    Q = Point(1, 0)
    while n > 0:
        if n % 2 == 1:
            Q = point_addition(Q, P)
        P = point_addition(P, P)
        n = n//2
    return Q


def gen_keypair():
    private = random.randint(1, p-1)
    public = scalar_multiplication(G, private)
    return (public, private)


def gen_shared_secret(P, d):
    return scalar_multiplication(P, d).x


def decrypt_flag(shared_secret: int, iv: bytes, ct: bytes):
    key = sha1(str(shared_secret).encode('ascii')).digest()[:16]

    cipher = AES.new(key, AES.MODE_CBC, iv)
    return unpad(cipher.decrypt(ct), 16)

p = 173754216895752892448109692432341061254596347285717132408796456167143559
D = 529
G = Point(29394812077144852405795385333766317269085018265469771684226884125940148, 94108086667844986046802106544375316173742538919949485639896613738390948)
A = Point(155781055760279718382374741001148850818103179141959728567110540865590463, 73794785561346677848810778233901832813072697504335306937799336126503714)
B = Point(171226959585314864221294077932510094779925634276949970785138593200069419, 54353971839516652938533335476115503436865545966356461292708042305317630)
data = {'iv': '64bc75c8b38017e1397c46f85d4e332b', 'encrypted_flag': '13e4d200708b786d8f7c3bd2dc5de0201f0d7879192e6603d7c5d6b963e1df2943e3ff75f7fda9c30a92171bbbc5acbf'}

sqrt_D = 23

F = IntegerModRing(p)
base = F(G.x + sqrt_D * G.y)
num = F(A.x + sqrt_D * A.y)
n = num.log(base)

assert scalar_multiplication(G, n) == A

shared_secret = gen_shared_secret(B, n)

print(decrypt_flag(shared_secret, bytes.fromhex(data["iv"]), bytes.fromhex(data["encrypted_flag"])))
```
