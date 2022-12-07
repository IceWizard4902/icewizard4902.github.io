from pwn import *
import json 
from Crypto.Cipher import AES
from Crypto.Util.Padding import pad, unpad
import hashlib

def is_pkcs7_padded(message):
    padding = message[-message[-1]:]
    return all(padding[i] == len(padding) for i in range(0, len(padding)))


def decrypt_flag(shared_secret: int, iv: str, ciphertext: str):
    # Derive AES key from shared secret
    sha1 = hashlib.sha1()
    sha1.update(str(shared_secret).encode('ascii'))
    key = sha1.digest()[:16]
    # Decrypt flag
    ciphertext = bytes.fromhex(ciphertext)
    iv = bytes.fromhex(iv)
    cipher = AES.new(key, AES.MODE_CBC, iv)
    plaintext = cipher.decrypt(ciphertext)
    if is_pkcs7_padded(plaintext):
        return unpad(plaintext, 16).decode('ascii')
    else:
        return plaintext.decode('ascii')

io = remote('socket.cryptohack.org', 13371)
alice_recv = io.recvline().strip().decode().split("e: ")[1]
alice_recv = json.loads(alice_recv)

alice_to_bob = dict()
alice_to_bob['p'] = alice_recv['p']
alice_to_bob['g'] = alice_recv['g']
alice_to_bob['A'] = alice_recv['g']

print(json.dumps(alice_to_bob))
io.sendline(json.dumps(alice_to_bob).encode())

bob_recv = io.recvline().strip().decode().split("b: ")[2]
bob_recv = json.loads(bob_recv)

bob_to_alice = dict()
bob_to_alice['B'] = alice_recv['g']

print(json.dumps(bob_to_alice))
io.sendline(json.dumps(bob_to_alice).encode())

shared_secret = int(alice_recv['A'], 16)

alice_flag = io.recvline().strip().decode().split("e: ")[2]
alice_flag = json.loads(alice_flag)

print(decrypt_flag(shared_secret, alice_flag["iv"], alice_flag["encrypted_flag"]))
io.close()
