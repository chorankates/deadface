# [01 - Jailbird](https://deadface.ctfd.io/challenges#Jailbird-66)

## description
```
It looks like authorities arrested a member of DEADFACE. But who was it?

Submit the member's username as the flag: flag{username}
```

## walkthrough

so, OSINT, presumably on the message board

`https://ghosttown.deadface.io/search?q=arrest` leads to

```
WHAT? They Got Our Boy!
2h - Broooo look! They arrested Donnel! How did they find out he was involved?? https://www.worldgreynews.com/details/173815/de-monne-financial-database-leak-culprit-found
```

the comments on the post, `https://ghosttown.deadface.io/t/what-they-got-our-boy/80`, seem to indicate `dr.acula` as the username


## flag
```
flag{dr.acula}
```

