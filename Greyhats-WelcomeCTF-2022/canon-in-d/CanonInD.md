# Canon In D 

A misc challenge involving high-school level physics. We are tasked to solve the problem of free falling in 3D space of a object launched at a speed and orientation given by the server. 

The only observation to solve the challenge is the fact that there is no forces acting on the cannonball other than gravity, hence the velocity in the `x` and `z` axis is the same. We can treat the velocity in the `y` axis as a normal 1D problem of an object pulled by a force. Then it is just a matter of NOT messing up the signs of the velocity equations - very tricky without a solid understanding of 

Solution Implementation
```python
import math
from pwn import *

def solver(coord_1, coord_2):
	g = -9.8

	delta_time = coord_2[3] - coord_1[3]
	v_x = (coord_2[0] - coord_1[0]) / delta_time
	v_y = (coord_2[1] - coord_1[1]) / delta_time

	z12_displacement = coord_2[2] - coord_1[2]
	v_z1 = (2 * g * z12_displacement - (g * delta_time) ** 2) / (2 * g * delta_time)

	v_z0 = v_z1 - g * coord_1[3]
	z0_displacement = (v_z1 ** 2 - v_z0 ** 2) / (2 * g)

	x = coord_1[0] - v_x * coord_1[3]
	y = coord_1[1] - v_y * coord_1[3]
	z = coord_1[2] - z0_displacement

	v_zground = - math.sqrt(v_z0 ** 2 - 2 * g * z)

	return ((x, y, z), (v_x, v_y, v_zground))

def main():
	url = "34.143.157.242"
	port = 8069

	conn = remote(url, port)
	while True:
		line = conn.recvline()
		if b'Round 1' in line: 
			break  
	
	coord_1 = eval(conn.recvline().decode())
	coord_2 = eval(conn.recvline().decode())
	result = solver(coord_1, coord_2)

	conn.recvline() # Skip blank line
	conn.sendline(bytes(str(result[0]), 'utf-8'))
	conn.sendline(bytes(str(result[1]), 'utf-8'))
	
	for i in range(99):
		while True:
			line = conn.recvline()
			if b'Round' in line: 
				break  
		coord_1 = eval(conn.recvline().decode())
		coord_2 = eval(conn.recvline().decode())
		result = solver(coord_1, coord_2)
		conn.sendline(bytes(str(result[0]), 'utf-8'))
		conn.sendline(bytes(str(result[1]), 'utf-8'))

	conn.recvline()
	print(conn.recvline())
if __name__ == "__main__":
	main()
```