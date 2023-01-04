# Elliptic Nodes

`a` and `b` is not given, but since we are given the two points, generator `G` and the public key point `P`, we can construct two equations in the form of $y ^ 2 = x ^ 3 + ax + b$. Solving the two linear congruent equation should give us $a, b$.

Trying to do `E = EllipticCurve(GF(p), [a, b])` lead to an error by Sage that the curve defined is not a elliptic curve, rather a singular curve. A [singular curve](https://crypto.stackexchange.com/questions/70373/why-are-singular-elliptic-curves-bad-for-crypto) makes it very easy to solve DLP, as there exist a mapping to this curve to either a additive or multiplicative group. 

We follow [this tutorial](https://crypto.stackexchange.com/questions/61302/how-to-solve-this-ecdlp) on Crypto StackExchange. There are multiple ways to find the singular point, one such method is to find roots of the equation $3x^2 + a$ under modulo $p$, which should be easy to do.

The writeup by `aloof` after solving the challenge should provide a much better view into how singular curves work, and the math behind it.

Sage Implementation:

```python
from Crypto.Util.number import long_to_bytes
from collections import namedtuple

Point = namedtuple("Point", "x y")

p = 4368590184733545720227961182704359358435747188309319510520316493183539079703
gx = 8742397231329873984594235438374590234800923467289367269837473862487362482
gy = 225987949353410341392975247044711665782695329311463646299187580326445253608

px = 2582928974243465355371953056699793745022552378548418288211138499777818633265
py = 2421683573446497972507172385881793260176370025964652384676141384239699096612

# a*x + b = y ^ 2 - x ^ 3 = res
res1 = (gy ** 2 - gx ** 3) % p 
res2 = (py ** 2 - px ** 3) % p 

# a * (x - x') = res1 - res2
# a = (res1 - res2) * (x - x')^-1
a = ((res1 - res2) * pow((gx - px), -1, p)) % p 
b = (res1 - a * gx) % p 

# Calculate singular point (x, 0), 
# singular point is where both partial derivative dy/dx = dx/dy = 0/0
# dy / dx in this "curve" is (3x ^ 2 + a) / y, hence y = 0
# and the following is solving for x
shift_square = (-a * pow(3, -1, p)) % p 
R = IntegerModRing(p)
shift_square = R(shift_square)
shift = int(x_square.sqrt(all=True)[0])

# Follow Crypto StackExchange tutorial
P.<x> = GF(p)[]
f = x^3 + a*x + b
f_ = f.subs(x = x + s)

G = (gx, gy)
P = (px, py)
G_ = (G[0] - s, G[1])
P_ = (P[0] - s, P[1])

print(f_.factor())
t = GF(p)(305179796174210822247618473361747316085422620437271958999235012896334193460).square_root()
u = (G_[1] + t*G_[0]) / (G_[1] - t*G_[0]) % p
v = (P_[1] + t*P_[0]) / (P_[1] - t*P_[0]) % p
print(long_to_bytes(discrete_log(v, u)))
```