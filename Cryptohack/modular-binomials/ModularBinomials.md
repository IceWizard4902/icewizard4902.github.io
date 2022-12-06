# Modular Binomials 

This problem is the problem I did not manage to solve in NUS Greyhats [GreyCTF2022](../../GreyCTF2022). Although I am pretty close to the solution, there is one trick that I missed that is crucial to this particular type of challenge. 

```python
N = p * q
c1 = (2 * p + 3 * q) ** e1 mod N
c2 = (5 * p + 7 * q) ** e2 mod N
```

We are given the above system of equations, and the goal is to solve for $$p$$ and $$q$$. For $$n > 0$$ and coefficients $$a, b$$, using Newton's binomial expansion, we have: 

$$
(ap + bq)^n \equiv (ap)^n + (bq)^n \mod N
$$

This result is derived from the fact that the expansion of $$(ap + bq)^n$$, except for the first and last element in the expansion (namely $$(ap)^n$$ and $$(bq)^n$$), every other element will have a factor of $$pq$$. 

The task is to solve this system of equations. The aim is to eliminate one of the variables, in this case I choose $$p$$. We can raise the first equation to the power of $$e_2$$ and the second equation to the power of $$e_1$$ 

$$
c_1^{e_2} \equiv ((2p + 3q)^{e_1})^{e_2} = (2p + 3q)^{e_1 \times e_2} \mod N
$$

$$
c_2^{e_1} \equiv ((5p + 7q)^{e_2})^{e_1} = (5p + 7q)^{e_1 \times e_2} \mod N
$$

From the above result from Newton's binomial expansion, the system of equations now become: 

$$
c_1^{e_2} \equiv (2p)^{e_1 \times e_2} + (3q)^{e_1 \times e_2} \mod N
$$
$$
c_2^{e_1} \equiv (5p)^{e_1 \times e_2} + (7q)^{e_1 \times e_2} \mod N
$$

We want to eliminate $$p$$, hence we can do: 

$$
5^{e_1 \times e_2} c_1^{e_2} \equiv 10^{e_1 \times e_2} p^{e_1 \times e_2} + 15^{e_1 \times e_2} q^{e_1 \times e_2}
$$

$$
2^{e_1 \times e_2} c_2^{e_1} \equiv 10^{{e_1}{e_2}} p^{e_1 \times e_2} + 14^{e_1 \times e_2} q^{e_1 \times e_2}
$$

Subtracting the two equations, we have 

$$
D = 5^{e_1 \times e_2} c_1^{e_2} - 2^{e_1 \times e_2} c_2^{e_1} \equiv 15^{e_1 \times e_2} q^{e_1 \times e_2} - 14^{e_1 \times e_2} q^{e_1 \times e_2}
$$

Clearly, $q^{{e_1}{e_2}}$ is divisible by $q$. Hence, as $N = pq$, we have $gcd(N, D) = q$.

From $q$, we can obtain $p$ by doing $N / q$. Python implementation of the solution: 

```python
N = <N given>
e1 = <e1 given>
e2 = <e2 given>
c1 = <c1 given>
c2 = <c2 given>

lhs1 = pow(c1, e2, N)
lhs2 = pow(c2, e1, N)

rhs_f1 = pow(5, e1 * e2, N)
rhs_f2 = pow(2, e1 * e2, N)

D = (lhs1 * rhs_f1 - lhs2 * rhs_f2) % N 
q = math.gcd(D, N)
p = N // q 

print(f'crypto{{{p}, {q}}}')
```