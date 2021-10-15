# [03 - City_Lights](https://deadface.ctfd.io/challenges#City%20Lights-36)

## description
```
De Monne wants to know how many branch offices were included in the database leak. This can be found by figuring out how many unique cities the employees live in. Submit the flag as flag{#}.

Use the MySQL database dump from Body Count.
```

## walkthrough

```
$ sqlite3 foo.db
sqlite> select city, count(*) from employees group by city;
Abilene|3
Aiken|5
Akron|8
Albany|25
Albuquerque|24
Alexandria|14
Alhambra|4
Allentown|1
...
$ sqlite3 ../01-Body_Count/foo.db "select city, count(*) from employees group by city;" > foo.txt
$ wc -l foo.txt
444 foo.txt
```


## flag
```
flag{444}
```
