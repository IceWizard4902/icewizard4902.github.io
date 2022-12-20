# Broken RSA 

We need to recover the plaintext from the incorrectly generated RSA parameters, in this case, `e = 16` and the modulo `n` is a prime. As the public exponent and the totient of `n` is not coprime, this implies 

The first, and intended solution is to take advantage of the fact that `e = 2 ^ 4`, hence we only need to calculate the square root of the plaintext in the finite field four times.

Kudos to `Robin_Jadoul` on Cryptohack for this solution.

```python
n = ...
e = 16
ct = ...
def go(e, x):
    if e <= 1:
        if b"crypto" in long_to_bytes(x):
            return long_to_bytes(x)
        return None
    if x ^ ((n - 1) // 2) != 1:
        return
    r1 = x.square_root()
    r2 = -r1
    if res := go(e // 2, r1):
        return res
    return go(e // 2, r2)

print(go(e, GF(n)(ct)))
```

Another solution takes advantage of the fact that the modulo is a prime. With `m` being the plaintext message, we can see it is a root of the polynomial `X^e - ct` over `Z/nZ[X]`. As `n` is prime, calculating the square root multiple times when the modulus is a prime is quick. `nth_root` is insanely slow in comparison, as the underlying method is not optimised for non coprime power.

Kudos to `AZ` on Cryptohack for this solution.

```python
n = ...
e = 16
ct = ...
Z.<X> = GF(n)[]
P = X^e - ct
for r, _ in P.roots():
    h = hex(r)[2:]
    if b'crypto'.hex() in h:
        print(bytes.fromhex(h))
```

Lastly, the God solution. Don't know how it works, root of unity is that strong I guess. I think I will leave this to the future me to figure out! This works for composite `n`, as seen in this [writeup](https://hackmd.io/@65XZ9ZfDTb21FI-0un6Zhg/BJj1FqYUK).

```python
import Crypto.Util.number as cun
from pprint import pprint


def roots_of_unity(e, phi, n, rounds=250):
    # Divide common factors of `phi` and `e` until they're coprime.
    phi_coprime = phi
    while gcd(phi_coprime, e) != 1:
        phi_coprime //= gcd(phi_coprime, e)

    # Don't know how many roots of unity there are, so just try and collect a bunch
    roots = set(pow(i, phi_coprime, n) for i in range(1, rounds))

    assert all(pow(root, e, n) == 1 for root in roots)
    return roots, phi_coprime


n = ...
e = 16
ct = ...

# n is prime
# Problem: e and phi are not coprime - d does not exist
phi = n - 1

# Find e'th roots of unity modulo n
roots, phi_coprime = roots_of_unity(e, phi, n)

# Use our `phi_coprime` to get one possible plaintext
d = inverse_mod(e, phi_coprime)
pt = pow(ct, d, n)
assert pow(pt, e, n) == ct

# Use the roots of unity to get all other possible plaintexts
pts = [(pt * root) % n for root in roots]
pts = [cun.long_to_bytes(pt) for pt in pts]
pprint(pts)
```

This runs very quick. The following is the way that the algorithm works.

As we cannot find a unique `m`, we can instead find `x` satisfying

$$
(mx)^e \equiv c \mod n
$$

$$
x ^ e \equiv 1 \mod n 
$$

$x$ in this case is called [a root of unity modulo n](https://en.wikipedia.org/wiki/Root_of_unity_modulo_n) which can be computed fairly easily. The algorithm for calculating this is in the `roots_of_unity` method in the Python script. 

Denote $g = gcd(e, \phi(n))$, hence we have $e = kg$ and $\phi(n) = lg$ for some integers $k$ and $l$. `phi_coprime` is $l$ (as we are dividing $\phi(n)$ by $gcd(e, \phi(n))$). The returned solution is within some number of rounds, as there can be collisions of the solutions, in mathematical terms, there exists some $a, b$ where $a \neq b$ such that:

$$
a ^ l = b ^ l \mod n 
$$

Indeed, if the elements $a$ are of order divides `phi_coprime`, or $l$, then $a ^ l = 1$ (Lagrange's theorem).

The set of the solutions indeed satisfy the `assert` line because

$$
root ^ e = (i ^ l) ^ e = i ^ {le} = i ^ {lkg} = i ^ {k\phi(n)} = (i ^ \phi(n)) ^ k = 1 ^ k = 1 \mod n
$$

`d = inverse_mod(e, phi_coprime)`, or $ed = 1 + zl$ for some $z$.

Denote the original plaintext as $m$ and the corresponding ciphertext `ct` as $c$, and the possible plaintext obtained from `pt = pow(ct, d, n)` as M.

$$
M = c ^ d = (m ^ e) ^ d = m ^ {ed} = m ^ {1 + zl} \mod n
$$

For the `assert` line, we have: 
$$
M ^ e = (m ^ {1 + zl}) ^ e = m ^ {e + zle} = m ^ e m ^ {zle} = m ^ e m ^ {z\phi(n)k} = m ^ e = c \mod n
$$

Hence $M$ is one of the possible plaintext. Combining this with the root of unity, we should have a set of possible plaintexts. Finding one with indications of the flag should give us the solution.