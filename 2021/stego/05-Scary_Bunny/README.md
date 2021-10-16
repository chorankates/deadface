# [05 - Scary_Bunny](https://deadface.ctfd.io/challenges#Scary%20Bunny-11)

## description
```
What could be inside this creepy rabbit?

Download image
SHA1: 7ab2d9b1986ae12b780d0a2124a3adce6ed4c4e1
```

### links

  * [bunny.jpg](bunny.jpg)

## walkthrough

```
$ stegseek bunny.jpg
StegSeek version 0.5
Progress: 0.00% (0 bytes)

[i] --> Found passphrase: ""
[i] Original filename: "steganopayload730241.txt"
[i] Extracting to "bunny.jpg.out"
$ cat bunny.jpg.out
flag{Carr0t}
```

## flag
```
flag{Carr0t}
```
