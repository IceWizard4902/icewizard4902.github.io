# Entry
> Author: Nguyen Quang Vinh

The message is encrypted by `xor` the original message with the secret key. But the implementation leaks information as it `xor` 4 bytes at a time. 

We already know that the flag should begin with `grey{`, hence we can easily retrieve the message by `xor` the first 4 characters, in this case `grey` with the ciphertext and we should have the secret. 

To retrieve the flag, we use the secret, `xor` the secret with 4 bytes each from the ciphertext. The script to solve this is in the `solve.py` file.