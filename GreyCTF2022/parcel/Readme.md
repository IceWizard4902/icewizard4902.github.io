# Parcel
> Author: Nguyen Quang Vinh

Using `file` to analyse the file, we do know that this should be an executable but it is packed using a packer we did not know yet. 

<img src="https://i.imgur.com/o1mdhgQ.png">

Inspecting the file using `strings`, we can easily see the `UPX!` which indicates that the file is packed using `UPX`.

<img src="https://i.imgur.com/Kz0oMzW.png">

Hence, we can unpack the file using the command `upx-ucl -d parcel`, then do `chmod +x parcel` to make the file executable. Interacting with the binary, we can see that it requires us to provide the value of the address of the three functions 

<img src="https://i.imgur.com/y4691dN.png">

Using `gdb`, we can find the address of the functions by using `disas <FUNCTION>`

<img src="https://i.imgur.com/3TodGrh.png">