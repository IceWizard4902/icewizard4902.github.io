# ProSign 3

Big kudos to `ConnorM` on the Cryptohack Discord for the help. This challenge is super sneaky, as the implementation looks very sound, and it bears great resemblance to the [example](https://ecdsa.readthedocs.io/en/latest/ecdsa.ecdsa.html) of the `Python-ecdsa` module. 

I learnt two lessons from this. First, please do code fuzzing carefully - I was very close to the actual solution but simply missed the crucial idea. Second, do not make assumptions about one's code - vulnerabilities can start from something very silly. [ECDSA: Handle with Care](https://blog.trailofbits.com/2020/06/11/ecdsa-handle-with-care/) is an excellent article from TrailofBits demonstrating the vulnerablities evident in ECDSA with nonce bias.

The vulnerability in the challenge is the way that the message is signed. 

```python
m, n = int(now.strftime("%m")), int(now.strftime("%S"))
...
sig = self.privkey.sign(bytes_to_long(hsh), randrange(1, n))
```

The random number generated is within the range of `(1, n)`, but `n` is not the order of the group as intended, but `n` is the value of `int(now.strftime("%S"))`. Hence, the value of the random number `k` is dependent on the time that we requested for the time signature. This allows us to use the [exploit that broke PS3's encryption](https://fahrplan.events.ccc.de/congress/2010/Fahrplan/attachments/1780_27c3_console_hacking_2010.pdf) and quite easily obtain the secret key, hence the name of the challenge `ProSign 3`. We can retrieve the private key used with two different messages using the same nonce, referred from this [page](https://billatnapier.medium.com/ecdsa-weakness-where-nonces-are-reused-2be63856a01a). 

The `n` used in `randrange` is the second in the requested time for the signature. `randrange(1, 2)` will always return `1`, therefore a message requested at the time with the number of seconds being `2` will always have a nonce of `1`. However, the form of the message is `month:seconds`, so we cannot request another message at the time with the number of seconds being `2` again, as the form of the message is the same. Hence, we will use the next possible time - second `3`. However, this only yields a 50% chance of the same nonce `1` being used, as the possible value from `randrange(1, 3)` is `1, 2`. If we fail, we can always retry and do again. Another crucial point is that we should wait for 1 minute after the first message - requesting the next message immediately will lead to wrong timings on the server side. 

Python Implementation

```python
from pwn import * 
from datetime import datetime
from ecdsa.ecdsa import Public_key, Private_key, Signature, generator_192
from Crypto.Util.number import bytes_to_long, long_to_bytes
import json 

g = generator_192
n = g.order()

io = remote('socket.cryptohack.org', 13381)
io.recvline()

send_time = dict()
send_time['option'] = 'sign_time'

def send_payload(time):
    while True: 
        now = datetime.now()
        if now.strftime("%S") == time:
            io.sendline(json.dumps(send_time).encode())
            return json.loads(io.recvline())
        sleep(1)

def sha1(data):
    sha1_hash = hashlib.sha1()
    sha1_hash.update(data)
    return sha1_hash.digest()

# Send first payload, time we want is 02
signature_1 = send_payload("02")
msg_1 = bytes_to_long(sha1(signature_1['msg'].encode()))

temp = Signature(int(signature_1['r'], 16), int(signature_1['s'], 16))

# There are two possible public keys from the signature observed
public_key_1, public_key_2 = temp.recover_public_keys(msg_1, g)

# Wait for another minute
sleep(1)

# Send next payload, time we want is 03
signature_2 = send_payload("03")
msg_2 = bytes_to_long(sha1(signature_2['msg'].encode()))
r1, s1 = int(signature_1['r'], 16), int(signature_1['s'], 16)
r2, s2 = int(signature_2['r'], 16), int(signature_2['s'], 16)

# Verify if the same nonce is reused
print(r1 == r2)

# Code from https://billatnapier.medium.com/ecdsa-weakness-where-nonces-are-reused-2be63856a01a
inv = pow(r1 * (s1 - s2), -1, n)
secret = ((s2 * msg_1 - s1 * msg_2) * inv) % n 

# Two private keys from two possible public keys
privKey_1 = Private_key(public_key_1, secret)
privKey_2 = Private_key(public_key_2, secret)

flag = dict()
flag['option'] = 'verify'
flag['msg'] = "unlock"

# Send the first message with the first public key
hsh = bytes_to_long(sha1("unlock".encode()))
sig = privKey_1.sign(hsh, 42)
flag['r'] = hex(sig.r)
flag['s'] = hex(sig.s)

io.sendline(json.dumps(flag).encode())
print(io.recvline())

# Send the second message with the second public key
sig = privKey_2.sign(hsh, 42)
flag['r'] = hex(sig.r)
flag['s'] = hex(sig.s)

io.sendline(json.dumps(flag).encode())
print(io.recvline())

io.close()
```

Note that there is also a solution using LLL based on the TrailofBits article above. Kudos to `terrynini38514` on Cryptohack for this solution.

```python
from pwn import *
import json
import hashlib
from Crypto.Util.number import bytes_to_long, long_to_bytes
from ecdsa.ecdsa import Public_key, Private_key, Signature, generator_192
from random import randrange

g = generator_192
n = g.order()

class Challenge():
    def __init__(self, s):
        self.before_input = "Welcome to ProSign 3. You can sign_time or verify.\n"
        secret = s
        self.pubkey = Public_key(g, g * secret)
        self.privkey = Private_key(self.pubkey, secret)

    def sha1(self, data):
        sha1_hash = hashlib.sha1()
        sha1_hash.update(data)
        return sha1_hash.digest()

    def sign(self, msg):
        hsh = self.sha1(msg.encode())
        sig = self.privkey.sign(bytes_to_long(hsh), randrange(1, n))
        return {"msg": msg, "r": hex(sig.r), "s": hex(sig.s)}

r = remote("socket.cryptohack.org", 13381)
r.recv()


r.sendline('{"option":"sign_time"}')
first = json.loads(r.recvuntil(b'\n'))
r.sendline('{"option":"sign_time"}')
second = json.loads(r.recvuntil(b'\n'))

print(first)
print(second)
print("run this in sage:")
print("-"*40)
#https://www.reddit.com/r/crypto/comments/h7cr6a/ecdsa_handle_with_care/
#https://blog.trailofbits.com/2020/06/11/ecdsa-handle-with-care/
print(f"""order = {n} 
r1 = {first['r']}
s1 = {first['s']}
s1_inv = inverse_mod(s1, order)
z1 = {bytes_to_long(hashlib.sha1(first['msg'].encode()).digest())}
r2 = {second['r']}
s2 = {second['s']}
s2_inv = inverse_mod(s2, order)
z2 = {bytes_to_long(hashlib.sha1(second['msg'].encode()).digest())}

matrix = [[order, 0, 0, 0], [0, order, 0, 0],
[r1*s1_inv, r2*s2_inv, (2^96) / order, 0],
[z1*s1_inv, z2*s2_inv, 0, 2^96]]
sol = Matrix(matrix).LLL()
r1_inv = inverse_mod(r1, order)
row = sol[2]
potential_nonce_1 = (row[0])%order
potential_priv_key = (r1_inv * ((potential_nonce_1 * s1) - z1))%order
print("the secret is: ",potential_priv_key)
""")
print("-"*40)
j = Challenge(int(input("secret:"))).sign("unlock")
j["option"] = 'verify'
r.sendline(str(j).replace("'",'"'))
r.interactive()
```