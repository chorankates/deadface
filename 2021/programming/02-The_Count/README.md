# [02 - The_Count](https://deadface.ctfd.io/challenges#The%20Count-40)

## description
```
Apparently DEADFACE is recruiting programmers, but spookyboi is a little apprehensive about recruiting amateurs. He's placed a password hash in the form of a flag for those able to solve his challenge. Solve the challenge and submit the flag as flag{SHA256_hash}.

Link to Thread
code.deadface.io:50000
```

### links

  * [Thread](https://ghosttown.deadface.io/t/what-programming-needs-are-there/56/4)

## walkthrough

```
$ nc code.deadface.io 50000
DEADFACE gatekeeper: Let us see how good your programming skills are.
If a = 0, b = 1, c = 2, etc.. Tell me what the sum of this word is:

 You have 5 seconds to give me an answer.

Your word is: shop
```

cool.

ok, but.. they didn't make it multi-stage:

```
$ ruby foo.rb 
DEADFACE gatekeeper: Let us see how good your programming skills are.
If a = 0, b = 1, c = 2, etc.. Tell me what the sum of this word is:

 You have 5 seconds to give me an answer.

Your word is: zany
word[zany] value[62]

flag{d1c037808d23acd0dc0e3b897f344571ddce4b294e742b434888b3d9f69d9944}
```

## flag
```
flag{d1c037808d23acd0dc0e3b897f344571ddce4b294e742b434888b3d9f69d9944}
```
