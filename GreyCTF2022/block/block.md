# Block 

This is essentially a reverse engineering challenge. We have to derive a way to unscramble the scrambling done by the encryption scheme. Encryption is done in rounds, hence let `m` be the original message, `c` is the ciphertext. The scrambling in one round is given by $$c = f(g(h(k(m))))$$, where `f, g, h, k` are the four functions used for scrambling. To derive the original message, we have to find the inverse of each function, that is to find `f', g', h', k'`. `m` can be derived by $$m = k'(h'(g'(f'(c))))$$.

The `sub`, `rotate`, `transpose` and `swap` function can either be trivially done (the case with `sub`) or we can use some dummy values from 0 to 15 and see what is their position after the scrambling. Reversing is simply done by looking at the end pattern and derive a way to order them back. For functions that include other functions, the operation is still the same, reverse every function down to the smallest unit of it, then do the bigger function in reverse.

Writing this is very tedious and does not hold much value, as most of the work is done simply by observing the pattern after applying the function and try to reverse it. I will instead condense the technique used for those 4 functions in the analysis of the 1st and 2nd function, `xor` and `add`.

To reverse `xor`, we first should inspect which element are `xor`-ed with which. We can do this very easily by creating a dummy matrix containing integers from 1 to 16. We then print out the pair of `i, j` with the position of the element it got `xor`-ed with.

```Python
test = [i for i in range(1, 17)]
mat = [[test[i * 4 + j] for j in range(4)] for i in range(4)]

for i in range(4):
    for j in range(4):
        print(mat[i][j], mat[(i + 2) % 4][(j + 1) % 4])
```
From the output, we can derive how the original matrix is transformed after this function. The easiest way to do this is to write down the changing of every element in the order of the original loop (since the element in some position is changed, and the changed value is used for some later operations). We will have this matrix, where the integers `1...16` represent the 1st to the 16th element in the flattened out `mat`, `^` is the `xor` symbol.
The original matrix M
```
1       2       3       4
5       6       7       8
9       10      11      12
13      14      15      16 
```
is transformed into
```
1^10        2^11        3^12        4^9
5^14        6^15        7^16        8^13
9^2^11      10^3^12     11^4^9      12^1^10     
13^6^15     14^7^16     15^8^13     16^5^14
```
Hence, to solve this, we `xor` the 9th (in the flattened matrix) with the 2nd (in the flattened matrix). The way to calculate the element to be `xor`-ed is the same as the formula used in the original function. We solve in the order of `2, 3, 0, 1` row (0-indexed) in the matrix. 

For the `add` function, again, we can retrieve the element that correspond to a position `i, j` in the matrix by doing the same thing as the operation above. 
The `&0xFF` operation is a modulo operation. It takes the value of every entry modulo `256`.

Hence, the original matrix M is transformed into this matrix (mod 256)

```
1 + 1 * 2               2 + 2 * 2               3 + 3 * 2                   4 + 4 * 2
5 + 14 * 2              6 + 15 * 2              7 + 16 * 2                  8 + 13 * 2
9 + 11 * 2              10 + 12 * 2             11 + (9 + 11 * 2) * 2       12 + (10 + 12 * 2) * 2
13 + (8 + 13 * 2) * 2   14 + (5 + 14 * 2) * 2   15 + (6 + 15 * 2) * 2       16 + (7 + 16 * 2) * 2
```
We know that the value in the matrix before the modulo is in the range of 0 to 255, which is indeed the range of value after doing the modulo `256` operation. Hence to retrieve the original values in matrix M, we need to find the positive value which belongs in the general solution set of the congruence. 

For example, to retrieve the element at index 13 (in the flattened out matrix), we can do:

Note that the 8, 13 here refers to index in the flattened out original matrix, not the literal value 8 and 13!
$$
a = 13 + (8 + 13 \times 2) \times 2 \mod 256
\\
b = 8 + 13 \times 2 \mod 256
\\
\Rightarrow 2 \times b - a = 13 \mod 256
$$
Hence we can take the result of $$2 \times b - a$$ and find a positive value that is congruent to the value of $$2 \times b - a$$, and that should be the value for 13

The first row is special as its value got tripled. To retrieve the original value is basically solving the linear congruence $$3x = a \mod 256$$. We obviously do know the value of `a`, and $$0 < x < 256$$, hence it's very easy to derive the only solution to the congruence equation.

After we get the reversed (inversed) version of all the functions, the only work left is to apply those function in order and run for 30 rounds to retrieve the orginal message.

Solution Implementation: 

```python
from Crypto.Util.Padding import unpad
import random 

SUB_KEY = [
    0x11,0x79,0x76,0x8b,0xb8,0x40,0x02,0xec,0x52,0xb5,0x78,0x36,0xf7,0x19,0x55,0x62,
    0xaa,0x9a,0x34,0xbb,0xa4,0xfc,0x73,0x26,0x4b,0x21,0x60,0xd2,0x9e,0x10,0x67,0x2c,
    0x32,0x17,0x87,0x1d,0x7e,0x57,0xd1,0x48,0x3c,0x1b,0x3f,0x37,0x1c,0x93,0x16,0x24,
    0x13,0xe1,0x1f,0x91,0xb3,0x81,0x1e,0x3d,0x5b,0x6c,0xb9,0xf2,0x83,0x4c,0xd5,0x5a,
    0xd0,0xe7,0xca,0xed,0x29,0x90,0x6f,0x8f,0xe4,0x2f,0xab,0xbe,0xfe,0x07,0x71,0x6b,
    0x59,0xa3,0x8a,0x5e,0xd7,0x30,0x2a,0xa0,0xac,0xbd,0xd4,0x08,0x4f,0x06,0x31,0x72,
    0x0d,0x9f,0xad,0x0b,0x23,0x80,0xe6,0xda,0x75,0xa8,0x18,0xe2,0x04,0xeb,0x8e,0x15,
    0x64,0x00,0x2b,0x03,0xa1,0x5d,0xb4,0xb1,0xf0,0x97,0xe3,0xe8,0xb0,0x05,0x86,0x38,
    0x56,0xef,0xfa,0x43,0x94,0xcb,0xb6,0x69,0x5f,0xc7,0x27,0x7c,0x44,0x8d,0xf3,0xc8,
    0x99,0xc2,0xbc,0x82,0x65,0xdb,0xaf,0x51,0x20,0x7f,0xc3,0x53,0xf4,0x33,0x4d,0x50,
    0xee,0xc5,0x12,0x63,0x9b,0x7b,0x39,0x45,0xa9,0x2d,0x54,0xdc,0xdf,0xd6,0xfd,0xa7,
    0x5c,0x0c,0xe9,0xb2,0xa2,0xc1,0x49,0x77,0xae,0xea,0x58,0x6d,0xce,0x88,0xf8,0x96,
    0xde,0x1a,0x0f,0x89,0xd3,0x7a,0x46,0x22,0xc6,0xf9,0xd9,0x84,0x2e,0x6a,0xc9,0x95,
    0xa5,0xdd,0xe0,0x74,0x25,0xb7,0xfb,0xbf,0x9c,0x4a,0x92,0x0e,0x09,0x9d,0xf6,0x70,
    0x61,0x66,0xc0,0xcf,0x35,0x98,0xf5,0x68,0x8c,0xd8,0x01,0x3e,0xba,0x6e,0x41,0xf1,
    0xa6,0x85,0x3a,0x7d,0xff,0x0a,0x14,0xe5,0x47,0xcd,0x28,0x3b,0xcc,0x4e,0xc4,0x42
]

ciphertext = "1333087ba678a43ecc697247e2dde06e1d78cb20d8d9326e7c4b01674a46647674afc1e7edd930828e40af60b998b4500361e3a2a685c5515babe4e9ff1fe882"
ciphertext = bytes.fromhex(ciphertext)

# test = random.sample(range(1, 255), 16)
test = list(range(1, 17))

mat = [[test[i * 4 + j] for j in range(4)] for i in range(4)]

def reverse_xor(block):
    order = [2, 3, 0, 1]
    for i in order:
        for j in range(4):
            block[i][j] ^= block[(i + 2) % 4][(j + 1) % 4]

def reverse_add(block):
    res = [[0 for i in range(4)] for j in range(4)]

    # Solve for third row
    res[2][2] = (block[2][2] - 2 * block[2][0])
    res[2][3] = (block[2][3] - 2 * block[2][1])
    res[2][0] = (block[2][0] - res[2][2] * 2)
    res[2][1] = (block[2][1] - res[2][3] * 2)

    # Solve for fourth row
    res[3][0] = (block[3][0] - 2 * block[1][3])
    res[3][1] = (block[3][1] - 2 * block[1][0])
    res[3][2] = (block[3][2] - 2 * block[1][1])
    res[3][3] = (block[3][3] - 2 * block[1][2])
    
    # Solve for second row
    res[1][0] = (block[1][0] - 2 * res[3][1])
    res[1][1] = (block[1][1] - 2 * res[3][2])
    res[1][2] = (block[1][2] - 2 * res[3][3])
    res[1][3] = (block[1][3] - 2 * res[3][0])

    for i in range(1, 4):
        for j in range(4):
            res[i][j] &= 0xFF

    # Solve for first row
    for i in range(4):
        c = 0
        while True:
            if (256 * c + block[0][i]) % 3 == 0:
                res[0][i] = int((256 * c + block[0][i]) / 3)
                break
            c += 1

    for i in range(4):
        for j in range(4):
            block[i][j] = res[i][j]

def reverse_sub(block):
    for i in range(4):
        for j in range(4):
            block[i][j] = SUB_KEY.index(block[i][j])

def reverse_rotate(row):
    row[0], row[1], row[2], row[3] = row[1], row[2], row[3], row[0]

def reverse_transpose(block):
    copyBlock = [[block[i][j] for j in range(4)] for i in range(4)]

    for i in range(4):
        for j in range(4):
            block[i][j] = copyBlock[j][i]

def reverse_swap(block):
    s = 0 
    for i in range(4):
        for j in range(4):
            s += block[i][j]

    if (s % 2): reverse_transpose(block)

    for i in range(3):
        block[i][0], block[i][1], block[i][2], block[i][3] = block[i][2], block[i][0], block[i][1], block[i][3]

    reverse_rotate(block[3]); reverse_rotate(block[3]); reverse_rotate(block[3])
    reverse_rotate(block[2])
    reverse_rotate(block[1]); reverse_rotate(block[1]); reverse_rotate(block[1])
    reverse_rotate(block[0]); reverse_rotate(block[0])

    block[0], block[1], block[2], block[3] = block[3], block[2], block[0], block[1]

def reverse_round(block):
    reverse_xor(block)
    reverse_swap(block)
    reverse_add(block)
    reverse_sub(block)

def decryptBlock(block):
    mat = [[block[i * 4 + j] for j in range(4)] for i in range(4)]
    for _ in range(30):
        reverse_round(mat)
    return [mat[i][j] for i in range(4) for j in range(4)]

def decrypt(ciphertext):
    ciphertext = list(ciphertext)
    enc = []
    for i in range(0, len(ciphertext), 16):
        enc += decryptBlock(ciphertext[i : i + 16])
    return unpad(bytes(enc), 16)

print(decrypt(ciphertext))
```