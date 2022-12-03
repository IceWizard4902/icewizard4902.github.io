# Disney Endgame

A simple challenge. Running `diff` should give us the flag. The combined difference of the two files should yield the flag.

```bash
in the middle of third grade
in the middle of third ggrade.

And for our grand finale,
And for our grrand finale,

So, to you, Dale, my best friend,
So, to you, Dalee, my best friend,

- Yes, Ugly Sonic. That's the spirit.
- Yes, Uglyy Sonic. That's the spirit.

in the last two months...
in the last two monthhs...

Mad? No. I'd be pretty pathetic
Mad? No. I'd be pretty paathetic

after the show tonight?
aftter the show tonight?

- You are gross.
- You are grosss.

- "Case?"
- "{Case?"

And leave the top hat
And leave the toup hat

the Gouda, the Brie.
the GGouda, the Brie.

00:28:13,333 --> 00:28:14,684
00:28:113,333 --> 00:28:14,684

No! No. We just wanna buy
No! No. We just wanna buyy

00:28:34,541 --> 00:28:36,041
00:28:34,541 _-> 00:28:36,041

00:29:12,208 --> 00:29:14,625
00:29:12,208 --> 00:29:14,655

520
5200

Really? Meeting Sweet Pete, huh?
Really? Meeting Sweet Peten, huh?

00:30:24,416 --> 00:30:28,750
00:30:24,416 --> 00:30:28,751

- in the back of a truck!
- Cin the back of a truck!

00:30:51,541 --> 00:30:54,541
00:30:51,541 -_> 00:30:54,541

Oh, are you seeing someone?
Oh, are you seeingg someone?

00:31:06,666 --> 00:31:10,625
00:31:06,666 --> 00:31:10,620

- It could be my agent, Dave Bolinari!
- It could be my agent, Dave BoElinari!

00:37:36,958 --> 00:37:40,750
00:37:36,958 --> 00:37:40,755

00:38:28,208 --> 00:38:30,250
00:38:28,208 -->_00:38:30,250

So, if we could get a hold
SSo, if we could get a hold

00:39:57,333 --> 00:40:00,958
00:39:57,333 --> 00:40:01,958

of Rescue Rangers ever?
oof Rescue Rangers ever?

What? Of course I did.
WWhat? Of course I did.

00:42:18,750 --> 00:42:21,541
00:42:18,750_--> 00:42:21,541

looked exactly like... Oprah.
looked exactly like... BOprah.

00:42:49,958 --> 00:42:53,791
00:42:49,958 --> 00:42:53,794

of all of us together.
of all bof us together.

Okay, guys. Sweet Pete goes
Okay, guys. SweetY Pete goes

by all those goons?
by all those goons?!

Oh, come on! Episode 45!
Oh, come on! Episode_45!

00:43:40,291 --> 00:43:43,833
00:43:40,291 --> 00:43:43,831

for going behind my back, Steckler.
for going behind my bback, Steckler.

Flounder?
Fflounder?

00:51:02,166 --> 00:51:03,166
00:51:82,166 --> 00:51:03,166

00:54:36,333 --> 00:54:37,541
00:54:36,333 --> 00:54:37,540

Dale, we need to leave, now.
Ddale, we need to leave, now.

00:59:54,916 --> 00:59:57,291
00:59:54,916 --> 00:59:57,293

01:11:06,500 --> 01:11:09,458
01:11:06,500 --> 01:11:09,456

like you were second banana
like you were second bananaa

Gets solved
Gets solved}
```

It is too tedious to extract out the flag from eyeballing the `diff` logs, so a Python script is used.

```python
lines = [line.rstrip() for line in open('diff.txt')]
lines = list(filter(lambda a: a != "", lines))

original = lines[0::2]
alter = lines[1::2]

flag = ""
for i in range(len(original)):
	o = original[i]
	a = alter[i]
	found_diff = False

	for j in range(len(o)):
		if o[j] != a[j]:
			flag += a[j]
			found_diff = True 
			break 

	if not found_diff:
		flag += a[len(o)]

print(flag)
```