# [03 - To_Be_Xor_Not_To_Be](https://deadface.ctfd.io/challenges#To%20Be%20Xor%20Not%20to%20Be-7)

## description
```
.$)/3<'e-)<e':e&'<e<'e-)<5

Submit the flag as flag{here-is-the-answer}
```

## walkthrough

throwing [dcode.fr](https://www.dcode.fr/xor-cipher) at this, get a bunch of hex back


didn't get there, but [gchq.github.io](https://gchq.github.io/CyberChef/#recipe=XOR) did let us brute force it (truly brute), found the key is 72.

```
irb(main):006:0> [0x66, 0x6C, 0x61, 0x67, 0x7B, 0x74, 0x6F, 0x2D, 0x65, 0x61, 0x74, 0x2D, 0x6F, 0x72, 0x2D, 0x6E, 0x6F, 0x74, 0x2D, 0x74, 0x6F, 0x2D, 0x65, 0x61, 0x74, 0x7D
].collect { |c| c.chr }.join('')

=> "flag{to-eat-or-not-to-eat}"

```


## flag
```
flag{to-eat-or-not-to-eat}
```
