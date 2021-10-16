# [03 - Blood_Bash_3](https://deadface.ctfd.io/challenges#Blood%20Bash%203-15)

## description
```
There's a flag on this system that we're having difficulty with. Unlike the previous flags, we can't seem to find a file with this flag in it. Perhaps the flag isn't stored in a traditional file?

Username: bl0ody_mary
Password: d34df4c3
bloodbash.deadface.io:22
```

## walkthrough

this is the 2nd flag we found while finding the first..

```
bl0ody_mary@2f02472864b3:~$ cat Documents/.demonne_info.txt
flag{a856b162978fe563537c6890cb184c48fc2a018a}
```


... except that it isn't. oi

```
$ sudo -l
Matching Defaults entries for bl0ody_mary on bb77fb369c1e:
    env_reset, mail_badpass, secure_path=/usr/local/sbin\:/usr/local/bin\:/usr/sbin\:/usr/bin\:/sbin\:/bin\:/snap/bin

User bl0ody_mary may run the following commands on bb77fb369c1e:
    (ALL) NOPASSWD: /opt/start.sh, /usr/sbin/srv

$ /usr/sbin/srv --help
bash: /usr/sbin/srv: Permission denied
bl0ody_mary@bb77fb369c1e:~$ sudo !!
sudo /usr/sbin/srv --help
Traceback (most recent call last):
  File "/usr/sbin/srv", line 14, in <module>
    udp_server_socket.bind((host, port))
OSError: [Errno 98] Address already in use
```

UDP?

back to "not a traditional file"

```
bl0ody_mary@3f511992bc19:~$ find / -type b 2>/dev/null
bl0ody_mary@3f511992bc19:~$ find / -type c 2>/dev/null
/dev/urandom
/dev/zero
/dev/tty
/dev/full
/dev/random
/dev/null
/dev/pts/0
/dev/pts/ptmx
bl0ody_mary@3f511992bc19:~$ find / -type p 2>/dev/null
bl0ody_mary@3f511992bc19:~$ find / -type s 2>/dev/null
bl0ody_mary@3f511992bc19:~$
```

not seeing much there

ok, back to UDP

```
bl0ody_mary@3f511992bc19:~$ nc -z -v localhost -u 1-65535
Connection to localhost 43526 port [udp/*] succeeded!
Connection to localhost 60430 port [udp/*] succeeded!
bl0ody_mary@3f511992bc19:~$ nc -v -u localhost 43526
Connection to localhost 43526 port [udp/*] succeeded!
flag{open_port(al)s}flag{open_port(al)s}flag{open_port(al)s}flag{open_port(al)s}flag{open_port(al)s}
```

## flag
```
flag{open_port(al)s}
```
