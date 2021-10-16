# [08 - Window_Pains_3](https://deadface.ctfd.io/challenges#Window%20Pains%203-20)

## description
```
Using the memory dump file from Window Pains, find out the name of the malicious process.

Submit the flag as flag{process-name_pid} (include the extension).

Example: flag{svchost.exe_1234}
```

## walkthrough


```
$ ./vol.py -f ../physmemraw windows.cmdline.CmdLine > ../../08-Window_Pains_3/cmdline.txt
...
8180    userinit.exe    C:\Windows\Temp\userinit.exe
```

looks suspicious to me - and correct. thanks Webroot

## flag
```
flag{userinit.exe_8180}
```
