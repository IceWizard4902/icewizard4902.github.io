# Firmware
> Author: Nguyen Quang Vinh

This is a digital forsensics challenge. We are tasked to find the file which load the firmware when a device is booting up. At first, I tried using `autopsy` to find things that are useful but after hours of trying to work it the `u-boot` format (you can see in the 3 files with the prefix of `vol2-C`) there is no way to retrieve anything useful from the three files extracted by `autopsy`. Doing `strings` does not really work (you can see in the `strings.txt`), and it only shows messages of what seems like log messages of a device booting up.

Hence, I encountered another approach to this, using `binwalk`. By doing `binwalk -e firmware.img` (automatically extract known file types), I managed to extract out what seems like a Linux file system (you can see in the folder `_firmware.img.extracted`). 

I don't really know what file to find from the hint given in the challenge, so I use a brute force approach to get the flag. Using `grep -r grey .`, which basically search for the string `grey` in the content of all the files extracted, we should be able to retrieve the flag.

<img src="https://i.imgur.com/u6Crx1k.png">