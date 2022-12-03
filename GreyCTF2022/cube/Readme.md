# Cube

I managed to solve this after the CTF has ended. I decided to put it here since the team did spend quite a bit of time in this challenge without any progress. The challenge is solved using Fermat's little theorem, or more precisely this equality

$$
n^{3^{2^{100}}} \mod p = n^{(3^{2^{100}} \mod (p-1))} \mod p
$$

Plugging this, we should be able to retrieve the prime `p`, hence the flag.