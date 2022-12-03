# Block 
> Author: Nguyen Quang Vinh

This is essentially a reverse engineering challenge. We have to derive a way to unscramble the scrambling done by the encryption scheme. Encryption is done in rounds, hence let `m` be the original message, `c` is the ciphertext. The scrambling in one round is given by `c = f(g(h(k(m))))`, where `f, g, h, k` are the four functions used for scrambling. To derive the original message, we have to find the inverse of each function, that is to find `f', g', h', k'`. `m` can be derived by `m = k'(h'(g'(f'(c))))`.

The `sub`, `rotate`, `transpose` and `swap` function can either be trivially done (the case with `sub`) or we can use some dummy values from 0 to 15 and see what is their position after the scrambling. Reversing is simply done by looking at the end pattern and derive a way to order them back. For functions that include other functions, the operation is still the same, reverse every function down to the smallest unit of it, then do the bigger function in reverse.

Writing this is very tedious and does not hold much value, as most of the work is done simply by observing the pattern after applying the function and try to reverse it. I will instead condense the technique used for those 4 functions in the analysis of the 1st and 2nd function, `xor` and `add`.

To reverse `xor`, we first should inspect which element are `xor`-ed with which. We can do this very easily by creating a dummy matrix containing integers from 1 to 16. We then print out the pair of `i, j` with the position of the element it got `xor`-ed with.

```Python
test = [i for i in range(1, 17)]
mat = [[test[i * 4 + j] for j in range(4)] for i in range(4)]

for i in range(4):
    for j in range(4):
        print(mat[i][j], mat[(i + 2) % 4][(j + 1) % 4])
```
From the output, we can derive how the original matrix is transformed after this function. The easiest way to do this is to write down the changing of every element in the order of the original loop (since the element in some position is changed, and the changed value is used for some later operations). We will have this matrix, where the integers `1...16` represent the 1st to the 16th element in the flattened out `mat`, `^` is the `xor` symbol.
The original matrix M
```
1       2       3       4
5       6       7       8
9       10      11      12
13      14      15      16 
```
is transformed into
```
1^10        2^11        3^12        4^9
5^14        6^15        7^16        8^13
9^2^11      10^3^12     11^4^9      12^1^10     
13^6^15     14^7^16     15^8^13     16^5^14
```
Hence, to solve this, we `xor` the 9th (in the flattened matrix) with the 2nd (in the flattened matrix). The way to calculate the element to be `xor`-ed is the same as the formula used in the original function. We solve in the order of `2, 3, 0, 1` row (0-indexed) in the matrix. 

For the `add` function, again, we can retrieve the element that correspond to a position `i, j` in the matrix by doing the same thing as the operation above. 
The `&0xFF` operation is a modulo operation. It takes the value of every entry modulo `256`.

Hence, the original matrix M is transformed into this matrix (mod 256)

```
1 + 1 * 2               2 + 2 * 2               3 + 3 * 2                   4 + 4 * 2
5 + 14 * 2              6 + 15 * 2              7 + 16 * 2                  8 + 13 * 2
9 + 11 * 2              10 + 12 * 2             11 + (9 + 11 * 2) * 2       12 + (10 + 12 * 2) * 2
13 + (8 + 13 * 2) * 2   14 + (5 + 14 * 2) * 2   15 + (6 + 15 * 2) * 2       16 + (7 + 16 * 2) * 2
```
We know that the value in the matrix before the modulo is in the range of 0 to 255, which is indeed the range of value after doing the modulo `256` operation. Hence to retrieve the original values in matrix M, we need to find the positive value which belongs in the general solution set of the congruence. 

For example, to retrieve the element at index 13 (in the flattened out matrix), we can do
```
Note that the 8, 13 here refers to index in the flattened out original matrix, not the literal value 8 and 13!

Let a = 13 + (8 + 13 * 2) * 2 (mod 256)
Let b = 8 + 13 * 2 (mod 256)

We have 2 * b - a = 13 (mod 256)
Hence we can take the result of 2 * b - a and find a positive value that is congruent to the value of 2 * b - a, and that should be the value for 13
```
The first row is special as its value got tripled. To retrieve the original value is basically solving the linear congruence `3x = a (mod 256)`. We obviously do know the value of `a`, and `0 < x < 256`, hence it's very easy to derive the only solution to the congruence equation.

After we get the reversed (inversed) version of all the functions, the only work left is to apply those function in order and run for 30 rounds to retrieve the orginal message. The script is found in the `reverse.py` file.