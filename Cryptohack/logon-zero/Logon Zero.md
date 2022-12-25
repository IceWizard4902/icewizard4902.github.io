# Logon Zero

This challenge documents the ZeroLogon vulnerability, which is a critical vulnerability originating from a cryptographic authentication protocol failure in Microsoft Active Directory.

There is a [ZeroLogon whitepaper](https://www.secura.com/uploads/whitepapers/Zerologon.pdf), which is useful in solving this challenge. The underlying encryption scheme in both the challenge and the Microsoft Active Directory is the `AES-CFB8`. The encryption method should be clearly demonstrated in the paper. 

In the challenge, the `encrypt` method is not in use and only serve as a red herring. Only `decrypt` is used in the challenge, which allows us control over the IV and the ciphertext. The paper takes advantage of the fact that `AES-CFB8` uses a fixed IV of all zeros, hence they use a message of all zeros as well. 

Since the password check is the following, we cannot specify a password of all null bytes as it cannot be represented in ASCII form for the `encode()` call.

```python
if your_password.encode() == self.password:
    self.exit = True
    return {'msg': 'Welcome admin, flag: ' + FLAG}
```

We can still take the idea of the paper, by specifying both the IV and the ciphertext with the same value, we have a $\frac{1}{256}$ chance for the first byte of the ciphertext produced by the `AES` to be the null byte. The plaintext will thus be the same as the ciphertext.

Hence, the strategy is simple. First we try to reset the password (as we obviously don't know the randomized password), then try the password that is the same as the ciphertext, then if we can't log in, we reset the connection to make the decryption use a different random key and try our luck again. 

The script will take a while and some tries to run, also note that the last 4 character of the new password is trimmed.

Python Implementation

```python
from pwn import * 
import json 

io = remote('socket.cryptohack.org', 13399)
io.recvline()

iv = b'a' * 16 
password = "a" * 16
ct = iv + password.encode()

reset_conn = dict()
reset_conn['option'] = 'reset_connection'

reset_pass = dict()
reset_pass['option'] = 'reset_password'
reset_pass['token'] = ct.hex()

auth = dict()
auth['option'] = 'authenticate'
auth['password'] = 'a' * 12 

while True:
    io.sendline(json.dumps(reset_pass).encode())
    io.recvline()

    io.sendline(json.dumps(auth).encode())
    status = json.loads(io.recvline().decode())['msg']
    if "flag" in status: 
        print(status)
        break
    
    io.sendline(json.dumps(reset_conn).encode())
    io.recvline()
```