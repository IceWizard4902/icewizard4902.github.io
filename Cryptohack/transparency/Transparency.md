# Transparency

We are given a public RSA key that is used in the X509 certificate for the HTTPS connection to a Cryptohack domain. 

I solve it in the easy way, and uses a subdomain lookup site. A good one to use is `crt.sh`, and the query is [https://crt.sh/?q=cryptohack.org](https://crt.sh/?q=cryptohack.org), or [https://subdomains.whoisxmlapi.com/](https://subdomains.whoisxmlapi.com/). We can go over the list of subdomains to find the correct subdomain for the solution.

We can instead solve this without using this comprehensive list of subdomains. `crt.sh` does provide search by certificate fingerprint, but we cannot use this service since we are only given the public key and not the full certificate. 

Instead, we will use [https://search.censys.io/certificates](https://search.censys.io/certificates), which does also index the SHA256 fingerprint of the `subject key info` field in the X509 certificate - the public key.

The SHA256 fingerprint is simply the SHA256 hash of the DER representation of the public key, so a simple command through `openssl` should give us what we need.

```shell
openssl pkey -outform der -pubin -in transparency.pem | sha256sum
```

From the output, we can query on the `censys.io` site, and we arrive at the certificate we are interested in, including the CN field - the subdomain. The result is available at [https://search.censys.io/certificates?q=29ab37df0a4e4d252f0cf12ad854bede59038fdd9cd652cbc5c222edd26d77d2](https://search.censys.io/certificates?q=29ab37df0a4e4d252f0cf12ad854bede59038fdd9cd652cbc5c222edd26d77d2).

Credits to `Robin_Jadoul` on Cryptohack for the content above.