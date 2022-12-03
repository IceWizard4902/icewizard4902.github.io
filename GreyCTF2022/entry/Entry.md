# Entry
The message is encrypted by `xor` the original message with the secret key. But the implementation leaks information as it `xor` 4 bytes at a time. 

We already know that the flag should begin with `grey{`, hence we can easily retrieve the message by `xor` the first 4 characters, in this case `grey` with the ciphertext and we should have the secret. 

To retrieve the flag, we use the secret, `xor` the secret with 4 bytes each from the ciphertext.

Solution Implementation: 

```python
ciphertext = "982e47b0840b47a59c334facab3376a19a1b50ac861f43bdbc2e5bb98b3375a68d3046e8de7d03b4"
ciphertext = bytes.fromhex(ciphertext)

flag = b'grey'

def decrypt(m):
    return bytes([x ^ y for x, y in zip(m,key)])

key = bytes([x ^ y for x, y in zip(ciphertext[:4], flag)])
flag = b''
for i in range(0, 40, 4):
	flag += decrypt(ciphertext[i:i+4])

print(flag)
```

