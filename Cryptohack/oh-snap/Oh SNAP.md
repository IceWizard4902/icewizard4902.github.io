# Oh SNAP

The given link shows us an instance of `ARC4`, or the stream cipher version of the encryption scheme `RC4`. I do know beforehand that `RC4` is deprecated because of some vulnerabilities, and there are no other apparent weakness to the way that the plaintext is generated from the ciphertext and `iv`. Also note that, as this is a symmetric stream cipher, encryption and decryption is the same `xor` operation on the keystream generated. 

Searching on Google for `SNAP RC4` takes us to the [Fluhrer, Mantin and Shamir attack](https://en.wikipedia.org/wiki/Fluhrer,_Mantin_and_Shamir_attack), which is taking advantage of the invariance in the Key Scheduling Algorithm to reconstruct the key from the eavesdropping encrypted messages. This enables attacks on the `WEP`, the security algorithm for `802.11` wireless networks. The `SNAP` refers to the fact that the first byte of the `WEP SNAP` header is known, an attacker can derive the first byte of the keystream. The paper which covers the mathematical details can be found at this [link](https://www.mattblaze.org/papers/others/rc4_ksaproc.pdf).

Again, same as other solution on Cryptohack, I borrow the script from [FMS-Attack](https://github.com/jackieden26/FMS-Attack) on Github. As the full output of the decrypted plaintext (or effectively ciphertext), we can specify the plaintext as the null byte to get the key stream without the `xor` operation. The form of the `IV` is `A + 3, 255, X`, where `A` is the number of bytes in the secret key that we know (initially `A = 0`), and `X` is some random value in the range from `0` to `255`. 

To somewhat understand the script, I don't think there is any way other than reading the paper and pondering for a bit on how it works. There are some terms that may confuse you (`word` in the paper is `byte` in my script). Also the script is not using encoded strings, so I have to modify it a bit. Other than this, there are a few things that needs to be tweaked as well, but should be easy if you understand the idea of the attack. I would suggest testing the `RC4` code with `pycryptodome ARC4` before trying to implement the FMS attack - in case there is some implementation difference.

Python Implementation:

```python

from Crypto.Cipher import ARC4 
import requests 
import json 

def swapValueByIndex(box, i, j):
    temp = box[i]
    box[i] = box[j]
    box[j] = temp

# Initialize S-box.
def initSBox(box):
    if len(box) == 0:
        for i in range(256):
            box.append(i)
    else:
        for i in range(256):
            box[i] = i

def ksa(key, box):
    j = 0
    for i in range(256):
        j = (j + box[i] + key[i % len(key)]) % 256
        swapValueByIndex(box, i, j)

def prga(plain, box, keyStream, output):
    i = 0
    j = 0
    # Loop through every byte in plain text.
    for i in range(len(plain)):
        i = (i + 1) % 256
        j = (j + box[i]) % 256
        swapValueByIndex(box, i, j)
        keyStreamByte = box[(box[i] + box[j]) % 256]
        outputByte = plain[i - 1] ^ keyStreamByte
        keyStream += bytes([keyStreamByte])
        output += bytes([outputByte])
    return (keyStream, output)

box = []

# for A in range(keylength):
ciphertext = b'\x00'.hex()

A = 0

key = [None] * 3
# key = [36, 255, 255, 99, 114, 121, 112, 116, 111, 123, 119, 49, 82, 51, 100, 95, 101, 113, 117, 49, 118, 52, 108, 51, 110, 116, 95, 112, 114, 49, 118, 52, 99, 121, 63, 33, 125]

# Very slow, around 1-2 hrs for the flag. Do something else or improve this by using some parallel programming!
for A in range(35):
    prob = [0] * 256
    for k in range(256):
        iv = bytes([A + 3]) + bytes([255]) + bytes([k])
        iv = iv.hex()
        r = requests.get('https://aes.cryptohack.org/oh_snap/send_cmd/' + ciphertext + "/" + iv)
        key_stream = int.from_bytes(bytes.fromhex(json.loads(r.text)['error'].split(': ')[1]), byteorder='big')
        
        j = 0
        initSBox(box)
        key[0] = A + 3
        key[1] = 255
        key[2] = k

        for i in range(A + 3):
            j = (j + box[i] + key[i]) % 256
            swapValueByIndex(box, i, j)
            # Record the original box[0] and box[1] value.
            if i == 1:
                original0 = box[0]
                original1 = box[1]
        
        i = A + 3
        z = box[1]
        # if resolved condition is possibly met.
        if z + box[z] == A + 3:
            # If the value of box[0] and box[1] has changed, discard this possibility.
            if (original0 != box[0] or original1 != box[1]):
                continue
            keyByte = (key_stream - j - box[i]) % 256
            prob[keyByte] += 1
        # Assume that the most hit is the correct password.
        higherPossibility = prob.index(max(prob))
    key.append(higherPossibility)
    print(key)

print(bytes(key[3:]))
```

There are also ways to improve the performance of the script. Credit to `ciphr` on Cryptohack for this multithreaded solution.

```python
def get(a, c):
    b = 255
    nonce = bytes([a,b,c]).hex()
    ciphertext = "00"

    ret = requests.get(f"http://aes.cryptohack.org/oh_snap/send_cmd/{ciphertext}/{nonce}/").json()

    cmd = (ret["error"]).split(":")[1].strip()
    return [a,b,c,int(cmd, 16)]


logger = log.progress("🏴")    
flag = ""
A = 0
p = Pool(50)
while "}" not in flag:
    # harvest data for the flag byte
    a = A+3
    data = p.map(partial(get, a), range(255))
    for d in data:
        rows.append(d)

    ..
    .. (from the script)
    ..

    flag = "".join([chr(x) for x in key[3:]])
    logger.status(flag)

    A += 1 # next flag byte
```