# Lemur Xor

Straightforward, and perhaps classic challenge. This takes advantage of the fact that both images are encrypted using the same `xor` key. We can leak information of the flag by `xor` the two ciphertext, or the two files given. 

There are different snippets of code which can do this, which weirdly is not available online. The following is to do `xor` on RGB values of pixel by pixel.

`daneallen` from Cryptohack: 

```python
from PIL import Image

lemur = Image.open("lemur.png")
flag = Image.open("flag.png")

pixels_lemur = lemur.load() # create the pixel map
pixels_flag = flag.load()

for i in range(lemur.size[0]): # for every pixel:
    for j in range(lemur.size[1]):
        # Gather each pixel
        l = pixels_lemur[i,j]
        f = pixels_flag[i,j]

        # XOR each part of the pixel tuple
        r = l[0] ^ f[0]
        g = l[1] ^ f[1]
        b = l[2] ^ f[2]

        # Store the resulatant tuple back into an image
        pixels_flag[i,j] = (r, g, b)

flag.save("lemur_xor_flag.png")
```

Shorter solution from `shoaloak`: 

```python
from PIL import Image
from pwn import *

lemur = Image.open("lemur.png")
flag = Image.open("flag.png")

leak_bytes = xor(lemur.tobytes(), flag.tobytes())
leak = Image.frombytes(flag.mode, flag.size, leak_bytes)

leak.save('leak.png')
```

Last solution using `numpy`, from `Hon`: 

```python
import numpy as np
from PIL import Image

img1 = Image.open("img1.png")
img2 = Image.open("img2.png")

img1np = np.array(img1) * 255
img2np = np.array(img2) * 255

res = np.bitwise_xor(img1np, img2np).astype(np.uint8)

Image.fromarray(res).save('result.png')
```