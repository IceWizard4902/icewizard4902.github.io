# Bean Counter 

Tricky challenge. The description is trying to throw me off from "My counter can go both upwards and downwards to throw off cryptanalysts", which is not the case. The given code for encryption given is trying to simulate AES-CTR mode by doing AES-ECB block-by-block with the given IV. 

However, in the code of `increment()`, the method for changing the IV, there is a very sneaky bug:

```python
def increment(self):
    if self.stup:
        self.newIV = hex(int(self.value, 16) + self.step)
    else:
        self.newIV = hex(int(self.value, 16) - self.stup)
    self.value = self.newIV[2:len(self.newIV)]
    return bytes.fromhex(self.value.zfill(32))
```

If the `else` branch is taken, the value of the `IV` is subtracted by `self.stup` (which is 0 due to the value of the boolean being `False`). Hence the value of `IV` in the `else` branch does not change. From the initialization of `StepUpCounter` in the code: 

```python
class StepUpCounter(object):
    def __init__(self, value=os.urandom(16), step_up=False):
        self.value = value.hex()
        self.step = 1
        self.stup = step_up
...
def encrypt():
    cipher = AES.new(KEY, AES.MODE_ECB)
    ctr = StepUpCounter()
```

We can see that `step_up`, or `self.stup` has the value of `False`. Hence, the encryption is using the same IV for every block - hence the keystream is only just a repeating sequence of 16 bytes.

Hence, to obtain the key, we need to know some 16 bytes block of the plaintext. Luckily, per the [PNG specifications](https://en.wikipedia.org/wiki/Portable_Network_Graphics), the first 16 bytes of a `PNG` image is `89 50 4E 47 0D 0A 1A 0A 00 00 00 0D 49 48 44 52` in hex. We can `xor` this known first plaintext block with the corresponding ciphertext block, to retrieve the `xor` key used. 

Python Implementation:

```python
from pwn import xor 
import requests 

known_plaintext = "89504E470D0A1A0A0000000D49484452"
known_plaintext = bytes.fromhex(known_plaintext)

r = requests.get("http://aes.cryptohack.org/bean_counter/encrypt/")
ciphertext = r.text.split(":")[1][1:-3]
ciphertext = bytes.fromhex(ciphertext)
key = xor(known_plaintext, ciphertext[:16])

img = xor(ciphertext, key)

flag = open("flag.png", 'wb')
flag.write(img)
```