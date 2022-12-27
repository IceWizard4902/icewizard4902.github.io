# Paper Plane

The description is mentioning something about Infinite Garble Extension, which is used in Telegram (searching the name of the Python class, `aesige`), hence the name "Paper Plane" - Telegram's logo.

The only observation needed to solve this challenge is that, decryption on a single block can be done without including the entire ciphertext. We only need the first block of ciphertext, and the `m0` and `c0` corresponding to that block. The very first block will have `m0` and `c0` provided, and consequent blocks will use the previous plaintext block decrypted for `m0`, and its corresponding ciphertext block for `c0`. 

Otherwise, this is similar to a padding oracle attack. Only the message that "The message is received" will be returned, and other incorrectly padded messages will return an error. Hence, we can use the technique from [CBC Padding Oracle Attack](https://en.wikipedia.org/wiki/Padding_oracle_attack) - a classic in any Introduction to Cryptography course in university. 

Some implementations on Cryptohack do not work, and this is because of the fact that for the padding, `xor` the padding with the null byte `\x00` is a bad idea - you cannot retrieve any information about the padding with the null byte. You can verify this using a local test with the given code:

```python
from Crypto.Cipher import AES
from Crypto.Util.Padding import pad, unpad
import os

KEY = b'lmaolmaolmaolmao'
FLAG = b'crypto{this is a test flag}'

class AesIge:
    def __init__(self, key):
        self.cipher = AES.new(key, AES.MODE_ECB)

    def encrypt(self, data, m0=os.urandom(16), c0=os.urandom(16)):
        data = pad(data, 16, 'pkcs7')

        last_block_plaintext = m0
        last_block_ciphertext = c0
        result = b''
        for i in range(0, len(data), 16):
            block = data[i: i + 16]
            x = AesIge._xor_blocks(block, last_block_ciphertext)
            x = self.cipher.encrypt(x)
            x = AesIge._xor_blocks(x, last_block_plaintext)
            result += x

            last_block_plaintext = block
            last_block_ciphertext = x

        return result, m0, c0

    def decrypt(self, data, m0, c0):
        last_block_plaintext = m0
        last_block_ciphertext = c0
        result = b''

        for i in range(0, len(data), 16):
            block = data[i: i + 16]
            x = AesIge._xor_blocks(block, last_block_plaintext)
            x = self.cipher.decrypt(x)
            x = AesIge._xor_blocks(x, last_block_ciphertext)
            result += x

            last_block_ciphertext = block
            last_block_plaintext = x
        
        if AesIge._is_pkcs7_padded(result):
            print("Decryption result: ", result)
            return unpad(result, 16, 'pkcs7')
        else:
            return None

    def _is_pkcs7_padded(message):
        padding = message[-message[-1]:]
        return all(padding[i] == len(padding) for i in range(0, len(padding)))

    def _xor_blocks(a, b):
        return bytes([x ^ y for x, y in zip(a, b)])

A = AesIge(KEY)
ct, m0, c0 = A.encrypt(FLAG)
ct1 = ct[16:32]
c0 = ct[:16]

for i in range(256):
    add = c0[15] ^ i 
    guess = c0[:15] + bytes([add])
    decrypt = A.decrypt(ct1, FLAG[:16], guess)
    if decrypt:
        print("Value for byte: ", bytes([1 ^ i])) 
```

Two values for the padding will pop up, one is `\x01` and one is `\x05`. `\x05` is the proper padding here, and you should get the idea why `xor` null byte is a bad idea. This took me a lot of time to figure out, and I actually solve the challenge by guessing out the flag after getting the first block (a legit strategy). 

I have rectified the script after guessing out the flag, and identify the problem of using `\x00` for the guessing the first byte. Also in the solution a bunch of `b'\n'` will show up, as Python tries to convert the byte into some ASCII-friendly representation. 

Python Implementation:

```python
import json
import requests 
from pwn import xor 

r = requests.get('https://aes.cryptohack.org/paper_plane/encrypt_flag')
encrypted_flag = json.loads(r.text)

ct = bytes.fromhex(encrypted_flag['ciphertext'])
m0 = bytes.fromhex(encrypted_flag['m0'])
c0 = bytes.fromhex(encrypted_flag['c0'])

def padding_oracle(ct, m0, c0):
    pt = b''
    for i in range(1, 17):
        temp = c0[:(16 - i)]
        
        pad = b''
        
        for j in range(256):
            guess = bytes([c0[(16 - i)] ^ j])
            if len(pt) > 0:
                pad = bytes([i]) * (i - 1)
                c0_pad = temp + guess + xor(xor(pt, pad), c0[(17 - i):])
            else:
                c0_pad = temp + guess    
            
            r = requests.get(
                'https://aes.cryptohack.org/paper_plane/send_msg/' + ct.hex() + "/" + m0.hex() + "/" + c0_pad.hex())
            
            if 'Message received' in r.text:
                # Skip the null byte as this leads to wrong padding, can test on local instance
                # Does not affect any operation whatsoever
                if i == 1 and j == 0:
                    continue
                pt = bytes([i ^ j]) + pt
                print(pt)
                break
            # else:
            #     print(i, j)
    return pt


# There are two blocks in the ciphertext, hence there are two blocks in the plaintext
ct1 = ct[:16]
pt1 = padding_oracle(ct1, m0, c0)

ct2 = ct[16:]
# Don't be afraid of the \n printed out, it's b'\x0a'
pt2 = padding_oracle(ct2, pt1, ct1)

print(pt1 + pt2)
```