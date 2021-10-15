# [01 - Body_Count](https://deadface.ctfd.io/challenges#Body%20Count-33)

## description
```
One of our employees, Jimmie Castora, kept database backups on his computer. DEADFACE compromised his computer and leaked a portion of the database. Can you figure out how many customers are in the database? We want to get ahead of this and inform our customers of the breach.

Submit the flag as flag{#}. For example, flag{12345}.

Download MySQL database dump
SHA1: 5867eeb1466b31eb8d361061fddd99700fc5d739
Password: d34df4c3
```

### links

  * [demonne.zip](demonne.zip)

## walkthrough

```
$ file demonne.sql
demonne.sql: ASCII text, with very long lines
```

rather than stand up a mysql db, use [mysql2sqlite](https://github.com/dumblob/mysql2sqlite):
```
$ mysql2sqlite/mysql2sqlite demonne.sql | sqlite3 foo.db
memory
$ file foo.db
foo.db: SQLite 3.x database, last written using SQLite version 3034001
$ sqlite3 foo.db
sqlite> .tables
credit_cards     customers        employees        loans
cust_passwd      employee_passwd  loan_types       test
sqlite> select count(*) from customers;
10000
```

boo. that is in fact the answer

## flag
```
```
