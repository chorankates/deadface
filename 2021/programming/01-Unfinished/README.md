# [01 - Unfinished](https://deadface.ctfd.io/challenges#Unfinished-52)

## description
```
There seems to be something wrong with this code. Can you figure out how to make it return the flag? Modify the code to show the flag. Submit the flag as: flag{flag-goes-here}.

#!/usr/bin/env python3
from binascii import unhexlify as u

def get_flag():
    flag = '666c61677b30682d6c6f6f6b2d612d466c61477d'
    return u(flag).decode('utf-8')


print(f'The flag is: ')
```

## walkthrough

```
$ python3
Python 3.8.5 (default, Dec 17 2020, 11:01:51)
[GCC 10.2.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import binascii
>>> a = "666c61677b30682d6c6f6f6b2d612d466c61477d"
>>> a
'666c61677b30682d6c6f6f6b2d612d466c61477d'
>>> binascii.unhexlify(a)
b'flag{0h-look-a-FlaG}'
>>>

```


## flag
```
flag{0h-look-a-FlaG}
```
