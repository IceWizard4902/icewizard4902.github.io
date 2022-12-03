# Flappy-js

This is a RE challenge in the web category. We have to reverse the logic of the game or find the function which produce the flag for us. Upon inspecting the page using `Sources` in the Chrome Developer Tools, we see that there is JS files in the `js` and `build` sub-directory.
This does not contain anything useful to retrieve the flag, most of it is the source code to power the game. However, looking at the `build` folder shows something very promising to the flag.

<img src="https://i.imgur.com/Ky8CaPS.png">

However, the script is flattened out so we can do some beautifying for the sake of better analysis. Beautifying the script there using the [Javascript beautifier](https://beautifier.io/)

<img src="https://i.imgur.com/jCiEwEn.png">

Scrolling through the code, we can see that this is some sort of configuration file for the game itself. After scrolling we can notice an interesting function named `genFlag` - which should be related to the generation of the flag itself. The portion of the code that contains the `genFlag` function is in the picture above.

To get the flag, we can open up the `Console` using Chrome Developer Tools, copied the definition of the function, then run it to retrieve the flag.

<img src="https://i.imgur.com/KuuH8wr.png">