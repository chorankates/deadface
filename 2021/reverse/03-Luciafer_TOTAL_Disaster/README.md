# [03 - Luciafer_TOTAL_Disaster](https://deadface.ctfd.io/challenges#Luciafer's%20TOTAL%20Disaster-62)

## description
```
Luciafer should learn to follow directions! Her "cryptoware" is a TOTAL disaster! She didn't realize that her choice of encryption algorithm, although a common encryption algorithm for hiding POCs from analysts because of its simplicity and lack of an obvious signature, it is terrible for cryptoware!

Do some basic analysis on her malware and see what information you can come up with. There are some great, easy to use tools that can help a burgeoning malware analyst.
```

### links

  * [Luciafer's Cryptoware Binary](zealotcrypt-01.exe)

## walkthrough


oi

```
$ strings -n 10 zealotcrypt-01.exe  | wc -l
17140
```

it's go, so lots of strings. lets look at it in ghidra

see references to
  * `hash/crc32`
  * `encrypt/RC4`


not making much progress, so going to try [pev](https://github.com/merces/pev):
```
$ pescan zealotcrypt-01.exe
file entropy:                    6.942916 (normal)
fpu anti-disassembly:            no
imagebase:                       normal
entrypoint:                      normal
DOS stub:                        suspicious
TLS directory:                   not found
timestamp:                       zero/invalid
section count:                   13 (high)
sections
    section
        .text:                           normal
    section
        .rdata:                          normal
    section
        .data:                           normal
    section
        /4:                              suspicious name, small length
    section
        /19:                             suspicious name
    section
        /32:                             suspicious name
    section
        /46:                             suspicious name, small length
    section
        /65:                             suspicious name
    section
        /78:                             suspicious name
    section
        /90:                             suspicious name
    section
        .idata:                          normal
    section
        .reloc:                          normal
    section
        .symtab:                         normal

```

interesting strings
```
/home/dsewell/Dev/go/src/github.com/docsewell/go-ransom/zealotcrypt-01.go
encoding/hex.DecodeString
main.encryptDecryptXor
fmt.Println
main.encryptCaesar
 3940200619639447921227904010014361380507973927046544666794829340424572177149687032904726608825893800186160697311231939402006196394479212279040100143613805079739270465446667946905279627659399113263569398956308152294913554433653942643c6858e06b70404e9cd9e3ecb662395b4429c648139053fb521f828af606b4d3dbaa14b5e77efe75928fe1dc127a2ffa8de3348b3c1856a429bf97e7e31c2e5bd66051953eb9618e1c9a1f929a21a0b68540eea2da725b99b315f3b8b489918ef109e156193951ec7e937b1652c0bd3bb1bf073573df883d2c34f1ef451fd46b503f0011839296a789a3bc0045c8a5fb42c7d1bd998f54449579b446817afbd17273e662c97ee72995ef42640c550b9013fad0761353c7086a272c24088be94769fd166506864797660130609714981900799081393217269435300143305409394463459185543183397656052122559640661454554977296311391480858037121987999716643812574028291115057151686479766013060971498190079908139321726943530014330540939446345918554318339765539424505774633321719753296399637136332111386476861244038034037280889270700544900010203040506070809101112131415161718192021222324252627282930313233343536373839404142434445464748495051525354555657585960616263646566676869707172737475767778798081828384858687888990919293949596979899

```

looking in ghidra again, see

```
"DEADFACE-LLABS-CRYPTOWARE/6.66E. South America Standard TimeEastern Standard Time (Mexico)GODEBUG: unknown cpu feature \"HEADERS frame with stream ID 0MapIter.Key called before NextPacific Standard Time (Mexico)Turks And Caicos Standard Timeabi mismatch detected between asn1: cannot marshal nil valueassignment to entry in nil mapcheckdead: inconsistent countscrypto/dsa: invalid public keycrypto/rsa: verification errorfailed to get system page sizefreedefer with d._panic != nilhttp2: decoded hpack field %+vhttp: named cookie not presentillegal window increment valueinappropriate ioctl for deviceinvalid function symbol table\ninvalid network interface nameinvalid pointer found on stackmime: duplicate parameter namemissing validateFirstLine funcnotetsleep - waitm out of syncpersistConn was already in LRUprotocol version not supportedprotocol wrong type for socketreflect: Elem of invalid type reflect: Len of non-array typereflect: Out of non-func type runqputslow: queue is not fullruntime: bad g in cgocallback\nruntime: bad pointer in frame runtime: found in object at *(runtime: impossible type kind socket operation on non-socketstream error: stream ID %d; %vsync: inconsistent mutex statesync: unlock of unlocked mutextext/javascript; charset=utf-8transform: short source bufferx509: SAN dNSName is malformedx509: invalid ECDSA parametersx509: malformed issuerUniqueID) not in usable address space: ...additional frames elided...\n.lib section in a.out corrupted11368683772161602973937988281255684341886080801486968994140625CLIENT_HANDSHAKE_TRAFFIC_SECRETCentral Brazilian Standard TimeMountain Standard Time (Mexico)Network Authentication RequiredPRIORITY frame with stream ID 0Request Header Fields Too LargeRequested Range Not SatisfiableSERVER_HANDSHAKE_TRAFFIC_SECRETTLS: sequence number wraparoundW. Central Africa Standard Timebad certificate status responsebad write barrier buffer boundscannot assign requested addresscasgstatus: bad incoming valuescheckmark found unmarked objectencoding/hex: invalid byte: %#Uentersyscallblock..." /* TRUNCATED STRING LITERAL */
```

in the `main.fetchKey` func


in `main.main` func
```
          lpNumberOfBytesRead = pDVar8;
          while (iVar2 < (int)pDVar8) {
            local_20 = local_1c[iVar2 * 2];
            lpBuffer = (local_1c + iVar2 * 2)[1];
            nNumberOfBytesToRead = 3;
            main.rotateText(local_20,lpBuffer);
            p_Var11 = lpOverlapped_00;
            local_34 = lpNumberOfBytesRead;
            os.ReadFile(local_20,lpBuffer,nNumberOfBytesToRead,lpNumberOfBytesRead,lpOverlapped_00);
            main.encryptRc4(nNumberOfBytesToRead,lpNumberOfBytesRead,p_Var11,local_18,
                            in_stack_ffffff00,uVar9);
            puVar12 = (undefined *)0x1a4;
            lpNumberOfBytesRead = lpNumberOfBytesWritten;
            p_Var11 = lpOverlapped;
            os.WriteFile(local_34,lpOverlapped_00,1,lpNumberOfBytesWritten,lpOverlapped);
            os.Remove(local_20,lpBuffer);
            iVar2 = iVar2 + 1;
            lpOverlapped_00 = p_Var11;
          }
```

so looks like reading 3 bytes, rotating text, then reading another file, rc4 encrypting

but this is a lot more than 20 points worth of work..

## flag
```
```
