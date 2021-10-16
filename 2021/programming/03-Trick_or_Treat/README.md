# [03 - Trick_or_Treat](https://deadface.ctfd.io/challenges#Trick%20or%20Treat-51)

## description
```
A user on Ghost Town created a game that he claims no one can beat. Check out the game and find the flag hidden inside. Submit the flag as: flag{flag-goes-here}.

Download file
SHA1: 610430cb737a2a8478a9b9c53535e58010f14a91
Password: d34df4c3
```

### links

  * [game.zip](game.zip)

## walkthrough

```
$ tree game
game
├── game.py
├── img
│   ├── enemy.png
│   └── player.png
└── rkill.ttf
```

ok, it's some rick and morty themed garbage game. death is falling, need to dodge him.

tried converting strings manually, to no avail
```
$ python
Python 3.8.5 (default, Dec 17 2020, 11:01:51)
[GCC 10.2.0] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import binascii
>>> a = b'4142434445464748494a4b4c4d4e4f505152535455565758595a6162636465666768696a6b6c6d6e6f707172737475767778797a313233343536373839305f2d7b7d'
>>> binascii.unhexlify(a)
b'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890_-{}'
>>> b = b'4142434445464748494a4b4c4d4e4f505152535455565758595a6162636465666768696a6b6c6d6e6f707172737475767778797a313233343536373839305f2d7b7d'
>>> binascii.unhexlify(b)
b'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890_-{}'
>>> c = b'446f646765643a20'
>>> binascii.unhexlify(c)
b'Dodged: '
>>> d = b'44656174682764'
>>> binascii.unhexlify(d)
b"Death'd"
>>> e = b'666c61677b6a6b5f6e6f745f7468655f7265616c5f666c61677d'
>>> binascii.unhexlify(e)
b'flag{jk_not_the_real_flag}'
```

then looking at code again, one of these things is not like the other

```py
190 def set_pref():
191     return str(f'{b.prnt([31, 37, 26, 32, 64])}')
192
193
194 def gs():
195     gs_ = [2, 26, 13, 19, 62, 28, 33, 54, 55, 45, 62, 29, 54, 55, 45, 33, 65]
196     print(f"{set_pref()}{b.prnt(gs_)}")
197
```

so modified startup of game to call `print(gs())`


```
$ python game.py
pygame 2.0.2 (SDL 2.0.16, Python 3.8.5)
Hello from the pygame community. https://www.pygame.org/contribute.html
flag{
flag{CaNT_ch34t_d34th}
None
```


## flag
```
```
