# Unencryptable

Try my luck with factorizing `N` using `FactorDB`. It works for special challenge like this where the `N` is something kinda special, or we just get lucky that `FactorDB` has done the factorising work for us ;)

```python
from Crypto.Util.number import bytes_to_long, long_to_bytes

N = 89820998365358013473897522178239129504456795742012047145284663770709932773990122507570315308220128739656230032209252739482850153821841585443253284474483254217510876146854423759901130591536438014306597399390867386257374956301247066160070998068007088716177575177441106230294270738703222381930945708365089958721
c = 0x5233da71cc1dc1c5f21039f51eb51c80657e1af217d563aa25a8104a4e84a42379040ecdfdd5afa191156ccb40b6f188f4ad96c58922428c4c0bc17fd5384456853e139afde40c3f95988879629297f48d0efa6b335716a4c24bfee36f714d34a4e810a9689e93a0af8502528844ae578100b0188a2790518c695c095c9d677b
# From FactorDB
p = 8239835397208516111720362847949425401045672365829937602117480449316694558226622200110057535873802132963548914201468383545676262090246827792522994758916609
q = 10900824353334471830007307529937357926160386461967884446160315218630687793341471079170750548554707926611542019859296605188535413447791710067186432371970369

b = 0x7fe8cafec59886e9318830f33747cafd200588406e7c42741859e15994ab62410438991ab5d9fc94f386219e3c27d6ffc73754f791e7b2c565611f8fe5054dd132b8c4f3eadcf1180cd8f2a3cc756b06996f2d5b67c390adcba9d444697b13d12b2badfc3c7d5459df16a047ca25f4d18570cd6fa727aed46394576cfdb56b41
e = 0x10001
phi = (p - 1) * (q - 1)
d = pow(e, -1, phi)
print(long_to_bytes(pow(c, d, N)))
```

The intended solution relies on the observation about `RSA Fixed Point`, or messages $m$, for some given $e, n$ yields:

$$
m ^ e = m \mod N
$$

or, in other words, the polynomial:

$$
f(x) = x ^ e - x \mod N
$$

has a solution of $x = m$. We are given the RSA fixed point in the problem, and `e = 65537`. Factoring the polynomial of $x ^ {65537} - x$ should be trivial. As none of the factors of the polynomial is divisible by $n$, they must provide a factor of $n$ when we find the GCD with $n$. Kudos to `epistemologist` on Cryptohack for the following solution:

```python
from Crypto.Util.number import long_to_bytes

DATA = 0x372f0e88f6f7189da7c06ed49e87e0664b988ecbee583586dfd1c6af99bf20345ae7442012c6807b3493d8936f5b48e553f614754deb3da6230fa1e16a8d5953a94c886699fc2bf409556264d5dced76a1780a90fd22f3701fdbcb183ddab4046affdc4dc6379090f79f4cd50673b24d0b08458cdbe509d60a4ad88a7b4e2921
N = 0x7fe8cafec59886e9318830f33747cafd200588406e7c42741859e15994ab62410438991ab5d9fc94f386219e3c27d6ffc73754f791e7b2c565611f8fe5054dd132b8c4f3eadcf1180cd8f2a3cc756b06996f2d5b67c390adcba9d444697b13d12b2badfc3c7d5459df16a047ca25f4d18570cd6fa727aed46394576cfdb56b41
e = 0x10001
c = 0x5233da71cc1dc1c5f21039f51eb51c80657e1af217d563aa25a8104a4e84a42379040ecdfdd5afa191156ccb40b6f188f4ad96c58922428c4c0bc17fd5384456853e139afde40c3f95988879629297f48d0efa6b335716a4c24bfee36f714d34a4e810a9689e93a0af8502528844ae578100b0188a2790518c695c095c9d677b

# We have that DATA^e = DATA (n)
# i.e. DATA satisfies the polynomial p(x) = x^65537 - x

assert DATA^e % N == DATA

# Note that
# x^65537 - x = x (x - 1) (x + 1) (x^2 + 1) (x^4 + 1) (x^8 + 1) (x^16 + 1) (x^32 + 1) (x^64 + 1) (x^128 + 1) (x^256 + 1) (x^512 + 1) (x^1024 + 1) (x^2048 + 1) (x^4096 + 1) (x^8192 + 1) (x^16384 + 1) (x^32768 + 1)
# Loop through these factors

polys = [x, x-1] + [(x^(2^i)+1) for i in range(16)]
assert prod(polys) == x^65537 - x

for factor in polys:
    potential_factor = int(factor.polynomial(Zmod(N))(x=DATA))
    if gcd(potential_factor, N) != 1:
        p = gcd(potential_factor, N)
        q = N // p
        break

d = pow(e, -1, (p-1)*(q-1))
print(long_to_bytes(pow(c,d,N)))
```

This challenge is seemingly based on Shor's algorithm, the following solution from `SC4R` is left for the future me to digest what's going on. Too lazy to understand at the time of writing.

```python
# The challenge was based on shor's algorithm, albeit a slightly different implementation than the one on wikipedia

from Crypto.Util.number import *
import gmpy

n = 0x7fe8cafec59886e9318830f33747cafd200588406e7c42741859e15994ab62410438991ab5d9fc94f386219e3c27d6ffc73754f791e7b2c565611f8fe5054dd132b8c4f3eadcf1180cd8f2a3cc756b06996f2d5b67c390adcba9d444697b13d12b2badfc3c7d5459df16a047ca25f4d18570cd6fa727aed46394576cfdb56b41
e = 0x10001
c = 0x5233da71cc1dc1c5f21039f51eb51c80657e1af217d563aa25a8104a4e84a42379040ecdfdd5afa191156ccb40b6f188f4ad96c58922428c4c0bc17fd5384456853e139afde40c3f95988879629297f48d0efa6b335716a4c24bfee36f714d34a4e810a9689e93a0af8502528844ae578100b0188a2790518c695c095c9d677b

DATA = bytes.fromhex("372f0e88f6f7189da7c06ed49e87e0664b988ecbee583586dfd1c6af99bf20345ae7442012c6807b3493d8936f5b48e553f614754deb3da6230fa1e16a8d5953a94c886699fc2bf409556264d5dced76a1780a90fd22f3701fdbcb183ddab4046affdc4dc6379090f79f4cd50673b24d0b08458cdbe509d60a4ad88a7b4e2921")
b = bytes_to_long(DATA)

assert (pow(b, e, n) == b) # Given
# Hence, we can conclude that e-1 is the order of b with respect to n
# Therefore, e-1 is the output of the quantum part of shor's algorithm, with b as the chosen base
r = e-1

# r is even, so I tried to proceed with the next step of the classical part
p = gmpy.gcd(pow(b, r//2, n) - 1, n)
q = gmpy.gcd(pow(b, r//2, n) + 1, n)

# However, p and q turned out to be just 1 and n (trivial factors)
# Therefore, we must look for higher roots of 1 (This is the part that wikipedia skips over)
# https://pdfs.semanticscholar.org/eecc/d242c53ffb17c2756768d1e0ed7c8589f12a.pdf
# This paper mainly discusses odd orders but the same principles can be applied to even ones as well

# The following function bruteforces higher powers of unity until we have a non trivial root
def factor(_b,_r,_n):
    for i in range(2,1000):
        if _r%i == 0:
            t = pow(_b,_r//i,_n)
            if gmpy.gcd(t-1,_n) != 1 and gmpy.gcd(t-1,_n) != _n:
                print ("found p and q")
                p = gmpy.gcd(t-1,_n)
                q = _n//gmpy.gcd(t-1,_n)
                break
    return p,q

p, q = factor(b, e-1, n)
# Once we have p and q, the message can be easily decrypted
tot = (p-1)*(q-1)
d = inverse(e, tot)
flag = long_to_bytes(pow(c, d, n)).decode()

print(flag)
```