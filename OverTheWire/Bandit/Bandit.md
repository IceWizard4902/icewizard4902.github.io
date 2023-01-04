<p align="center" width="100%">
    <img width=30% src="https://i.imgur.com/TM2Myls.png">
</p>

<div align="center">
  <h1>Bandit</h1>
</div>

The [Bandit](https://overthewire.org/wargames/bandit/) wargame is aimed at absolute beginners. It will teach the basics needed to be able to play other wargames.

# Bandit 0 

A few problem with connecting to a legacy ssh server, but can be rectify by using

`ssh -p 2220 bandit0@bandit.labs.overthewire.org -oHostKeyAlgorithms=+ecdsa-sha2-nistp256`

After getting on the server, we can just simply do `cat readme`

bandit1: `NH2SXQwcBdpmTEzi3bvBHMM9H66vVXjL`

# Bandit 1

Trickier, as there is a problem with opening a file with a "-"
This type of approach has a lot of misunderstanding because using - as an argument refers to STDIN/STDOUT i.e dev/stdin or dev/stdout .So if you want to open this type of file you have to specify the full location of the file such as ./- .For eg. , if you want to see what is in that file use `cat ./-`

bandit2: `rRGizSaX8Mk1RTb1CNQoXTcYZWU6lgzi`

# Bandit 2

Escaping the space by using `\`, or can simply do by typing `cat spa` then let the terminal autocomplete by using Tab.

bandit3: `aBZ0W5EmUfAf7kHTQeOwd8bauFJ2lAiG`

# Bandit 3

God command `ls -slah`. Trivial from knowing this.

bandit4: `2EW7BBsr6aMMoJ2HjW067dm8EgX26xNe`

# Bandit 4

After getting into the `inhere` folder, we can simply do `file ./*` to get the information of all the files. The correct file should display "ASCII Text" in the result.

bandit5: `lrIWWI6bB37kxfiCQZqUdOIYfr6eEeqR`

# Bandit 5

Simply doing `find . -size 1033c` is sufficient. A better solution (on Stackoverflow) is `find . -type f -size 1033c ! -executable -exec file {} + | grep ASCII`

bandit6: `P4L4vucdmLnm8I7Vl7jG1ApGSfjYKqJU`

# Bandit 6

Same idea as Bandit 6. Doing `find / -user bandit7 -group bandit6 -size 33c 2>/dev/null` is sufficient, as we have to look for files in the whole server. Redirecting all the error output to `/dev/null` so that the output of the `find` looks a bit cleaner.

bandit7: `z7WtoNQU2XfjmMtWA8u5rN4vzqu4v99S`

# Bandit 7

Doing `grep data.txt "millionth"` is sufficient. `grep` displays the context of the string found.

bandit8: `TESKZC0XvTetK0S9xNwm25STk5iWrBvP`

# Bandit 8

The entries in the file has to be sorted. `cat file | sort | uniq -u` does the job. 

From the `man` page of `uniq`: Filter adjacent matching lines from INPUT (or standard input), writing to OUTPUT (or standard output).

bandit9: `EN632PlfYiZbn3PhVK3XOGSlNInNE00t`

# Bandit 9

We have to find in the space of ASCII characters, hence we have to use `strings`. Using `grep` to filter out the guys actually have some `=` preceding some strings. 

Command is `trings data.txt | grep -E "={1,}"`

`"={1,}"` means that we match any strings that has `=` repeated 1 or more times.

bandit10: `G7w8LIi6J3kTb8A7j9LgrywtEUlyyp6s`

# Bandit 10

Classic decoding using `base64 -d`. 

bandit11: `6zPeziLdR2RKNdNYFNb6nVCKzphlXHBM`

# Bandit 11

Decoding ROT13: `tr 'A-Za-z' 'N-ZA-Mn-za-m'`

Yanked from StackOverflow: 

Each character in the first set will be replaced with the corresponding character in the second set. E.g. A replaced with N, B replaced with O, etc.. And then the same for the lower case letters. All other characters will be passed through unchanged.

bandit12: `JVNBBFSmZwKKOP0XbFXOoW8chDz5yVRv`

# Bandit 12

File is from `hexdump`, you can get the original binary file by doing `xxd -r > OUTPUT_FILE`

Then do a chain of inspecting file by running `file`, change the extension using `mv`, then decompress the file according to the result from `file`

bandit13: `wbWdlBxEir4CaE8LaPhauuOo6pwRmrDw`

# Bandit 13

Private key is available on the home folder. `sshkey.private` is the private key to log in as the user `bandit14` on the local `ssh` instance. 

Command to connect: `ssh bandit14@localhost -i sshkey.private -p 2220`

bandit14: `fGrHPx402xGC7U7rXKDaxiWFTOiF0ENq`

# Bandit 14

A `nc` instance to connect to `localhost` at host `30000`. Nothing is displayed, but from the instructions we have to key in the password for Bandit 14. After that, the password for Bandit 15 pops up.

bandit15: `jN2kgmIXJ6fShzhT2avhotn4Zcka6tnt`

# Bandit 15

Nothing special, run `openssl s_client -connect localhost:30001 -ign_eof`, key in the password from Bandit 14 and we should get the password.

bandit16: `JQttfApK4SeyHwDlI9SXGR50qclOAil1`

# Bandit 16

For some reason, this level is a bit buggy. You will encounter some error of "shell request failing on channel 0" or if you managed to get in using `ssh`, it would display the error of "-bash: fork: retry: Resource temporarily unavailable". For me, to resolve this, I just log in multiple times. `ssh` should be somewhat usable after a few tries. This might be due to people, after solving the level, did not manage to find a way to proceed to the next levels without doing `ssh` on Bandit 16. 

First, to find all the service/information behind the ports from 31000 and 32000, we can use `nmap -sC localhost -p31000-32000`. `-sC` will run the default script in `nmap`. 

Then, after looking at the result, we will have two ports that speak SSL: `31518` and `31790`.

Connecting to the two ports, using `openssl s_client -connect localhost:PORT -ign_eof` and type the password from Bandit 16, we will observe that the service at port `31518` will echo anything that we type in, but `31790` will produce something resembling a private key.

We then retrieve the password for Bandit 17 by doing `cat /etc/bandit_pass/bandit17`. This is a step that most will miss, as this is nowhere near obvious from all the hints given.

bandit17: `VwOSWtCA7lRKkTfbr2IDh6awj9RNZM5e`

# Bandit 17

Running `diff` on the 2 password files should give the key to the next level. 

bandit18: `hga5tuuCLF6fFzUpnagiMN8ssu9LFrdg`

# Bandit 18

`.bashrc` configuration logs us out when we log in using `ssh`. One solution is not to use the `bash` shell and use a different shell to avoid the `.bashrc` configuration. 

`ssh` have a `-t` flag to execute arbitrary screen-based programs on a remote machine, hence we can execute any command. More concisely, `-t` forces a pseudo-tty allocation. 

Hence, a solution might be: 

`ssh bandit18@bandit.labs.overthewire.org -p 2220 -oHostKeyAlgorithms=+ecdsa-sha2-nistp256 -t 'sh'`

or in a more straightforward way:

`ssh bandit18@bandit.labs.overthewire.org -p 2220 -oHostKeyAlgorithms=+ecdsa-sha2-nistp256 -t 'cat readme'`

bandit19: `awhqfNnAbc1naukrpqDYcF95h7HoMTrC`

# Bandit 19

Find SUID binary by doing `find / -perm -u=s -type f 2>/dev/null`

We can find a SUID binary in our home folder `./bandit20-do`. Running it without any arguments shows instructions of 

```
Run a command as another user.
  Example: ./bandit20-do id
```

The "another user" mentioned here is `bandit20`, due to how SUID works.

Running `./bandit20-do cat /etc/bandit_pass/bandit20` should give us password to the next level. 

Optional: running `./bandit20-do bash -p` to inherit the `bandit20` user. From the `man` page, if the -p option is supplied at invocation, the startup behavior is the same, but the effective user id is not reset.

bandit20: `VxCazJaVykI6W36BkBU0mJTCM8rR95XT`

# Bandit 20

The `./suconnect` SUID binary connect to a TCP port that we specify. By using `tmux`, we can split the terminal in half (duh) and on one side execute `nc -lvnp 4444` to listen to a TCP connection at port 4444. On the other window of `tmux`, we can do `./suconnect 4444` to connect to the `nc` instance.

Once a connection is established (the `nc` side should display something like "Connection received on 127.0.0.1 40140"), we can key in the password for Bandit 20 to get the password of Bandit 21.

bandit21: `NvEJF7oVjkddltPSrdKEFOllh9V1IBcq`

# Bandit 21

Only the cronjob in the file `cronjob_bandit22` has something interesting. Others are for system logging capabilities, or inaccessble.

We can observe a cronjob running regularly (at every minute) running a shell script at `/usr/bin/cronjob_bandit22.sh`. Running the script at that location shows an error of 

```
chmod: changing permissions of '/tmp/t7O6lds9S0RqQh9aMcz6ShpAoZKF7fgv': Operation not permitted
/usr/bin/cronjob_bandit22.sh: line 3: /tmp/t7O6lds9S0RqQh9aMcz6ShpAoZKF7fgv: Permission denied
```

Inspecting the bash script at `/usr/bin/cronjob_bandit22.sh`

```
chmod 644 /tmp/t7O6lds9S0RqQh9aMcz6ShpAoZKF7fgv
cat /etc/bandit_pass/bandit22 > /tmp/t7O6lds9S0RqQh9aMcz6ShpAoZKF7fgv
```

Hence, this get the password from `bandit22` and put it into the file at `/tmp/t7O6lds9S0RqQh9aMcz6ShpAoZKF7fgv`. The file has permission of 644, hence it is world readable.

bandit22: `WdDozAdTM2z9DiFEQ2mGlwngMfj4EZff`

# Bandit 22

Again, only `/etc/cron.d/cronjob_bandit23` can be read. Inspecting the content of the cronjob:

```
@reboot bandit23 /usr/bin/cronjob_bandit23.sh  &> /dev/null
* * * * * bandit23 /usr/bin/cronjob_bandit23.sh  &> /dev/null
```

The user `bandit23` will execute the shell script at `/usr/bin/cronjob_bandit23.sh` after reboot and every minute. Inspecting the content of `/usr/bin/cronjob_bandit23.sh`:

```
#!/bin/bash

myname=$(whoami)
mytarget=$(echo I am user $myname | md5sum | cut -d ' ' -f 1)

echo "Copying passwordfile /etc/bandit_pass/$myname to /tmp/$mytarget"
```

What the script is doing is first put the username into the variable `myname`, then use `myname` to obtain `mytarget`. The content of the password is stored at `/tmp/$mytarget`. We know that `myname` is `bandit23` (since `bandit23` is executing the cronjob), hence we can generate the target of the script `mytarget` by simply doing `echo I am user bandit23 | md5sum | cut -d ' ' -f 1`. 

This gives the result of `mytarget`, and the file we are looking for is at `/tmp/8ca319486bfbbc3663ea0fbe81326349`

bandit23: `QYw0Y2aiA672PsMmh9puTQuhoz8SyR2G`

# Bandit 23

Same procedure as Bandit 21 and 22, we try to get the content of the script in the cronjob.
What the script in the cronjob does is obvious, it tries to execute all the scripts in the `/var/spool/bandit24/foo` folder. We will create a temporary folder to store the result of the script by doing `mkdir /tmp/kdkdkd`

`vim test.sh` to make the script. The script will look like this:

```
#!/bin/bash
cat /etc/bandit_passs/bandit_24 > /tmp/kdkdkd/pass
```

This should be relatively straightforward. However, for some reason the script does not run if the `pass` file does not exist. This may be due to some permission error (as may be the user `bandit24` is not able to make a new file in the folder `/tmp/kdkdkd` of `bandit23`). Hence we need to do `touch /tmp/kdkdkd/pass` followed by `chmod 666 /tmp/kdkdkd/pass` to allow everyone to write to the `pass` file.

After a minute, doing `cat pass` will provide the password for the next level.

bandit24: `VAfGXJ1PBSsPSnvsjI8p759leLZ9GGar`

# Bandit 24
Some interesting things to remember:

`seq -f "%0${PADDING}g" $MIN $MAX` gives a sequence of 4-digit strings with the given padding (4) from `MIN` to `MAX`

If we want to send messages in batch in bash script, with every message on a new line. Redirecting this into `nc` will provide us effectively the result of executing each message one by one.

`awk '!/{STRING_IN_HERE}/'` print out every line that does not have `STRING_IN_HERE`. We can sort out the result after running `nc`, as most likely the line that contains the password for the next level does not contain the message when we key in the wrong password. "Wrong!" is one such string in the wrong password message.

String concatenation of variable `a` and `b` is `$a$b`

To run the script, do `mkdir /tmp/qvinh`, then `cd /tmp/qvinh` (any name for the folder in `/tmp` works). Open `vim` or any text editor then copy the code underneath. Remember to `chmod +x` the shell script.

```
#!/bin/bash

PASS="VAfGXJ1PBSsPSnvsjI8p759leLZ9GGar "

MIN=0
MAX=9999
PADDING=4

touch test.txt
for i in $(seq -f "%0${PADDING}g" $MIN $MAX); do
GUESS="$PASS$i"
echo $GUESS >> test.txt
done

nc localhost 30002 < test.txt | awk '!/Wrong!/'
rm test.txt
```

bandit25: `p7TaowMYrmu23Ol8hiZh9UvD0O9hpx8d`

# Bandit 25
`ssh` to bandit26 (using the private key in bandit25 home folder) only kicks us out after showing the banner, and from the hints there is some interesting shell used. 

We can view the default shell of a user by viewing the `/etc/passwd` file. Indeed, we can get the shell that the user bandit26 by doing `cat /etc/passwd | grep bandit26`. The "shell" of the bandit26 user is located at `/usr/bin/showtext`. Getting the content of the script

```
#!/bin/sh

export TERM=linux

more ~/text.txt
exit 0
```

The script is opening the file `text.txt` with `more`. After doing so, the shell immediately exited. The text in `text.txt` is very short, meaning the whole text can immediately be displayed. more does not need to go into command/interactive mode. If we make the terminal window smaller, more will go into command mode. We can then press `v` to go into vim. Now we can rescale the window. This is quite a insane trick to know.

After getting into `vim` (from the $EDITOR variable of bandit26), we can get the content of the password by doing `:e /etc/bandit_pass/bandit26` or can pop a shell by doing `:set shell= /bin/bash`, and then use `:shell`.

bandit26: `c7GvcKlw9mC7aUQaPx7nwFstuAIBw1o1`

# Bandit 26

Same trick as Bandit 25. Resize the terminal so that `more` has to enter interactive mode, then set the shell to `/bin/bash`, open the shell by doing `:shell`. 

Upon getting a shell, we do `ls -slah` and see the SUID binary `bandit27-do`. Doing `./bandit27-do cat /etc/bandit_pass/bandit27` should give us the password for the next level.

bandit27: `YnQpBuifNMas1hcUFk70ZmqkhUU2EuaS`

# Bandit 27

Make a folder in `/tmp`, then `cd` to that folder. We know the location of the git repo to clone, but we need to change the address a little bit as the `ssh://` will default to port 22, not the intended port 2220.

Command will be `git clone ssh://bandit27-git@localhost:2220/home/bandit27-git/repo`

Also, shorthand for create a directory in `/tmp` is `mktemp -d`.

bandit28: `AVanL161y9rsbcJIsFHuw35rjaOM19nR`

# Bandit 28 

Same trick as Bandit 27 again, we first clone the repo by doing `git clone ssh://bandit28-git@localhost:2220/home/bandit28-git/repo`.

Viewing the content of the file inside the folder `repo`, we can see that the `README.md` file got the password removed. There are no other files in the folder, hence we can view the commit history by doing `git log`. 

```
commit 43032edb2fb868dea2ceda9cb3882b2c336c09ec (HEAD -> master, origin/master, origin/HEAD)
Author: Morla Porla <morla@overthewire.org>
Date:   Thu Sep 1 06:30:25 2022 +0000

    fix info leak

commit bdf3099fb1fb05faa29e80ea79d9db1e29d6c9b9
Author: Morla Porla <morla@overthewire.org>
Date:   Thu Sep 1 06:30:25 2022 +0000

    add missing data

commit 43d032b360b700e881e490fbbd2eee9eccd7919e
Author: Ben Dover <noone@overthewire.org>
Date:   Thu Sep 1 06:30:24 2022 +0000

    initial commit of README.md
```

Seems like the second commit (in chronological order) is adding some data that is removed in the third and final commit that we have. This infers that the password might be at the second commit, and hence to retrieve the password we can revert the git repo back to the state after the second commit by doing `git reset --hard bdf3099fb1fb05faa29e80ea79d9db1e29d6c9b9`

Another, less intrusive solution is doing `git show bdf3099fb1fb05faa29e80ea79d9db1e29d6c9b9`

bandit29: `tQKvmcwNYcFS6vmPHIUSI3ShmsrQZK8S`

# Bandit 29

`git` refresher: `git branch -a` to list all branches and `git checkout <branch>` to move to a new branch.

There is nothing interesting in the commit history, as no changes related to the password of Bandit 30 is in either the two logs after running `git log`. From the hint, the password is not in production, so it must be in one of the branches of this repo.

Indeed, after listing all the branches, we can see that there is a `dev` branch of this repo. Checking out to that branch, and do `cat README.md` should give us the password.

bandit30: `xbhV3HpNGlTIdnjUrdAlPzc2L6y9EOnS`

# Bandit 30

The password is not in the `git log`, nor the `git branch -a` (as only one branch exists). We can find it in the tags of the repo by doing `git tags`. There is a tag named `secret`. Tag data can be viewed by doing `git show secret`

Found this out by doing `git --help` and try every ways that the password can be hidden.

bandit31: `OoffzGDlzhAlerFJ2cAiz1D41JW1Mhmt`

# Bandit 31

The current branch of the repo is `master` (by using `git branch` we can verify this). Hence, our task is just to create a file `key.txt` with the content specified in the `README.md`. However, when we try to commit the new file, it shows that the working tree is clean (?)

```
bandit31@bandit:/tmp/tmp.uV8SPS9VHn/repo$ git branch
* master
bandit31@bandit:/tmp/tmp.uV8SPS9VHn/repo$ echo "May I come in?" > key.txt
bandit31@bandit:/tmp/tmp.uV8SPS9VHn/repo$ git stage .
bandit31@bandit:/tmp/tmp.uV8SPS9VHn/repo$ git commit -m "Test"
On branch master
Your branch is up to date with 'origin/master'.

nothing to commit, working tree clean
```

There must be something interesting in here. Doing `ls -slah` shows a hidden `.gitignore` file. From the content of the `gitignore`, Git will ignore all the files with the extension of `.txt`. To be able to commit addition of the files with `.txt`, we need to remove the first line of `.gitignore` (`*.txt`).

Then do `git add .`, `git commit -m "Test"`, `git push origin` we will be able to retrieve the password.

bandit32: `rmCBvG56y58BXzv98yZGdO7ATVL5dW8y`

# Bandit 32

Neat trick. `$0` expands to the name of the shell or shell script. This is set at shell initialization. This means that whatever is called to obtain the shell is stored in `$0`. This is useful as any command with ASCII characters are all converted in uppercase, and thus will become invalid. Typing `$0` to the `uppershell` should execute `sh`. 

bandit33: `odHo63fHiFqcWWJG9rLiLDtPm45KzUKy`

# Bandit 33

Nothing here yet. But we can verify the answer in Bandit 32 by logging in. Getting the content of the last `README.md`

<img src="https://i.imgur.com/ObURK29.png">

This is quite a certificate of participating in this wargame. I learn a lot of the concepts and some cool neat tricks. Worth my 2 days of ditching assignments to attempt these!
