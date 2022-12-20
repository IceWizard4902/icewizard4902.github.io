# ECB Oracle

This takes much longer time than I would  like to admit. It is known to me that ECB leads to poor diffusion of the plaintext - the classic example from the Linux penguin used in almost every cryptography book ever. 

The attack, however, is not exactly clear to me at the beginning. With fuzzy memory of how AES in ECB mode, I was thinking of a scheme that `xor` a plaintext block with a key block to generate the corresponding ciphertext block. We can immediately leak the value of the key by using a input block of all `0`s. However, this is simply not true, as checking out the specification of ECB should easily disprove this model. 

Therefore, we need a more sophisticated attack. [Zach Grace](https://zachgrace.com/posts/attacking-ecb/) provides a great article on the idea of the CPA attack on AES-ECB. The idea is similar to the Padding Oracle attack: we guess character by character of the flag. In a very informal and confusing way, the attack involves 2 step: first, create a hole for the next character of the ciphertext to slide in the block where we have knowledge of; second, we fill in the guess that we have then compare with the result in step 1.

Implementation is not trivial, as I had quite a few bugs in the Python implementation. `sleep` is in case the Cryptohack API somehow does some rate limiting. A lot of improvements can be made to the script, such as further trimming the guess space of each character, giving portion of the flag that we already know `crypto{`, and putting the most common characters first.

```python
import requests 
import time 

guess = '=' * 32
guess = guess.encode().hex()

def encrypt_oracle(guess):
    r = requests.get("http://aes.cryptohack.org/ecb_oracle/encrypt/" + guess.encode().hex())
    return r.text.split(":")[1][1:-3]

flag = ""
for i in range(32):
    target = "=" * (31 - len(flag))
    target_c = bytes.fromhex(encrypt_oracle(target))
      
    for j in range(33, 127):
        temp = target + flag + chr(j)
        temp_c = bytes.fromhex(encrypt_oracle(temp))
        
        if target_c[:32] == temp_c[:32]:
            flag += chr(j)
            print(flag)
            break 
    time.sleep(0.1)
```