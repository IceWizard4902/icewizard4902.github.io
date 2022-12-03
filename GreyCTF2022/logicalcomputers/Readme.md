# Logical Computers
> Author: Nguyen Quang Vinh

`Aliencaocao` from Hwa Chong has an awesome, and in my opinion, more "intended" solution. You can check out his writeup at this [link](https://github.com/aliencaocao/GreyCTF-2022/tree/master/Logical%20Computers). My solution does not really involve the Math like his, but it is based on an intuition that I have doing a bit of work in AI/ML in general.

We can see that the network consists of two linear layers, and have a step activation function in between. This, combined with the fact that there's only one flag to any challenge in the CTF, suggest that for the classifier to output a `1` (which is the condition to get the flag), we have to guess correctly the character in each position of the flag. This may seem very obvious, but it is the key observation to establish to solve the challenge. The network's parameters are loaded from the `model.pth` file.

<img src="https://i.imgur.com/5f0XgVh.png">

The `tensorize` function converts any character in the string into a 8-bit format. That, combined with the fact that the model requires the input size dimension to be `160`. We can very easily verify this by typing in a random character like "A", and an error of `RuntimeError: Error(s) in loading state_dict for NeuralNetwork: size mismatch for layer1.weight: copying a param with shape torch.Size([1280, 160]) from checkpoint, the shape in current model is torch.Size([1280, 8])` should come up. This suggests that the length of the flag is `160 / 8 = 20` chars long. Hence, we can easily have a dummy flag of `grey{~~~~~~~~~~~~~~}`. This dummy value can be whatever we want, as long as it is 20 characters long.

We noticed that there is a `step_activation` function at the end before outputting, and this obviously destroys much of the information from the Linear layer earlier (as it converts any value greater than 0 to 1 and values smaller than 0 to 0), hence in the solution we can remove that to retain more information in our search.

From the observation earlier, we have to guess correctly the characters of every position in the flag string. My evaluation (or intuition here) is that for each index in between the two `{}` sign, the closer we are to the real `ASCII` value of the character of the flag in that index, the closer to 0 the value after `layer2` of the network becomes. We can easily verify this by modifying the `~` to any `ASCII` character just after the `{` in the flag to see. In general, the closer we are (in terms of ASCII values of the characters), the higher the value after the `layer2` Linear layer. Note that closer here means that every character in other positions (the ones we are not guessing currently) are not modified. This is crucial as it ensures that the comparison makes sense, we can't really compare strings that are different from each other in different positions. For the comparison to make sense, every other character should stay constant aside from the character we are guessing.

Hence, my approach is that, for each index in the flag, we iterate through all printable `ASCII` characters `(33 - 128)`, plug the guess at that position into the model. The character that yield the highest value after plugging into the model should be the flag character at that specific position. We do that for every character index in the flag. The script is in the `solve.py` file.