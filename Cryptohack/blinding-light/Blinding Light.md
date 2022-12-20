# Blinding Light

RSA signing with malleability, we can sign anything but the admin token to retrieve the flag. My approach is to get the signature of the hex string `b'\x02'`, in numeric value is $2^d$, with $d$ being the private key.

Then we request for the message that is twice the value of the admin token, then we get the value of $(2m)^d$. Then retrieving the value of $m^d$ should be trivial.

```python
from Crypto.Util.number import bytes_to_long, long_to_bytes
from pwn import * 
import json 

admin_token = b'admin=True'

io = remote('socket.cryptohack.org', 13376)
io.recvline()

public_key = dict()
public_key['option'] = 'get_pubkey'

io.sendline(json.dumps(public_key).encode())

public_key = json.loads(io.recvline().decode())
N = int(public_key['N'], 16)
e = int(public_key['e'], 16)

two_times = b'\x02'.hex()
two_times_dict = dict()
two_times_dict['option'] = 'sign'
two_times_dict['msg'] = two_times
io.sendline(json.dumps(two_times_dict).encode())

two_times = json.loads(io.recvline().decode())
two_times = int(two_times['signature'], 16)

two_times_admin = long_to_bytes(2 * bytes_to_long(admin_token)).hex()
two_times_admin_dict = dict()
two_times_admin_dict['option'] = 'sign'
two_times_admin_dict['msg'] = two_times_admin

io.sendline(json.dumps(two_times_admin_dict).encode())
two_times_admin = json.loads(io.recvline().decode())
print(two_times_admin)
two_times_admin = int(two_times_admin['signature'], 16)

admin_sig = hex((two_times_admin * pow(two_times, -1, N)) % N)
admin = dict()
admin['option'] = 'verify'
admin['msg'] = admin_token.hex()
admin['signature'] = admin_sig

io.sendline(json.dumps(admin).encode())
io.interactive()
```

A smarter solution, by `bobflanagan`: 

```python
# Preprocessing and preparation.
# 
# Express 'admin=True' as a long yields m=459922107199558918501733.
# Plugging this into a factorizer yields two prime factors:
#   p1=211578328037 and p2=2173767566209, m = p1*p2
#
# Asking the server to sign each of these messages individually will yield
# pow(p1, D, N) and pow(p2, D, N), and it will respond since neither of these
# individual messages is 'admin=True' when decoded.
#
# Now, you can compute the digital signature of 'admin=True' by multiplying the
# two signatures you got! Since p1^D * p2^D = (p1 * p2) ^ D mod N.

import json

from Crypto.Util.number import bytes_to_long, long_to_bytes
from pwn import *

p1 = 211578328037
p2 = 2173767566209

conn = remote('socket.cryptohack.org', 13376)
data = conn.recvline()

resp = dict()
resp['option'] = 'get_pubkey'
conn.send(json.dumps(resp))

data = json.loads(conn.recvline())
N = bytes_to_long(bytes.fromhex(data['N'][2:]))

resp = dict()
resp['option'] = 'sign'
resp['msg'] = long_to_bytes(p1).hex()
conn.send(json.dumps(resp))

data = json.loads(conn.recvline())
s1 = bytes_to_long(bytes.fromhex(data['signature'][2:]))

resp = dict()
resp['option'] = 'sign'
resp['msg'] = long_to_bytes(p2).hex()
conn.send(json.dumps(resp))

data = json.loads(conn.recvline())
s2 = bytes_to_long(bytes.fromhex(data['signature'][2:]))

signature = (s1 * s2) % N

resp = dict()
resp['option'] = 'verify'
resp['msg'] = b'admin=True'.hex()
resp['signature'] = long_to_bytes(signature).hex()
conn.send(json.dumps(resp))

data = json.loads(conn.recvline())
print(data['response'])
```

