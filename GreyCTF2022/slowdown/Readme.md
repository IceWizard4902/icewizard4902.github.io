# SlowDown
> Author: Nguyen Quang Vinh

To retrieve the flag, one has to do operations that combined, takes longer than 5 seconds for the program to execute. 

<img src="https://i.imgur.com/D5avEl9.png"> 

To do that, we have to analyse the runtime of each operation and see which combination will take the longest time. There's a limit to the number of operations that can be done on the program, which is defined in the `LIMIT` constant and takes the value of 25000.

The program given is doing 3 opearations depending on the Opcode on the unordered hashmap:

* Opcode 0: Add an entry into the unordered hashmap. This operation runs in constant time `O(1)`
<img src="https://i.imgur.com/4Y7fVnl.png">

* Opcode 1: Calculate the sum of all the values in every `(key, value)` pair in the mapping. This operation runs in linear time `O(n)`
<img src="https://i.imgur.com/wK5edG8.png">

* Opcode 2: Simply print the amount of time elapsed. This operation runs in constant time `O(1)`
<img src="https://i.imgur.com/ZINgzKA.png">

Hence, to solve this challenge, we need to find a strategy to waste as much time as possible with a combination of operations of opcode `0` and `1`. 

One strategy is to add a number of entries into the hashmap, then calculate the number of entries added so that the sum of the time taken adding the entries and summing up all the elements takes the longest time. To do this, let `x` be the number of operations of opcode `0`, then the number of operations of opcode `1` will be `LIMIT - x`

Hence, the total runtime will be `x * 1 + (LIMIT - x) * x`. The maximum value of this quadratic happens at `(LIMIT + 1) / 2`, which is not an integer but we can take either the floor or ceil of the value.

Hence, we need `12500` operations opcode `0` and the rest for operations opcode `1` to waste as much time as possible. To waste slightly more time, we can increase the value of the `(key, value)` pair so that operations on them take a longer time. The script to retrieve the flag can be found at the `solve.py` file. The key is cubed so it is big enough to waste time, and the value is a random arbitrary number that's big enough to fit in `int`