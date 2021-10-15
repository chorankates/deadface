# [02 - Behind_the_Curtain](https://deadface.ctfd.io/challenges#Behind%20the%20Curtain-5)

## description
```
This image was intercepted from Ghost Town. We think Donnell has hidden information here, but there doesn't seem to be anything special about the image. Can you help find the hidden information? Submit the flag as flag{this-is-the-flag}.

Link to Image
SHA1: 29141eea42be29f8fa28a9a1cc5e5118e63577b2
```

### links

  * [steg01.jpg](steg01.jpg)

## walkthrough

```
$ stegseek steg01.jpg
StegSeek version 0.5
Progress: 99.84% (139698474 bytes)

[!] Could not find a valid passphrase.
```

another not stegseek?

```
$ bw steg01.jpg

Scan Time:     2021-10-15 14:48:39
Target File:   /home/conor/git/ctf-meta/deadface/2021/stego/02-Behind_the_Curtain/steg01.jpg
MD5 Checksum:  e194b3083afde9eb8761f61463760462
Signatures:    411

DECIMAL       HEXADECIMAL     DESCRIPTION
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
0             0x0             JPEG image data, JFIF standard 1.01
30            0x1E            TIFF image data, big-endian, offset of first image directory: 8
13266         0x33D2          JPEG image data, JFIF standard 1.01
13296         0x33F0          TIFF image data, big-endian, offset of first image directory: 8
```

`33D2` is the same image as `0`, but with the flag overlayed

## flag
```
flag{L3t_m3_in}
```

