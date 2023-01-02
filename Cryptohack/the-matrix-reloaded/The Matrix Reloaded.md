# The Matrix Reloaded

Useful Sage documentation [link](https://doc.sagemath.org/html/en/reference/matrices/sage/matrix/matrix2.html) about the syntax for matrices.

We are given a somewhat similar to a Diffie-Hellman key-exchange, a secret $s$ is picked out, then $H = G * s$ is calculated. They also generate a random vector $v$ in the matrix space. The product of $H \times v = w$ is calculated. Given the two vectors $v, w$, we have to derive the value of the secret $s$ to obtain the decryption key.  

The solution was just under my nose. Seems like Googling for some plural version `discrete logarithm matrices` leads us to this [excellent resource](https://crypto.stackexchange.com/questions/3840/a-discrete-log-like-problem-with-matrices-given-ak-x-find-k) to solve this problem. 

I initially Google something like `discrete logarithm matrix ctf`, which leads to this [CTF Writeup](https://rkm0959.tistory.com/206), discussing how to solve $G ^ x = H$, with given matrices $A$ and $B$. The challenge name is `Neo-Classical Key Exchange`, detailing how we can use Jordan Canonical Form of the generator matrix $G$ to solve for $x$. 

Unfortunately, the above does not work as generally, there are infinitely many solutions for $H$ given $v, w$ (as one can only construct $n$ equations, while we need $n^2$ entries to reconstruct matrix $H$). Hence, this approach is discarded. 

The first link on [Crypto StackExchange](https://crypto.stackexchange.com/questions/3840/a-discrete-log-like-problem-with-matrices-given-ak-x-find-k) should shed light on how to solve the problem, so I don't want to go into the math again. The [Wikipedia link](https://en.wikipedia.org/wiki/Jordan_normal_form) shows the concepts of "blocks" in Jordan Canonical Form. With this established, let's dive into the analysis. 

We can first analyze the Jordan Normal form of the given generator matrix $G$. The mathematical form is $P J P^{-1}$. The formula for $H$, or $G ^ s$ will thus be $P J^{s} P^{-1}$. 

Hence, the given equation becomes: 

$$
P J^{s} P^{-1} v = w
$$

I did in this way: 

```python
g, p = G.jordan_form(transformation=True)
f = open('test.txt', 'w')
f.write(str(g))
```

There are also neater ways to display the matrix also, kudos to `hellman`:

```python
for row in G.jordan_form():
    print(*["0X"[bool(v)] for v in row])
```

The output will look something like this: 

```python
X 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
0 X 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
0 0 X 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
0 0 0 X 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
0 0 0 0 X 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 X 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 X 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 X 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 X 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 X 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0 X 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0 0 X 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0 0 0 X 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0 0 0 0 X 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0 0 0 0 0 X 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 X 0 0 0 0 0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 X 0 0 0 0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 X 0 0 0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 X 0 0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 X 0 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 X 0 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 X 0 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 X 0 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 X 0 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 X 0 0 0 0 0
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 X 0 0 0 0
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 X 0 0 0
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 X 0 0
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 X X
0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 X
```

where X represent some non-zero element. Hence, we can observe that the matrix "almost" diagonalizes. If it DOES diagonalize, then [solving DLP is hard](https://cstheory.stackexchange.com/questions/12655/discrete-log-in-gl2-p). Luckily, we can still consider the non-diagonalized block in the bottom right corner. 

$$
\begin{bmatrix}
\theta & 1\\
0 & \theta
\end{bmatrix}
$$

Call this mini-matrix $J'$, then $J' ^ k$ is given by:

$$
\begin{bmatrix}
\theta^k & 1\\
0 & \theta^k
\end{bmatrix}
$$

Following the [CryptoStackExchange link](https://crypto.stackexchange.com/questions/3840/a-discrete-log-like-problem-with-matrices-given-ak-x-find-k), we can manipulate the given equation a bit:

$$
P^{-1} P J^{s} P^{-1} v = P^{-1} w
$$

$$
J^{s} P^{-1} v = P^{-1} w
$$

Thus, denote $a = P^{-1} v = (x_1, x_2, ..., x_{n - 1}, x_{n})$ and $b = P^{-1} w = (y_1, y_2, ..., y_{n - 1}, y_{n})$, we can recover $s$ by doing:

$$
s = \theta (y_{n - 1} - x_{n - 1} \frac{y_{n}}{x_{n}}) / y_{n}
$$

We can easily verify the correctness of this formula, and again, the [first Crypto StackExchange link](https://crypto.stackexchange.com/questions/3840/a-discrete-log-like-problem-with-matrices-given-ak-x-find-k) should show why. Since the $2 \times 2$ matrix we are trying to do this is in the rightmost corner, hence only the terms of $x_{n - 1}, x_{n}$ and $y_{n - 1}, y_{n}$ are involved (this [link](https://mathinsight.org/matrix_vector_multiplication) should clarify if you do not understand what I am talking about). 

With these, we can obtain the secret $s$, and thus the flag.

Sage Implementation:

```python
from Crypto.Cipher import AES
from Crypto.Hash import SHA256
from Crypto.Util.number import *
from Crypto.Util.Padding import pad, unpad

import json


FLAG = b'crypto{?????????????????????????????????????}'

P = 13322168333598193507807385110954579994440518298037390249219367653433362879385570348589112466639563190026187881314341273227495066439490025867330585397455471
N = 30

# Not actually used, but useful for solving G ^ k = H
# May be used later
def solve_dlog(G, H):
    R = IntegerModRing(P)
    M = MatrixSpace(R, N, N)
    g = M(G)
    h = M(H)

    g, p_mat = g.jordan_form(transformation=True)

    h = p_mat.inverse() * h * p_mat

    a11 = g[N - 2][N - 2]
    b11 = h[N - 2][N - 2]
    b12 = h[N - 2][N - 1]

    return (a11 * b12 / b11)

def load_matrix(fname):
    data = open(fname, 'r').read().strip()
    rows = [list(map(int, row.split(' '))) for row in data.splitlines()]
    return Matrix(GF(P), rows)

G = load_matrix("generator.txt")
g, p = G.jordan_form(transformation=True)

f1 = open('output.txt', 'r')
dh = json.loads(f1.readline())
v = vector(GF(P), dh['v'])
w = vector(GF(P), dh['w'])

a = p.inverse() * v
b = p.inverse() * w 
theta = g[N - 2][N - 2]

# Solution to dlog
SECRET = theta * (b[N - 2] - (a[N - 2] * b[N - 1]) / a[N - 1]) / b[N - 1]
KEY_LENGTH = 128
KEY = SHA256.new(data=str(SECRET).encode()).digest()[:KEY_LENGTH]

ct = open('flag.enc', 'r')
enc_flag = json.loads(ct.readline())
iv = bytes.fromhex(enc_flag['iv'])
ciphertext = bytes.fromhex(enc_flag['ciphertext'])

cipher = AES.new(KEY, AES.MODE_CBC, iv)
print(unpad(cipher.decrypt(ciphertext), 16))
```