# [02 - The_SUM_of_All_Fears](https://deadface.ctfd.io/challenges#The%20SUM%20of%20All%20FEARS-43)

## description
```
After hacking a victim's computer, Luciafer downloaded several files, including two binaries with identical names, but with the extensions .exe and .bin (a Windows binary and a Linux binary, respectively).

What are the MD5 hashes of the two tool programs? Submit both hashes as the flag, separated by a |: flag{ExeMD5|BinMD5}

Use the PCAP from LYTTON LABS 01 - Monstrum ex Machina.
```

## walkthrough

found `secret_decoder.bin` fairly quickly, but can't find the `.exe` version..

```
$ md5sum secret_decoder.bin
42e419a6391ca79dc44d7dcef1efc83b  secret_decoder.bin
```

bw was more helpful than expected

```
29665846      0x1C4AA36       Microsoft executable, portable (PE)
29667510      0x1C4B0B6       CRC32 polynomial table, little endian
29673341      0x1C4C77D       Copyright string: "Copyright 1995-2002 Jean-loup Gailly "
29696153      0x1C52099       Copyright string: "Copyright 1995-2002 Mark Adler "
29732050      0x1C5ACD2       Microsoft executable, portable (PE)
29816674      0x1C6F762       Copyright string: "Copyright 1995-2017 Jean-loup Gailly and Mark Adler "
29819930      0x1C7041A       CRC32 polynomial table, little endian
29824026      0x1C7141A       CRC32 polynomial table, big endian
29831242      0x1C7304A       Copyright string: "Copyright 1995-2017 Mark Adler "
29835223      0x1C73FD7       mcrypt 2.5 encrypted data, algorithm: "nitializeCriticalSection", keysize: 909 bytes, mode: "I",
29837586      0x1C74912       XML document, version: "1.0"
29840614      0x1C754E6       ELF, 64-bit LSB executable, AMD x86-64, version 1 (SYSV)
29848898      0x1C77542       Unix path: /usr/local/sbin\:/usr/local/bin\:/usr/sbin\:/usr/bin\:/sbin\:/bin
29850331      0x1C77ADB       Unix path: /usr/bin/ll-connect.bin http://192.168.100.105/secret_decoder.bin
29852213      0x1C78235       ELF, 64-bit LSB executable, AMD x86-64, version 1 (SYSV)
29852764      0x1C7845C       Unix path: /usr/bin/ll-connect.bin'
29853301      0x1C78675       Unix path: /usr/bin/ll-connect.bin' saved [194/194]
29854097      0x1C78991       Unix path: /usr/bin/ll-connect.bin
29854552      0x1C78B58       Unix path: /usr/bin/ll-connect.bin' > /etc/cron.d/da-ll-backup-job"
29859382      0x1C79E36       Unix path: /etc/cron.d/da-ll-backup-job
29859627      0x1C79F2B       Unix path: /usr/bin/ll-connect.bin
29866141      0x1C7B89D       JPEG image data, JFIF standard 1.01
29866171      0x1C7B8BB       TIFF image data, little-endian offset of first image directory: 8
29866549      0x1C7BA35       JPEG image data, JFIF standard 1.01
29873643      0x1C7D5EB       Copyright string: "CopyrightOwner> <rdf:Seq/> </plus:CopyrightOwner> <plus:Licensor> <rdf:Seq/> </plus:Licensor> </rdf:Description>
                              </rdf:RDF> </x:"
29873677      0x1C7D60D       Copyright string: "CopyrightOwner> <plus:Licensor> <rdf:Seq/> </plus:Licensor> </rdf:Description> </rdf:RDF> </x:xmpmeta>  "
30481362      0x1D11BD2       Unix path: /home/luciafer/.ssh/id_rsa
30481605      0x1D11CC5       OpenSSH RSA1 private key, version "zaC1rZXktdjEAAAAABG5vbmUAAAAEbm9uZQAAAAAAAAABAAABlwAAAAdzc2gtcn"
```

looks like we have a lead on some of the next challenges.. but also believe `0x1C4AA36` is the .exe


ok, looking at the ftp traffic - secret_decoder.bin was not for this challenge - the files they want are
  * `/TOOLS/lytton-crypt.bin`
  * `/TOOLS/lytton-crypt.exe`

pulled

```
$ file lytton-crypt.*
lytton-crypt.bin: ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=8e0729e1f1d9392e109beb41722764f69f1d83c6, for GNU/Linux 3.2.0, not stripped
lytton-crypt.exe: PE32 executable (console) Intel 80386 (stripped to external PDB), for MS Windows
$ md5sum lytton-crypt.*
4da8e81ee5b08777871e347a6b296953  lytton-crypt.bin
9cb9b11484369b95ce35904c691a5b28  lytton-crypt.exe
```

## flag
```
flag{9cb9b11484369b95ce35904c691a5b28|4da8e81ee5b08777871e347a6b296953}
```
