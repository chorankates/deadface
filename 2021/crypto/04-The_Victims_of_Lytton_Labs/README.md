# [04 - The_Victims_of_Lytton_Labs](https://deadface.ctfd.io/challenges#The%20Victims%20of%20Lytton%20Labs-8)

## description
```
Using the LYTTON LABS Packet Capture file (pcap-challenge-final.pcapng) from LYTTON LABS 01, find the tool and the password to decrypt the encrypted files.
```

## walkthrough

presumably this uses `75AC98147C07752767E09EF781CF998E401D19B01E30CBAA5109D6AD7EC9A174`, the contents of
```
RETR /SECRET/encryption-password-cgeschickter.txt
```

but what files are we decrypting?

LCR files - "lytton crypt"?

```
 ./lytton-crypt.bin
Usage is: ./lytton-crypt.bin -[orc][-sN] file1 file2..
  -o Write output to standard out
  -r Do NOT remove input files after processing
  -c Do NOT compress files before encryption
  -sN How many times to overwrite input files with random data

$ ./lytton-crypt.bin -rc foo.txt
Encryption key:
Again:
$ ls -l foo.*
-rw-rw-r-- 1 conor conor 10 Oct 16 13:59 foo.txt
-rw-rw-r-- 1 conor conor 74 Oct 16 14:00 foo.txt.lcr
```

ok, so we're on the right track - but need to decrypt, not encrypt.

what happens if we re-encrypt the same file?

```
$ cat foo.txt
foobarbaz
fizzbuzzbang
$ cat foo.txt.lcr
T^@^L&M-^T|M-+_5=M-^K'M-!M-jTq^M,M-^RM-^C}M-#)M-AM-u8qM-^R`NvM-AM-*^\>JM-n^?M-^JM-*M-^@6~~M-n^P#M-.M-^^]fM-^]M-v}M-^I1M-vM-RF   M-^?^S^D:M-<G.nM- ~^D~72^EM-?M-il^U^VoM-}
conor@pride:~/git/ctf-meta/deadface/2021/crypto/04-The_Victims_of_Lytton_Labs[chorankates/deadface|main|9c715c8|CU]
 2:09.20 [11401] $ ./lytton-crypt.bin -orc foo.txt.lcr
Encryption key:
foobarbaz
fizzbuzzbang
```

bingo bango. extract all the LCR files and then try his key

```
$ find . -iname '*.lcr' -exec ./lytton-crypt.bin -orc {} \;
Encryption key:
Invalid encryption key for file: ./donald-m.txt.lcr
Encryption key:
Invalid encryption key for file: ./terry-i.txt.lcr
Encryption key:
Invalid encryption key for file: ./david-k.txt.lcr
Encryption key:
Invalid encryption key for file: ./brittney-s.txt.lcr
Encryption key:
Invalid encryption key for file: ./ephraim-w.txt.lcr
Encryption key:
Invalid encryption key for file: ./dierdre-p.txt.lcr
Encryption key:
Invalid encryption key for file: ./daniel-s.txt.lcr
Encryption key:
Invalid encryption key for file: ./christina-a-s.txt.lcr
Encryption key:
Invalid encryption key for file: ./wendy-p.txt.lcr
Encryption key:
Invalid encryption key for file: ./david-z.txt.lcr
Encryption key:
Invalid encryption key for file: ./ariana-s.txt.lcr
```

no love. maybe using the darkangel password instead?

no.

## flag
```
```
