from pwn import * 

io = remote('challs.nusgreyhats.org', 10527)

print(io.recvline())
print(io.recvline())

for i in range(12500):
	io.sendline(b'0 ' + str(i ** 3).encode() + b' 69696969')

for i in range(12499):
	print(i)
	io.sendline(b'1')
	print(io.recvline())

io.sendline(b'2')
print(io.recvline())