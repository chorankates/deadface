# [05 - El_Paso](https://deadface.ctfd.io/challenges#El%20Paso-38)

## description
```
The regional manager for the El Paso branch of De Monne Financial is afraid his customers might be targeted for further attacks. He would like you to find out the dollar value of all loans issued by employees who live in El Paso. Submit the flag as flag{$#,###.##}.

Use the MySQL database dump from Body Count.
```

## walkthrough

so, find all the employees who live in El Paso, and then sum up their loans

can do this with a join, but.. going to go code [foo.rb](foo.rb):

```
$ ruby foo.rb
value[940000]
```

flag{$940,000}, but that is not correct. nor is flag{$940,000.00}

changed from `.to_i` to `.to_f`, but.. still an even number

## flag
```
```
