# [07 - Address_Book](https://deadface.ctfd.io/challenges#Address%20Book-35)

## description
```
It looks like DEADFACE is targeting one of De Monne's customers. Check out this thread in Ghost Town and submit the customer's name as the flag: flag{Jane Doe}.

Use the MySQL database dump from Body Count.
```

### links

  * [Ghost Town Thread](https://ghosttown.deadface.io/t/why-do-people-fall-for-this/62)

## walkthrough

relevant comment
```
She lives near the Vienna branch of De Monne. We should spoof a phone number from that area and see if we can get her to give us her deets.
```

```
$ sqlite3 ../01-Body_Count/foo.db
SQLite version 3.34.1 2021-01-20 14:10:07
Enter ".help" for usage hints.
sqlite> select * from customers where city = 'Vienna';
1516|Gronav|Rogers|rgronav163@opensource.org|0303 Lakewood Gardens Avenue|Vienna|VA|US|22184|M|04/05/2003
2042|Gummer|Kyle|kgummer1kp@ow.ly|170 Del Sol Terrace|Vienna|VA|US|22184|M|12/14/1963
2574|Allsopp|Collen|callsopp1zh@sbwire.com|90360 Red Cloud Crossing|Vienna|VA|US|22184|F|10/25/1973
3960|Loade|Courtney|cloade31z@prnewswire.com|47 Moose Parkway|Vienna|VA|US|22184|M|04/14/1951
5685|Brasier|Berke|bbrasier4dw@google.cn|94145 Brown Parkway|Vienna|VA|US|22184|M|11/17/1968
8030|Laguerre|Kimble|klaguerre671@php.net|5229 Utah Place|Vienna|VA|US|22184|M|03/07/1970
sqlite>
```

so 'her', `Courtney Loade` ?

no.

## flag
```
```
