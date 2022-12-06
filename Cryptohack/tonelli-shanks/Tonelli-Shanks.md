# Tonelli-Shanks

Implementation of the algorithm is in Sagemath: 

```python
# Finding quadratic residue of a mod p
from sage.rings.finite_rings.integer_mod import square_root_mod_prime

a = <some a>
p = <some p>

print(square_root_mod_prime(Mod(a, p), p))
```