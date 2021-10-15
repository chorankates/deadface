# [04 - File_101](https://deadface.ctfd.io/challenges#File%20101-17)

## description
```
An email, containing a photo of pumpkin, was found in an employee's Gmail inbox. The photo looks normal, but looks can be deceiving sometimes. What secrets could it be holding?

Download image
SHA1: fbaa1ba13058c8c85281775ed9865f29fc9b820c
```

### links

  * [2311432@.jpg](2311432@.jpg)

## walkthrough

stegseek? no

```
$ stegseek '2311432@.jpg'
StegSeek version 0.5
Progress: 99.37% (139039298 bytes)

[!] Could not find a valid passphrase.
```

```
$ file -k '2311432@.jpg'
2311432@.jpg: JPEG image data, JFIF standard 1.01, resolution (DPI), density 96x96, segment length 16, Exif Standard: [TIFF image data, big-endian, direntries=2\012-  (Lepton 2.x), scale 0-0, spot sensor temperature 0.000000, unit celsius, color scheme 0, calibration: offset 0.000000, slope 0.000000], progressive, precision 8, 1920x1280, components 3\012- data

```

```
$ bw '2311432@.jpg'

Scan Time:     2021-10-15 14:13:56
Target File:   /home/conor/git/ctf-meta/deadface/2021/forensics/04-File_101/2311432@.jpg
MD5 Checksum:  fc0194f90ba96e582582f3b4e0091dff
Signatures:    411

DECIMAL       HEXADECIMAL     DESCRIPTION
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
0             0x0             JPEG image data, JFIF standard 1.01
30            0x1E            TIFF image data, big-endian, offset of first image directory: 8
```

nope, nothing there..

strings?

```
...
"https://www.dropbox.com/s/io1kaqznal2c10y/corrupted.zip?dl=0"
```

that gets us [corrupted.zip](corrupted.zip), which Dropbox says contains a PNG.. so zsteg - but the zip is password protected - so john, then zstego

```
$ zip2john corrupted.zip > corrupted.hash
$ john_rockyou corrupted.hash
Using default input encoding: UTF-8
Loaded 1 password hash (PKZIP [32/64])
Will run 16 OpenMP threads
Press 'q' or Ctrl-C to abort, almost any other key for status
pumpkinpie       (corrupted.zip/FOR0x.png)
1g 0:00:00:00 DONE (2021-10-15 14:16) 50.00g/s 1638Kp/s 1638Kc/s 1638KC/s 123456..dyesebel
Use the "--show" option to display all of the cracked passwords reliably
Session completed.

real    0m0.284s
user    0m3.379s
sys     0m0.024s
$ zsteg FOR0x.png 
[!] #<ZPNG::NotSupported: Unsupported header "..xx\x00\x10jf" in #<File:FOR0x.png>>
```

in `strings` output, see `jfif` and `Exif`, which sounds like a JPG file, with corrupt magic. per [List of file signatures](https://en.wikipedia.org/wiki/List_of_file_signatures), JFIF should start with  .. well, a couple things.

  * `FF D8 FF EE `
  * `FF D8 FF E1 ?? ?? 45 78 69 66 00 00`

we do see 69 66 00 .. then 01, so let's assume that's the target. 

```
$ file FOR0x_hexed.png 
FOR0x_hexed.png: JPEG image data, Exif standard: []
```

looking at the image "FOR0X.png - It looks like we don't support this format."

then the flag in the lower right.


## flag
```
flag{Easy_Right}
```
