# Equation

The task in here is straightforward, solve the two equations to get the value of `m1` and `m2`. There is straightforward and nicer solution (kudos to `Connor579` on the GreyCTF Discord) in the `nicer_solve.sage` file. Unfortunately, I did not know how to use Sage properly, as I do not find good answers from Google answering my queries about "solving the system of polynomials using Sagemath", so I try to come up with a different solution to this. Solution to `Equations-2` can be found in jontay999 writeup at this [link](https://github.com/jontay999/CTF-writeups/blob/master/GreyCTF%202022/Crypto/equation2.md) or in the `nicer_solve2.sage` (kudos to `joseph` on the GreyCTF Discord).

My approach is to start from the smallest guest possible (numerically), since the smallest printable ASCII character is `!`, my base guess is a flag containing all `!`. I can find the length of the flag by keep adding more `!` until the length of the result of both the equations matches the length of the given result. Doing this, I can find the possible length range of the flag, then later I can modify this "dummy" flag to different values of flag length to see if there is any result.

To determine if we are close to the targets (the values of the two equations) or not, we have a `verify-flag` function. The function first calculates the values of the 1st and 2nd equation with the flag specified in the parameter. Then, it matches from the most to least significant digits the number of characters that are matching from the targets and the two results calculated earlier. The more characters matched, the closer we are in getting the actual flag. The result is returned in the form of `<1ST EQUATION RESULT>, <2ND EQUATION RESULT>`. This is simply because the highest power in the 2nd equation is 5, which is lower than that of the 1st equation, which is 7. This means that the 2nd equation will be less sensitive to the result of the 1st equation, hence it is used just for tie-breaking, and mainly the result are compared using the 1st equation result.

To retrieve the flag, we do it with an intuition of "after each guess, the result should be improving and not worsening". This is based on the fact that the value of `m1` and `m2` should be strictly increasing, as there is no smaller string (in terms of ASCII value) than a string populated with all `!`. Both the equations' values are increasing as `m1` and `m2` increases. Hence, we need to adjust the values of `m1` and `m2` to increase if the values in the equations are smaller than the target, and decrease if the values in the equations are greater. I can do the implementation in this way, but due to the unreasonable fear of weird rounding errors when Python deals with huge number (which is not true), I stray away from this approach and instead uses a more roundabout way (but still somewhat based on that intuition). 

Solution Implementation:
```python
from Crypto.Util.number import bytes_to_long

FLAG = b'grey{!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!}'

n = len(FLAG)
print(n)
m1 = bytes_to_long(FLAG[:n//2])
m2 = bytes_to_long(FLAG[n//2:])


a = "6561821624691895712873377320063570390939946639950635657527777521426768466359662578427758969698096016398495828220393137128357364447572051249538433588995498109880402036738005670285022506692856341252251274655224436746803335217986355992318039808507702082316654369455481303417210113572142828110728548334885189082445291316883426955606971188107523623884530298462454231862166009036435034774889739219596825015869438262395817426235839741851623674273735589636463917543863676226839118150365571855933"
b = "168725889275386139859700168943249101327257707329805276301218500736697949839905039567802183739628415354469703740912207864678244970740311284556651190183619972501596417428866492657881943832362353527907371181900970981198570814739390259973631366272137756472209930619950549930165174231791691947733834860756308354192163106517240627845889335379340460495043"

def verify_flag(flag):
    m1 = bytes_to_long(flag[:n//2])
    m2 = bytes_to_long(flag[n//2:])
    temp = str(13 * m2 ** 2 + m1 * m2 + 5 * m1 ** 7)
    count_a = 0
    for i in range(len(a)):
        if a[i] == temp[i]:
            count_a += 1
        else:
            break 
    
    count_b = 0
    for i in range(len(a)):
        if a[i] == temp[i]:
            count_b += 1
        else:
            break 
    return count_a, count_b

def solve_flag(flag, index, record):
    if index == n - 1:
        return [flag]

    candidate_max_flags = []
    candidate_max_count = (0, 0)

    for i in range(33, 127):
        possible_flag_prefix = flag[:index] + str(chr(i)).encode() + flag[index + 1:]
        count = verify_flag(possible_flag_prefix)
        if count > record:
            possible_flags = solve_flag(possible_flag_prefix, index + 1, count)
            if possible_flags:
                for possible_flag in possible_flags:
                    count = verify_flag(possible_flag)
                    if count > candidate_max_count:
                        candidate_max_flags = [possible_flag]
                        candidate_max_count = count
                    elif count == candidate_max_count: 
                        candidate_max_flags.append(possible_flag)
    
    return candidate_max_flags


print(solve_flag(FLAG, 5, verify_flag(FLAG)))
# 13 * m2 ** 2 + m1 * m2 + 5 * m1 ** 7 == 6561821624691895712873377320063570390939946639950635657527777521426768466359662578427758969698096016398495828220393137128357364447572051249538433588995498109880402036738005670285022506692856341252251274655224436746803335217986355992318039808507702082316654369455481303417210113572142828110728548334885189082445291316883426955606971188107523623884530298462454231862166009036435034774889739219596825015869438262395817426235839741851623674273735589636463917543863676226839118150365571855933
# 7 * m2 ** 3 + m1 ** 5 == 168725889275386139859700168943249101327257707329805276301218500736697949839905039567802183739628415354469703740912207864678244970740311284556651190183619972501596417428866492657881943832362353527907371181900970981198570814739390259973631366272137756472209930619950549930165174231791691947733834860756308354192163106517240627845889335379340460495043
```

We implement the guess function in somewhat "recursive" manner, guessing the characters at every index in the flag. The value of the flag we will be working on is the value passed from another call to the solve function earlier, containing the flag prefix. To narrow down the search space, the flag prefix should "improve" the guess, that is to improve the `count` metric. If `count` is not greater than the `record` from the earlier call, we are straying away from the correct flag, hence we should not use the prefix. If it is greater than the `record`, we use that prefix for the `flag` parameter in next call of the solve function, guessing the character at the next index of the flag string. 

If there are results (`possible_flag`) being returned from the function call, we can run the evaluation function `verify_flag` again to get the guesses with the highest value. Then the possible flags are returned for the parent functions to use and evaluate against all the results from the other functions which use a different prefix.

The result from the function should be the flag, but we need to adjust the flag length to the three values as we do not really know the length of the flag itself. The correct length for the flag is `59`, and running the script with that length should give us the flag. 

This approach unfortunately does not work with the second challenge due to the nature of congruence function, we cannot really derive a relation between the increase/decrease of `m1` and `m2` and the result of the congruence equation.