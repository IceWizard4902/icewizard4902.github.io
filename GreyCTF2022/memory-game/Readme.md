# Memory Game (Part 1)
> Author: Nguyen Quang Vinh

This challenge is about finding where the image assets are stored. We can extract the original structure of the `apk` file by using `apktool d memory-game.apk`. We get the data that is in the sub-directories `assets`, `original`, `res` and `smali` of this folder.

It is more likely that the picture is stored in the `assets` folder. We can manually search all the folders to check the content of each image there to see if it contains the flag. Or there is a nicer solution which involves a bit of guessing - we guess that the name of the file containing the flag should be in the form of `flag.`, so we can use `find` to find the location of the file. Opening that location should give us the content of the flag.

<img src="https://i.imgur.com/LTxxS5H.png">