# Everything Is Big 

RSA, except we are given a huge public exponent `e` that has the same number of bits as the modulus `N`. We can attack this using Wiener's Attack. The condition for Wiener's attack is 

$$
d \le \frac{1}{3} \sqrt[^4]{N}.
$$

We can refer to the way that the attack works in the [Cryptohack Book](https://cryptohack.gitbook.io/cryptobook/untitled/low-private-component-attacks/wieners-attack). 

Sage Implementation:

```python
from Crypto.Util.number import long_to_bytes

def wiener(e, n):
    # Convert e/n into a continued fraction
    cf = continued_fraction(e/n)
    convergents = cf.convergents()
    for kd in convergents:
        k = kd.numerator()
        d = kd.denominator()
        
        # Check if k and d meet the requirements
        if k == 0 or d%2 == 0 or e*d % k != 1:
            continue
        
        phi = (e*d - 1)/k
        # Create the polynomial
        x = PolynomialRing(RationalField(), 'x').gen()
        f = x^2 - (n-phi+1)*x + n
        roots = f.roots()
        # Check if polynomial as two roots
        if len(roots) != 2:
            continue
        # Check if roots of the polynomial are p and q
        p,q = int(roots[0][0]), int(roots[1][0])
        if p*q == n:
            return d
    return None

N = ...
e = ...
c = ...

d = wiener(e,N)
print(d)
print(long_to_bytes(int(pow(c,d,N))))
```