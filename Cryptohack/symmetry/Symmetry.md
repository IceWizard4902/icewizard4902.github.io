# Symmetry

An embarrassing challenge for me. The solution to this challenge is quite simple. The symmetry of the `xor` operation enables us to decrypt the message/plaintext $P$ from the $IV$ and ciphertext $C$. Denote the output after running block cipher encryption with key k $E_k$ to be $O$, then we have: 

$$
O = E_k(IV)
$$

$$
C = P \oplus O
$$

`xor` both sides of the above equation, we have: 

$$
C \oplus O = P \oplus O \oplus O
$$

Therefore:

$$
C \oplus O = P
$$

Hence, the simpler solution just involves sending the $IV$ and $C$ to the encryption oracle given. 

My approach is similar to ECB-Oracle, and much slower. I take advantage of the fact that we can indeed guess character by character the plaintext, as the plaintext is used in `xor`-ing the output $O$ to obtain the ciphertext $C$. Encryption is deterministic, so with the same $IV$, the output of the encryption using the same key is the same. Hence, a correct guess of the character of the plaintext in position `i` will lead to the corresponding position `i` in the resulting ciphertext to have the same value as the position `i` of the flag's ciphertext. This is similar to the guessing character-by-character technique seen in ECB CPA attack.

Python Implementation of the attack:
```python
from pwn import xor 
import requests 

ciphertext = "9608427a24c18a23003fbe62e6f60f171b8bb41ae480d97ff5476b008e8d04a452311e437f911c333a6343d4a489b3d182"
ciphertext = bytes.fromhex(ciphertext)

iv = ciphertext[:16]
payload = ciphertext[16:]

# flag = "crypto{0fb_15_5ymm37r1c4l_!!!11!}"
flag = ""
plaintext = flag.ljust(len(payload), "=")
target = payload

def encrypt(plaintext, iv): 
    r = requests.get("http://aes.cryptohack.org/symmetry/encrypt/" + plaintext.encode().hex() + "/" + iv.hex())
    return r.text.split(":")[1][1:-3]

for i in range(33):
    print(plaintext)
    for j in range(33, 127): 
        temp = plaintext 
        temp = temp[:i] + chr(j) + temp[i + 1:] 
        temp_c = bytes.fromhex(encrypt(temp, iv))
        print(temp)
        if target[:(i + 1)] == temp_c[:(i + 1)]:
            plaintext = temp 
            break 

print(plaintext)
```
