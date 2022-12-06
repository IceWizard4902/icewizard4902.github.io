# Legendre Symbol 

We are given the prime $$p$$ and the integers to find the quadratic residue in $$p$$. The exact values of the prime is given in this [link](https://cryptohack.org/static/challenges/output_479698cde19aaa05d9e9dfca460f5443.txt)

Using Legendre Symbol and Euler's criterion, a number $$a$$ can have three cases: 

$$
(\frac{a}{p}) \equiv a^{\frac{p - 1}{2}} \equiv 1 \text{ if } a \text{ is a quadratic residue and } a \not\equiv 0 \mod p
$$

$$ 
(\frac{a}{p}) \equiv a^{\frac{p - 1}{2}} \equiv -1 \text{ if } a \text{ is a quadratic non-residue } \mod p
$$

$$
(\frac{a}{p}) \equiv a^{\frac{p - 1}{2}} \equiv 0 \text{ if } a \equiv 0 \mod p
$$

But when the prime is of the form $$4k + 3$$, then using Euler's criterion, if a number $$a$$ indeed has a quadratic residue, then: 

$$ 
a^{\frac{p - 1}{2}} \equiv 1 \mod p 
$$

Multiply both sides by $$a$$:

$$
a^{\frac{p + 1}{2}} \equiv a \mod p 
$$

Denote the quadratic residue of $$a$$ to be $$r$$, by definition of quadratic residue:

$$ 
r^2 \equiv a \mod p 
$$

Combining the two equations above, we have:

$$ 
r ^ 2 \equiv a^{\frac{p + 1}{2}} \mod p
$$

Taking the square root of both sides:

$$ 
r \equiv a^{\frac{p + 1}{4}} \mod p
$$

Hence, the positive quadratic residue of $$r$$ is given by $$a^{\frac{p + 1}{4}} \mod p$$

Otherwise, for the general case, we can use algorithms like [Tonelli-Shanks](https://zerobone.net/blog/math/tonelli-shanks/) and [Cipolla's](https://en.wikipedia.org/wiki/Cipolla%27s_algorithm) algorithm.

With this, we can easily solve the challenge by appending the following code to `output.txt`: 
```python
print("Prime in form of 4k + 3:", p % 4 == 3)

for i in ints: 
    if pow(i, (p - 1) // 2, p) == 1:
        print(pow(i, (p + 1) // 4, p))
```