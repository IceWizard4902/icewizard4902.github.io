from Crypto.Util.number import long_to_bytes
from sage.matrix.matrix2 import Matrix 

def resultant(f1, f2, var):
    return Matrix.determinant(f1.sylvester_matrix(f2, var))

e = 0x10001

p = ...
f_ = ...
g_ = ...

P.<m1,m2> = PolynomialRing(GF(p))
f = (13 * m2 ** 2 + m1 * m2 + 5 * m1) - f_
g = (7 * m2 + m1 ** 2) - g_
h1 = resultant(f, g, m2)
m1_ = h1.univariate_polynomial().roots()[0][0]
h2 = resultant(f, g, m1)
m2_ = h2.univariate_polynomial().roots()[0][0]

d = pow(e, -1, p-1)
m1 = pow(m1_, int(d), p)
m2 = pow(m2_, int(d), p)

print(long_to_bytes(int(m1)).decode() + long_to_bytes(int(m2)).decode())