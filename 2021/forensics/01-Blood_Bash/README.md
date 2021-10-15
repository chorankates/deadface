# [01 - Blood_Bash](https://deadface.ctfd.io/challenges#Blood%20Bash-13)

## description
```
We've obtained access to a system maintained by bl0ody_mary. There are five flag files that we need you to read and submit. Submit the contents of flag1.txt.

Username: bl0ody_mary
Password: d34df4c3
bloodbash.deadface.io:22
```

## walkthrough

```
$ ssh -l bl0ody_mary bloodbash.deadface.io
bl0ody_mary@bloodbash.deadface.io's password:
bl0ody_mary@2f02472864b3:~$ ls -la
total 68
drwxr-xr-x 1 bl0ody_mary bl0ody_mary  4096 Sep 16 12:51  .
drwxr-xr-x 1 root        root         4096 Sep 14 19:15  ..
-rw------- 1 bl0ody_mary bl0ody_mary     1 Sep 16 14:44  .bash_history
-rw-r--r-- 1 bl0ody_mary bl0ody_mary   220 Sep 14 19:15  .bash_logout
-rw-r--r-- 1 bl0ody_mary bl0ody_mary  3771 Sep 14 19:15  .bashrc
-rw-r--r-- 1 bl0ody_mary bl0ody_mary   807 Sep 14 19:15  .profile
-rw-r--r-- 1 bl0ody_mary bl0ody_mary 12444 Sep 14 20:20 'De Monne Customer Portal.pdf'
drwxr-xr-x 2 bl0ody_mary bl0ody_mary  4096 Sep 14 19:16  Documents
drwxr-xr-x 2 bl0ody_mary bl0ody_mary  4096 Sep 14 19:15  Downloads
drwxr-xr-x 2 bl0ody_mary bl0ody_mary  4096 Sep 14 19:15  Music
drwxr-xr-x 2 bl0ody_mary bl0ody_mary  4096 Sep 14 19:15  Pictures
drwxr-xr-x 2 bl0ody_mary bl0ody_mary  4096 Sep 14 19:15  Videos
bl0ody_mary@2f02472864b3:~$ ls -la Documents/
total 20
drwxr-xr-x 2 bl0ody_mary bl0ody_mary 4096 Sep 14 19:16 .
drwxr-xr-x 1 bl0ody_mary bl0ody_mary 4096 Sep 16 12:51 ..
-rw-r--r-- 1 bl0ody_mary bl0ody_mary   47 Sep 14 19:16 .demonne_info.txt
-rw-r--r-- 1 bl0ody_mary bl0ody_mary   47 Sep 14 19:16 flag1.txt
bl0ody_mary@2f02472864b3:~$ cat Documents/flag1.txt
flag{cd134eb8fbd794d4065dcd7cfa7efa6f3ff111fe}
bl0ody_mary@2f02472864b3:~$ cat Documents/.demonne_info.txt
flag{a856b162978fe563537c6890cb184c48fc2a018a}
```

good old two-for-one special.. though not quite 3:

```
$ scp bl0ody_mary@bloodbash.deadface.io:*.pdf .
bl0ody_mary@bloodbash.deadface.io's password:
the input device is not a TTY
```

## flag
```
flag{cd134eb8fbd794d4065dcd7cfa7efa6f3ff111fe}
```
