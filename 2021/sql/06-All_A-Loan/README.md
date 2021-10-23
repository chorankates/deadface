# [06 - All_A-Loan](https://deadface.ctfd.io/challenges#All%20A-Loan-39)

## description
```
De Monne has reason to believe that DEADFACE will target loans issued by employees in California. It only makes sense that they'll then target the city with the highest dollar value of loans issued. Which city in California has the most money in outstanding Small Business loans? Submit the city and dollar value as the flag in this format: flag{City_$#,###.##}

Use the MySQL database dump from Body Count
```

## walkthrough

more could-be-done-with-joins, but am writing code instead, [foo.rb](foo.rb).

```
$ ruby foo.rb 
          Sacramento =>     613819
              Fresno =>     456096
             Oakland =>     296792
           San Diego =>     292815
         Los Angeles =>     224857
         Bakersfield =>     221113
```

but the flag is not `flag{Sacramento_$613,819.00}`

it's because we should only be looking at 'Small Business' loans, likely identified by `loan_type_id`, which is id `3`

that got us to `flag{Sacramento_$260,578.00}`, which is not correct either. 
and using the amount, got us to `flag{Fresno_$259,000.00}`, nope.

## flag
```
```
