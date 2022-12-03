# Permutation
> Author: Nguyen Quang Vinh

We are provided with three files, `main.py`, `out.txt` and `perm.py`. `out.txt` is the result of running `main.py`, `perm.py` is used as the permutation library used for this challenge.

The `main.py` encrypt the `FLAG` using `xor` with the secret generated from the digest of `shake_256` method using the value from the `key`. Hence, to decrypt the ciphertext, we need to retrieve the `key`.

The key is generated at the `A ** b` call, and we are provided the value of the generator `g`, `A` and `B`. To get the value of the key, we need to figure out the value of `b`. 

<img src="https://i.imgur.com/OsYXkF9.png">

To derive the way to retrieve the key, we should first take a look at the `perm.py` file and see how the `Perm` class operates.

<img src="https://i.imgur.com/Q8l5Ynn.png">

First, upon initialization, there is a check to see if the `arr` used is valid or not. The valid check is simply to check if the array is indeed an array of consecutive integers starting from `0` or not. The multiplication operation is done by first checking whether the size of the two `arr` inside the two `Perm` object are of equal sizes. Then, for every `i` in the other list, we append to the `res` the value of its internal array at position `i`. This achieves the "permutation", as the validity check from earlier ensures that the integers are consecutive, and the size checking ensures that the mapping from the original to the modified array is one-to-one. 

We don't really know for sure at this point how the `pow` function works, hence we can test this functionality on a smaller set to see if there is any pattern. We will create a `test.py` script to test some of our observations. Note that some of the tests here can be skipped if you understand what's going on in the implementation of `pow`. When I did this challenge, I have zero clue what the bit shifting is doing so I did these tests to confirm some of my hypothesis which leads to me solving the problem.

First, we want to test whether the equality `g ^ n = g * g ... * g (n times)` holds. Of course we can't really "prove" this with code, but let's test some of the values and see if it holds. This indeed is true.

```Python
def first_test(g, n):
    res = g
    for i in range(n - 1):
        res *= g 
    print(str(res) == str(g ** n))

first_test(g, 3) # Returns True
first_test(g, 329394) # Returns True
# You can plug in the g given in the out.txt
# and this should hold for any n
```

Hence, what the `pow` function really does is just a convoluted (but very efficient! way) of powering, but it is still similar to powering using the standard way of doing `g * g * g ...`. Knowing this, we can look at the code again to verify, and it does work in that way :smile:

Second, we need to check if `g ** (a + b) = g ** a * g ** b` holds. We can easily proof this, simply by expanding the three powers, of the form `g ** n` into the `g * g * ... *g * g` form. 

Third, we want to see if this is cyclic. Cyclic means that the value is repeated after some `n` times of multiplying. This is useful, since if this is true we do not really have to figure out the exact value of `b`, we can find a smaller value to replace it. 

```Python
def third_test(g, n):
    for i in range(1, n):
        print(g ** i)

third_test(g, 20)
```

The result indeed confirms this is cyclic, as it repeats after a certain number of cycles. In the picture, the cycle is 12, as after 13 (4 + 1) times multiplying itself, the original array becomes itself again. This property holds for any array in the cycle set, like the value of the 2nd array is found at the 6th index again. A script to just be safe that this property holds written in the `test.py` file.

<img src="https://i.imgur.com/mjdW85N.png">

Fourth, upon a closer look, we can see the value in a cycle of the first index, the sequence `7, 6, 10, 0` is repeated. This seemingly is the case for values in other indexes as well. Since we know that there is a cyclic property in the powering of the array here, and there is seemingly a sequence in each indexes as well, should there be a relation between the two? To see this trend clearer, we can use a smaller example of array of length 8 to see.

```Python
# FOURTH TEST
def find_cycle_naive(g):
    cycle = 2 
    while True:
        if (str(g ** cycle) == str(g)):
            return cycle 
        cycle += 1

g = [9, 7, 2, 1, 3, 6, 5, 4, 0, 8]
g = perm.Perm(g)
cycle = find_cycle_naive(g) - 1
print("Cycle:", cycle)

for i in range(cycle):
    print(g ** i)
```

<img src="https://i.imgur.com/EXGBKDb.png">

Everything is much clearer now, we can see the sequence `0, 9, 8` repeating in the 1st index. Another peculiar thing that we can see is that the sequence `0, 9, 8` does appear again, but starting a bit differently in the last (`8, 0, 9`) and next to last index (`9, 8, 0`). The length of the sequence is 3, and the length of other sequences are `4, 1, 2`. It is suprising that the `LCM` (Least Common Multiple) of `3, 4, 2, 1` is `12`. Interesting. 

We can test this on different ordering of the original array, and even different length as well, and the result will still be that the cycle is dependent on the least common multiple of the length of all the sequence in every index of the array. Hence, a better, smarter way to find the cycle of the array can be written.

We notice that, just after the original array is repeated (last array in the cycle). It takes 11 multiplications to get there. If we check out the position of the elements in the cycle, for example at the 1st index, we can see that the `8` is actually the final element in the sequence `0, 9, 8`. Similarly, for index number 2, `3`  is the last element in its sequence of `1, 7, 4, 3`. `11` divides `3` has a remainder of `2`, and `11` divides `4` has a remainder of `3`. It seems like the remainder of the index of an array in the cycle, divided by the length of the repeating sequence at any index `i` of the arrays should give the exact position in the repeating sequence of the `i`-th number in the array. We can easily verify this by writing our own function to find out the cycle a bit "smarter" now. For the sake of length I decided not to include that here, as this is already implemented in the actual solution.

And it seems like the reverse is true, if we know the position of the array `i`th element in the repeating sequence, we can derive the index of the array in the cycle using Chinese Remainder Theorem. This can be tested using the `makeChain` method in the `solve.py` file, which returns the repeating sequence in every index of the array. We get the index of the array in the cycle by 
first find the length of each "chain' (repeating sequence), then find the "remainder" by finding the index of each element in its "chain". Finally, we apply the Chinese Remainder Theorem to retrieve the result.

Using all these observations, we can finally use this to find out `b`. Finding out `b` is the same as finding the position of `B` in the cycle, given the generator `g`. The script is in the `solve.py` file. After retrieving `b`, we can get the original `S` that is used to generate the key by doing `A ** b`. A simple `xor` with the given key should be enough to get the flag.