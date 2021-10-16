# [06 - Window_Pains](https://deadface.ctfd.io/challenges#Window%20Pains-18)

## description
```
One of De Monne's employees had their personal Windows computer hacked by a member of DEADFACE. The attacker managed to exploit a portion of a database backup that contains sensitive employee and customer PII.

Inspect the memory dump and tell us the Windows Major Operating System Version, bit version, and the image date/time (UTC, no spaces or special characters). Submit the flag as flag{OS_BIT_YYYYMMDDhhmmss}.

Example: flag{WindowsXP_32_202110150900}

Download File (1.5GB; ~5GB after decompression)
SHA1: 293c3a2a58ed7b15a8454f6dcd8bec0773ba550e
Password: d34df4c3
```

### links

  * [memdump.zip](memdump.zip) only available on pride

## walkthrough

this is a job for .. something in kali - but having some problems with vbox locally.

so, let's use a local version of [volatility3](https://github.com/volatilityfoundation/volatility3.git), with some help from [book.hacktricks.xyz](https://book.hacktricks.xyz/forensics/basic-forensic-methodology/memory-dump-analysis/volatility-examples)

```
$ ./vol.py -f ../physmemraw windows.info.Info
Volatility 3 Framework 2.0.0
Progress:  100.00               PDB scanning finished
Variable        Value

Kernel Base     0xf8005da00000
DTB     0x1aa000
Symbols file:///home/conor/git/ctf-meta/deadface/2021/forensics/06-Window_Pains/volatility3/volatility3/symbols/windows/ntkrnlmp.pdb/47114209A62F3B9930F6B8998DFD4A99-1.json
.xz
Is64Bit True
IsPAE   False
layer_name      0 WindowsIntel32e
memory_layer    1 FileLayer
KdVersionBlock  0xf8005e60f378
Major/Minor     15.19041
MachineType     34404
KeNumberProcessors      4
SystemTime      2021-09-07 14:57:44
NtSystemRoot    C:\WINDOWS
NtProductType   NtProductWinNt
NtMajorVersion  10
NtMinorVersion  0
PE MajorOperatingSystemVersion  10
PE MinorOperatingSystemVersion  0
PE Machine      34404
PE TimeDateStamp        Sat Apr  7 12:04:17 2068

```

so we need
  * Windows Major Operating System Version
  * bit version
  * image date/time in UTC

failed attempts
  * `flag{Windows10_32_20210907145744}` # using SystemTime as the image date time. 
  * `flag{Windows10_32_20680407120417}` # using PE TimeDateStamp

think the first attempt was right, but we're not in UTC. where can we get the TZ in use?

nope - it's 64 bit

```
$ ./vol.py -f ../physmemraw windows.envars.Envars > env.txt
```
nope

```
$ ./vol.py -f ../physmemraw windows.registry.printkey.PrintKey --key "Software\Microsoft\Windows NT\CurrentVersion\Time Zones"
$ ./vol.py -f ../physmemraw windows.registry.printkey.PrintKey --key "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\TimeZoneInformation"
```

 TZ was unnecessary - it was 32 vs. 64

## flag
```
flag{Windows10_64_20210907145744}
```
