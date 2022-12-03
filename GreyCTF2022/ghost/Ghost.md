# Ghost

This is quite a tricky challenge, as I thought initially this challenge is about finding out what's the encoding scheme behind all the messages. Using [dcode](https://www.dcode.fr/cipher-identifier), we can easily identify the encoding used in the visible text. However the messages' content are mostly gibberish and do not contain any clues to the actual flag.

There are no signs of any hidden alternative data streams (ADS) or anything hidden in the file. Hence, the file's actual message is hidden using steganography. Bolding the entire file shows some very peculiar trends.

<img src="https://i.imgur.com/mmylIYO.png">

The message is hidden using white space steganography. The `.` in Sublime means that there's a space, `---` (the long dash) means that there's a tab character.

From researching on how to solve this, I encounter one video from John Hammond on [Youtube](https://www.youtube.com/watch?v=guJX2s6eB_4). Modifying the Python script in the video and set the value of a space to `0`, a tab character for `1` should give us a binary message that we can plug into [Cyberchef](https://gchq.github.io/CyberChef) and use the Magic function there to retrieve the flag.

<img src="https://i.imgur.com/X3iiWat.png">

Solution Helper Implementation:
```python
import re

file = open('ghost')
c = [x[:-1] for x in file.readlines()]
file.close()
flag = []

for line in c:
	num = re.findall(r"(\s+)", line)
	if num:
		num = ''.join(num).replace(' ', '0').replace('\t', '1')
		print(num)


print(''.join(flag))
```