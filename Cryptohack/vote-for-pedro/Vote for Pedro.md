# Vote for Pedro

First, the modulus is big (2048 bits) and the public exponent `e` is small (3), hence we may use a small number and the arithmetic operation under the modulo N is the same as in $\mathcal Z$

Pedro is not exactly careful with the padding, indeed: 

```python
vote = int(your_input['vote'], 16)
verified_vote = long_to_bytes(pow(vote, ALICE_E, ALICE_N))

# remove padding
vote = verified_vote.split(b'\00')[-1]

if vote == b'VOTE FOR PEDRO':
    return {"flag": FLAG}
```

Anything in the `verified_vote` variable before the null byte is discarded, hence a message of the form `<SOME RANDOM STUFF>\x00VOTE FOR PEDRO` is still valid. The form of such message will be $x * 256 ^ {l + 1} + m$ where $x$ denotes the random text, $l$ is the length of the message `VOTE FOR PEDRO`, and $m$ is the previous message. The message must also be a perfect cube, so that we can obtain the message from `verified_vote`. 

Sage Implementation:

```python
from Crypto.Util.number import long_to_bytes, bytes_to_long

msg = b'VOTE FOR PEDRO'

x = var('x')
n = 256 ^ (len(msg) + 1)
f = x ^ 3 - bytes_to_long(msg)
print(solve_mod(f, n))

# Different solution
# As messages are of the form a * 2 ^ 120 + k
# k = bytes_to_long(b"VOTE FOR PEDRO")
# x = mod(k, 2^120).nth_root(3)
```
