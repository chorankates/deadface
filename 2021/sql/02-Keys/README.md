# [02 - Keys](https://deadface.ctfd.io/challenges#Keys-34)

## description
```
One of De Monne's database engineers is having issues rebuilding the production database. He wants to know the name of one of the foreign keys on the loans database table. Submit one foreign key name as the flag: flag{foreign-key-name} (can be ANY foreign key).

Use the MySQL database dump from Body Count.
```

## walkthrough

```
$ sqlite3 ../01-Body_Count/foo.db
SQLite version 3.34.1 2021-01-20 14:10:07
Enter ".help" for usage hints.
sqlite> .schema loans
CREATE TABLE `loans` (
  `loan_id` integer NOT NULL PRIMARY KEY AUTOINCREMENT
,  `cust_id` integer NOT NULL
,  `employee_id` integer NOT NULL
,  `amt` decimal(10,2) NOT NULL
,  `balance` decimal(10,2) NOT NULL
,  `interest` decimal(10,2) DEFAULT NULL
,  `loan_type_id` integer NOT NULL
,  CONSTRAINT `fk_loans_cust_id` FOREIGN KEY (`cust_id`) REFERENCES `customers` (`cust_id`) ON DELETE CASCADE
,  CONSTRAINT `fk_loans_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`employee_id`) ON DELETE CASCADE
,  CONSTRAINT `fk_loans_loan_type_id` FOREIGN KEY (`loan_type_id`) REFERENCES `loan_types` (`loan_type_id`) ON DELETE CASCADE
);
CREATE INDEX "idx_loans_fk_loans_cust_id" ON "loans" (`cust_id`);
CREATE INDEX "idx_loans_fk_loans_employee_id" ON "loans" (`employee_id`);
CREATE INDEX "idx_loans_fk_loans_loan_type_id" ON "loans" (`loan_type_id`);
```


## flag
```
flag{fk_loans_cust_id}
```
