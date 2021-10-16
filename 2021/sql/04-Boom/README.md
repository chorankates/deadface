# [04 - Boom](https://deadface.ctfd.io/challenges#Boom-37)

## description
```
DEADFACE actors will be targeting customers they consider low-hanging fruit. Check out Ghost Town and see who they are targeting. Submit the number of target candidates as the flag: flag{#}

Use the MySQL database dump from Body Count.

Ghost Town thread
```

### links

  * [Ghost Town Thread](https://ghosttown.deadface.io/t/who-are-we-hitting-first/60/8)

## walkthrough

```
@alitevlin We should try to find someone in their late 50s or in their 70s to target. They usually make better targets than younger folks. Try finding a baby boomer. Once you get the database from JC, hmu and we’ll find out which targets are best.
```

ok, but we don't have employee ages. -- but we do have customer ages in the form of DOB

```
That’s a good idea. Once I get the database I can figure out who lives in Michigan and employee I can target.
```

```
$ sqlite3 foo.db
sqlite> select count(*) from employees where state = 'MI';
94
```

but that is not the flag.

```
sqlite> select count(*) from customers where state = 'MI';
189
```

also not the flag.

going after "late 50s or 70s" via [foo.rb](foo.rb)

```
$ ruby foo.rb
...
miss, age[41]
target age[57] found[{:cust_id=>9996, :last_name=>"Twining", :first_name=>"Afton", :email=>"atwining7pn@fda.gov", :street=>"07 Heffernan Circle", :city=>"Saint Paul", :state=>"MN", :country=>"US", :postal=>"55172", :gender=>"F", :dob=>"06/12/1964"}]
miss, age[43]
miss, age[52]
miss, age[34]
miss, age[34]
flag{1235}
```

which is also wrong.

what about late 50s or 70s and MI

```
miss, age[41]
miss, age[65]
target age[58] found[{:cust_id=>9569, :last_name=>"Castilljo", :first_name=>"Caye", :email=>"ccastilljo7ds@com.com", :street=>"04321 Evergreen Trail", :city=>"Saginaw", :st
ate=>"MI", :country=>"US", :postal=>"48609", :gender=>"F", :dob=>"08/28/1963"}]
miss, age[63]
miss, age[50]
miss, age[35]
miss, age[38]
miss, age[45]
flag{16}
```
also, no.


## flag

```
```
