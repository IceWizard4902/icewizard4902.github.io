# Backpack Cryptography

Again, I do not know how to solve this problem. Leave it to the future me to digest how to solve lattice problems and understand a bit more about group theory. 

The original attack is from [Shamir et al.](http://igm.univ-mlv.fr/~jyt/Crypto/crack_merkle_hellman.pdf), but a low-density attack that leverages the LLL algorithm. A version is mentioned in [this awesome paper](https://eprint.iacr.org/2009/537.pdf).

Sage Implementation:

```python
a = [
    #public key
]

s = #ciphertext

n = len(a)
N = ceil(sqrt(n) / 2)

b = []
for i in range(n):
    vec = [0 for _ in range(n + 1)]
    vec[i] = 1
    vec[-1] = N * a[i]
    b.append(vec)

b.append([1 / 2 for _ in range(n)] + [N * s])

BB = matrix(QQ, b)
l_sol = BB.LLL()
for e in l_sol:
    if e[-1] == 0:
        msg = 0
        isValidMsg = True
        for i in range(len(e) - 1):
            ei = 1 - (e[i] + (1 / 2))
            if ei != 1 and ei != 0:
                isValidMsg = False
                break

            msg |= int(ei) << i

        if isValidMsg:
            print('[*] Got flag:', long_to_bytes(msg))
            break
```