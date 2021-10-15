# [01 - Send_in_the_Clowns](https://deadface.ctfd.io/challenges#Send%20in%20the%20Clowns-6)

## description
```
There is a secret hidden somewhere in this image. Can you find it? Submit the flag as flag{this-is-the-flag}.

Link to Image
SHA1: 74eaae618bf508ef2715533bfdff3153dd996e89
```

### links

  * [steg02.jpg](steg02.jpg)

## walkthrough

```
$ stegseek steg02.jpg
StegSeek version 0.5
Progress: 99.87% (139737742 bytes)

[!] Could not find a valid passphrase.
```

huh. 

```
$ strings -n 10 steg02.jpg
...
<?xpacket end='w'?>
flag{s3nd_in_the_kl0wns}
jVYe<p  8?S
u1mZTy+zjy
jVBM."m8Y-
```


## flag
```
flag{s3nd_in_the_kl0wns}
```
