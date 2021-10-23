# [01 - Cereal_Killer](https://deadface.ctfd.io/challenges#Cereal%20Killer-30)

## description
```
spookyboi is really into Serial Killers. He loves to watch Mindhunter on NetFlix. He can also SLAY a bowl of his favorite cereal.

(Choose either the Windows or Linux binaries to analyze...)
RE01 (Windows)
SHA1: 3674964b75d2894f297470be8a39802af40314b3
RE01 (Linux)
SHA1: af2392a43e3571fa43be6a48a3a83131f549013c
```

### links

  * [deadface_re01.bin](deadface_re01.bin)

## walkthrough

```
$ file deadface_re01.bin
deadface_re01.bin: ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=fbf590b348154436c6f85
039aecd9b2cc7d0506e, for GNU/Linux 3.2.0, not stripped

```

from ghidra

```

undefined8 main(void)

{
  long lVar1;
  long in_FS_OFFSET;
  byte local_238 [32];
  long local_218;
  int local_210;
  short local_20c;
  long local_10;

  local_10 = *(long *)(in_FS_OFFSET + 0x28);
  lVar1 = 0;
  do {
    if ((&DAT_00102008)[lVar1] != 0) {
      local_238[lVar1] = (&DAT_00102008)[lVar1] ^ 0x5a;
    }
    lVar1 = lVar1 + 1;
  } while (lVar1 != 0x1f);
  local_238[30] = 0;
  puts("What is the best and sp00kiest breakfast cereal?");
  __printf_chk(1,&DAT_001020ad,"Please enter the passphrase: ");
  __isoc99_scanf(&DAT_001020ad,&local_218);
  if (((local_218 == 0x68632d746e753063) && (local_210 == 0x6c756330)) && (local_20c == 0x61)) {
    puts((char *)local_238);
  }
  else {
    puts("notflag{you-guessed-it---this-is-not-the-flag}");
  }
  if (local_10 == *(long *)(in_FS_OFFSET + 0x28)) {
    return 0;
  }
                    /* WARNING: Subroutine does not return */
  __stack_chk_fail();
}
```

don't see how we control `local_210` or `local_20c`

let's give angr a shot

```
$ python angr-template.py
round[24]
WARNING | 2021-10-15 15:04:13,071 | angr.simos.simos | stdin is constrained to 24 bytes (has_end=True). If you are only providing the first 24 bytes instead of the entire s
tdin, please use stdin=SimFileStream(name='stdin', content=your_first_n_bytes, has_end=False).
b'\n\n\x0c\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n'
conor@pride:~/git/ctf-meta/deadface/2021/reverse/01-Cereal_Killer[chorankates/deadface|main|87b2fd7|U]
 3:04.13 [10680] $ ./deadface_re01.bin
What is the best and sp00kiest breakfast cereal?
Please enter the passphrase: 0c
notflag{you-guessed-it---this-is-not-the-flag}
conor@pride:~/git/ctf-meta/deadface/2021/reverse/01-Cereal_Killer[chorankates/deadface|main|87b2fd7|U]
 3:04.29 [10681] $ ./deadface_re01.bin
What is the best and sp00kiest breakfast cereal?
Please enter the passphrase: \n\n\x0c\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n
notflag{you-guessed-it---this-is-not-the-flag}
```

## flag
```
```
