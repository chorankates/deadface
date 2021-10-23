# [01 - Occupation](https://deadface.ctfd.io/challenges#Occupation-41)

## description
```
Which employee at De Monne Financial was the target of DEADFACE that resulted in a data leak? Submit the employee's job title as the flag: flag{Job Title}
```

## walkthrough

looking at ghost town, think this is the right thread: https://ghosttown.deadface.io/t/they-got-the-wrong-guy/75


so, an employee named jimmie?

```
$ sqlite3 ../../sql/01-Body_Count/foo.db 
SQLite version 3.34.1 2021-01-20 14:10:07
Enter ".help" for usage hints.
sqlite> select * from employees where first_name = 'Jimmie';
sqlite> select * from employees where first_name = 'Jimmy';
4177|Grasner|Jimmy|jgrasner380@demonnefinancial.com|33348 Cardinal Center|Los Angeles|CA|US|90189|M|7928951916
```

probably - but that doesn't tell us his occupation

following to the news story referenced, it is in the headline `De Monne Senior Organizer On Administrative Leave Pending Data Leak Investigation`

tried `Senior Organizer`, `SeniorOrganizer` and `Organizer`, all.. no

## flag
```
```
