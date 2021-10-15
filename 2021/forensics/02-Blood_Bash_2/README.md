# [02 - Blood_Bash_2](https://deadface.ctfd.io/challenges#Blood%20Bash%202-14)

## description
```
We've obtained access to a system maintained by bl0ody_mary. We believe bl0ody_mary stole a sensitive document and is storing it on her Linux machine. Search her system for any files relating to De Monne Financial.

Username: bl0ody_mary Password: d34df4c3
bloodbash.deadface.io:22
```

## walkthrough

ok, so this is the PDF we were trying to retrieve previously.. going to have to try harder

no, it isn't.

it is the contents of

```
$ cat Documents/.demonne_info.txt
flag{a856b162978fe563537c6890cb184c48fc2a018a}
```


## flag
```
flag{a856b162978fe563537c6890cb184c48fc2a018a}
```
