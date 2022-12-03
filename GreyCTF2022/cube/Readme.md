# Cube
> Author: Nguyen Quang Vinh

We managed to solve this after the CTF has ended. I decided to put it here since the team did spend quite a bit of time in this challenge without any progress. The challenge is solved using Fermat's little theorem, or more precisely this equality

```
n^(3^(2^100)) % p = n^(3^(2^100) % (p-1)) % p
```

Plugging this, we should be able to retrieve the prime `p`, hence the flag.