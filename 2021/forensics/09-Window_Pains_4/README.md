# [09 - Window_Pains_4](https://deadface.ctfd.io/challenges#Window%20Pains%204-21)

## description
```
We want to see if any other machines are infected with this malware. Using the memory dump file from Window Pains, submit the SHA1 checksum of the malicious process.

Submit the flag as flag{SHA1 hash}.

CAUTION Practice good cyber hygiene! Use an isolated VM to download/run the malicious process. While the malicious process is relatively benign, if you're using an insecurely-configured Windows host, it may be possible for someone to compromise your machine if they can reach you on the same network.
```

## walkthrough

lol @ caution - as if we'd run Windows.

looks like volatility can do this with `windows.dumpfiles.DumpFiles --pid <pid>`, which we already know from [08 - Window Pains 3](../08-Window_Pains_3) to be `8180`

```
 $ python ../06-Window_Pains/volatility3/vol.py -f ../06-Window_Pains/physmemraw windows.dumpfiles.DumpFiles --pid 8180
Volatility 3 Framework 2.0.0
Progress:  100.00               PDB scanning finished
Cache   FileObject      FileName        Result

ImageSectionObject      0x9a077f6d01a0  sechost.dll     file.0x9a077f6d01a0.0x9a077f0ddb20.ImageSectionObject.sechost.dll.img
ImageSectionObject      0x9a07857d4280  userinit.exe    file.0x9a07857d4280.0x9a07843b6a90.ImageSectionObject.userinit.exe.img
ImageSectionObject      0x9a0784c4e590  cryptsp.dll     file.0x9a0784c4e590.0x9a0784bbca20.ImageSectionObject.cryptsp.dll.img
ImageSectionObject      0x9a0784c6fa60  icuin.dll       file.0x9a0784c6fa60.0x9a07849e6600.ImageSectionObject.icuin.dll.img
ImageSectionObject      0x9a0784c6f740  icuuc.dll       file.0x9a0784c6f740.0x9a07849e4660.ImageSectionObject.icuuc.dll.img
DataSectionObject       0x9a078482feb0  ~FontCache-S-1-5-21-1114333211-2247716564-2192578087-1001.dat   Error dumping file
DataSectionObject       0x9a0780c1ec80  ~FontCache-FontFace.dat Error dumping file
...
$ sha1sum file.0x9a07857d4280.0x9a07843b6a90.ImageSectionObject.userinit.exe.img
962d96f30c8f126cbcdee6eecc5e50c3a408402b  file.0x9a07857d4280.0x9a07843b6a90.ImageSectionObject.userinit.exe.img
```

## flag
```
flag{962d96f30c8f126cbcdee6eecc5e50c3a408402b}
```
