# CTRIME 

The `encrypt` function appends the flag to the plaintext provided by the user. However, the concatenated string is passed to `zlib` for compression before encrypting. There are no evident weakness in the use of AES-CTR, hence this challenge has to do with some properties of `zlib`. 

Indeed, after fuzzing for a while, it seems like `zlib` was eliminating duplicate strings - hence a correct guess of a portion of the flag will result in a shorter resulting plaintext compared to the resulting ciphertext from a incorrect guess. In other words, the correct guess will lead to the shortest resulting ciphertext.

Python fuzzing code: 

```python
import zlib 

plaintext = b'crypto{CRI'
flag = b'crypto{CRIM3_1s_r34lly_b4d}'

total = plaintext + flag 

a = zlib.compress(total)
print(len(a))
```

The most reliable way to solve this is to repeat the guessing text a lot of times, so that the impact on the length of the compression done by `zlib` is more noticable. Apparently some solutions uses multithreading using `Pool` from `multiprocessing`.

I was not repeating my guess in the answer script, so the script only guesses `crypto{CRIM` before not being able to continue further, as the length of the ciphertext for some reason is always 35. Hence, I had to guess the next character, `E`, for the script to continue running and output the flag of the challenge.

The below is the script from `codecrafting` on Cryptohack, which demonstrates why repeating the guess `solution + invalid_char` two times is crucial to solve this challenge. You can remove the multiplier `*2` and observe the resulting guesses.

Python Implementation: 

```python
import requests, sys

solution = "crypto{"
chars = 'ABCDEFGHIJKLMNOPQRTSUVWXYZ0123456789_abcdefghijklmnopqrstuvwxyz}'
invalid_char = ';'

while True:
    p = (solution + invalid_char) * 2
    r = requests.get("https://aes.cryptohack.org/ctrime/encrypt/" + p.encode('ascii').hex()).json()
    sample = len(r['ciphertext'])
    for c in chars:
        r = requests.get("https://aes.cryptohack.org/ctrime/encrypt/" + ((solution + c) * 2).encode('ascii').hex()).json()
        if len(r['ciphertext']) < sample:
            solution += c
            print(solution)
            if c == "}":
                print("Solution Found!", solution)
                sys.exit()
            break
```
