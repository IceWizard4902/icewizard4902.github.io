# Dancing Queen 

The challenge gives us the description that there is some `ChaCha20` implementation, and [searching Google](https://blog.cryptohack.org/new-challenges-jun-2021) for the name of the challenge shows some hints about this implementation being done "incorrectly". 

Hence we should take a look at the way that `ChaCha20` is supposed to be implemented. One good resource is [RFC 8439](https://datatracker.ietf.org/doc/html/rfc8439#page-10), clicking on the link should take you to the page that contains the high-level pseudocode of how `ChaCha20` works. Then we just do some reading on the RFC and check if the implementation is correct. 

I do not want to go into details on how `ChaCha20` works, as the RFC 8439 is very clear and should be self-explanatory. The difference between the given implementation and the RFC specification is that the state must be added with the pseudorandom permutation `state += initial_state`. However, in the Python implementation, no such addition is performed, the state is only permuted using Add Rotate Xor (ARX). Hence, information is retained, and we can reverse the operation to derive the key from a given keystream. Combine this with the fact that the initial state is just the IV and the key appended to a counter, along with a known plaintext for the cipher, and key recovery becomes trivial.

Why adding the original state to the permuted state should be explained in this [question](https://crypto.stackexchange.com/questions/77628/is-the-chacha20-block-function-reversible-using-known-plaintext) on Crypto StackExchange. 

We can recover the keystream by just simply `xor` the given sample message with the corresponding plaintext (only the first 64-byte block is needed), retrieve the key, then from the key and the given IV, do the decryption operation to obtain the flag.

```python
from os import urandom 

def bytes_to_words(b):
    return [int.from_bytes(b[i:i+4], 'little') for i in range(0, len(b), 4)]

def rotate(x, n):
    return ((x << n) & 0xffffffff) | ((x >> (32 - n)) & 0xffffffff)

def word(x):
    return x % (2 ** 32)

def words_to_bytes(w):
    return b''.join([i.to_bytes(4, 'little') for i in w])

def xor(a, b):
    return b''.join([bytes([x ^ y]) for x, y in zip(a, b)])

class ChaCha20:
    def __init__(self):
        self._state = []

    def _inner_block(self, state):
        self._quarter_round(state, 0, 4, 8, 12)
        self._quarter_round(state, 1, 5, 9, 13)
        self._quarter_round(state, 2, 6, 10, 14)
        self._quarter_round(state, 3, 7, 11, 15)
        self._quarter_round(state, 0, 5, 10, 15)
        self._quarter_round(state, 1, 6, 11, 12)
        self._quarter_round(state, 2, 7, 8, 13)
        self._quarter_round(state, 3, 4, 9, 14)

    def _quarter_round(self, x, a, b, c, d):
        x[a] = word(x[a] + x[b]); x[d] ^= x[a]; x[d] = rotate(x[d], 16)
        x[c] = word(x[c] + x[d]); x[b] ^= x[c]; x[b] = rotate(x[b], 12)
        x[a] = word(x[a] + x[b]); x[d] ^= x[a]; x[d] = rotate(x[d], 8)
        x[c] = word(x[c] + x[d]); x[b] ^= x[c]; x[b] = rotate(x[b], 7)
    
    def _setup_state(self, key, iv):
        self._state = [0x61707865, 0x3320646e, 0x79622d32, 0x6b206574]
        self._state.extend(bytes_to_words(key))
        self._state.append(self._counter)
        self._state.extend(bytes_to_words(iv))

    def decrypt(self, c, key, iv):
        return self.encrypt(c, key, iv)

    def encrypt(self, m, key, iv):
        c = b''
        self._counter = 1

        for i in range(0, len(m), 64):
            self._setup_state(key, iv)
            for j in range(10):
                self._inner_block(self._state)
            c += xor(m[i:i+64], words_to_bytes(self._state))

            self._counter += 1
        
        return c

def reverse_rotate(x, n):
    return ((x << (32 - n)) & 0xffffffff) | ((x >> n) & 0xffffffff)

def reverse_quarter_round(x, a, b, c, d):
    x[b] = reverse_rotate(x[b], 7); x[b] ^= x[c]; x[c] = word(x[c] - x[d])
    x[d] = reverse_rotate(x[d], 8); x[d] ^= x[a]; x[a] = word(x[a] - x[b])
    x[b] = reverse_rotate(x[b], 12); x[b] ^= x[c]; x[c] = word(x[c] - x[d])
    x[d] = reverse_rotate(x[d], 16); x[d] ^= x[a]; x[a] = word(x[a] - x[b])

def reverse_inner_block(state):
    reverse_quarter_round(state, 3, 4, 9, 14)
    reverse_quarter_round(state, 2, 7, 8, 13)
    reverse_quarter_round(state, 1, 6, 11, 12)
    reverse_quarter_round(state, 0, 5, 10, 15)
    reverse_quarter_round(state, 3, 7, 11, 15)
    reverse_quarter_round(state, 2, 6, 10, 14)
    reverse_quarter_round(state, 1, 5, 9, 13)
    reverse_quarter_round(state, 0, 4, 8, 12)

iv1 = 'e42758d6d218013ea63e3c49'
iv2 = 'a99f9a7d097daabd2aa2a235'
msg_enc = 'f3afbada8237af6e94c7d2065ee0e221a1748b8c7b11105a8cc8a1c74253611c94fe7ea6fa8a9133505772ef619f04b05d2e2b0732cc483df72ccebb09a92c211ef5a52628094f09a30fc692cb25647f'
flag_enc = 'b6327e9a2253034096344ad5694a2040b114753e24ea9c1af17c10263281fb0fe622b32732'
msg = b'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula.'

msg_enc = bytes.fromhex(msg_enc)
flag_enc = bytes.fromhex(flag_enc)

state = bytes_to_words(xor(msg[:64], msg_enc[:64]))

for i in range(10):
    reverse_inner_block(state)

key = words_to_bytes(state[4:12])

c = ChaCha20()
print(c.decrypt(flag_enc, key, bytes.fromhex(iv2)))
```

