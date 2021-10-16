# [07 - Window_Pains_2](https://deadface.ctfd.io/challenges#Window%20Pains%202-19)

## description
```
Using the memory dump file from Window Pains, submit the victim's computer name.

Submit the flag as flag{COMPUTER-NAME}.
```

## walkthrough

so, still volatility.

```
$ ./vol.py -f ../01-Window_Pains/physmemraw windows.envars.Envars
...
5860    winpmem_mini_x  0x1ef7b0e1c10   ALLUSERSPROFILE C:\ProgramData
5860    winpmem_mini_x  0x1ef7b0e1c10   APPDATA C:\Users\Jimmie\AppData\Roaming
5860    winpmem_mini_x  0x1ef7b0e1c10   CommonProgramFiles      C:\Program Files\Common Files
5860    winpmem_mini_x  0x1ef7b0e1c10   CommonProgramFiles(x86) C:\Program Files (x86)\Common Files
5860    winpmem_mini_x  0x1ef7b0e1c10   CommonProgramW6432      C:\Program Files\Common Files
5860    winpmem_mini_x  0x1ef7b0e1c10   COMPUTERNAME    DESKTOP-IT8QNRI
5860    winpmem_mini_x  0x1ef7b0e1c10   ComSpec C:\WINDOWS\system32\cmd.exe
5860    winpmem_mini_x  0x1ef7b0e1c10   DriverData      C:\Windows\System32\Drivers\DriverData
5860    winpmem_mini_x  0x1ef7b0e1c10   HOMEDRIVE       C:
5860    winpmem_mini_x  0x1ef7b0e1c10   HOMEPATH        \Users\Jimmie
5860    winpmem_mini_x  0x1ef7b0e1c10   LOCALAPPDATA    C:\Users\Jimmie\AppData\Local
5860    winpmem_mini_x  0x1ef7b0e1c10   LOGONSERVER     \\DESKTOP-IT8QNRI
5860    winpmem_mini_x  0x1ef7b0e1c10   NUMBER_OF_PROCESSORS    4
5860    winpmem_mini_x  0x1ef7b0e1c10   OneDrive        C:\Users\Jimmie\OneDrive
5860    winpmem_mini_x  0x1ef7b0e1c10   OS      Windows_NT
5860    winpmem_mini_x  0x1ef7b0e1c10   Path    C:\WINDOWS\system32;C:\WINDOWS;C:\WINDOWS\System32\Wbem;C:\WINDOWS\System32\WindowsPowerShell\v1.0\;C:\WINDOWS\System32\OpenSSH\;C:\Users\Jimmie\AppData\Local\Microsoft\WindowsApps
5860    winpmem_mini_x  0x1ef7b0e1c10   PATHEXT .COM;.EXE;.BAT;.CMD;.VBS;.VBE;.JS;.JSE;.WSF;.WSH;.MSC;.CPL
5860    winpmem_mini_x  0x1ef7b0e1c10   PROCESSOR_ARCHITECTURE  AMD64
5860    winpmem_mini_x  0x1ef7b0e1c10   PROCESSOR_IDENTIFIER    Intel64 Family 15 Model 6 Stepping 1, GenuineIntel
5860    winpmem_mini_x  0x1ef7b0e1c10   PROCESSOR_LEVEL 15
5860    winpmem_mini_x  0x1ef7b0e1c10   PROCESSOR_REVISION      0601
5860    winpmem_mini_x  0x1ef7b0e1c10   ProgramData     C:\ProgramData
5860    winpmem_mini_x  0x1ef7b0e1c10   ProgramFiles    C:\Program Files
5860    winpmem_mini_x  0x1ef7b0e1c10   ProgramFiles(x86)       C:\Program Files (x86)
5860    winpmem_mini_x  0x1ef7b0e1c10   ProgramW6432    C:\Program Files
5860    winpmem_mini_x  0x1ef7b0e1c10   PSModulePath    C:\Users\Jimmie\Documents\WindowsPowerShell\Modules;C:\Program Files\WindowsPowerShell\Modules;C:\WINDOWS\system32\WindowsPowerShell\v1.0\Modules
5860    winpmem_mini_x  0x1ef7b0e1c10   PUBLIC  C:\Users\Public
5860    winpmem_mini_x  0x1ef7b0e1c10   SystemDrive     C:
5860    winpmem_mini_x  0x1ef7b0e1c10   SystemRoot      C:\WINDOWS
5860    winpmem_mini_x  0x1ef7b0e1c10   TEMP    C:\Users\Jimmie\AppData\Local\Temp
5860    winpmem_mini_x  0x1ef7b0e1c10   TEST    TEST123
5860    winpmem_mini_x  0x1ef7b0e1c10   TMP     C:\Users\Jimmie\AppData\Local\Temp
5860    winpmem_mini_x  0x1ef7b0e1c10   USERDOMAIN      DESKTOP-IT8QNRI
5860    winpmem_mini_x  0x1ef7b0e1c10   USERDOMAIN_ROAMINGPROFILE       DESKTOP-IT8QNRI
5860    winpmem_mini_x  0x1ef7b0e1c10   USERNAME        Jimmie
5860    winpmem_mini_x  0x1ef7b0e1c10   USERPROFILE     C:\Users\Jimmie
5860    winpmem_mini_x  0x1ef7b0e1c10   windir  C:\WINDOWS
```


## flag
```
flag{DESKTOP-IT8QNRI}
```
