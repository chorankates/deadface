#!/bin/env ruby
# foo.rb

require 'pry'
require 'sequel'

def dob2age(dob)
  begin
    #t = Time.parse(dob)
    d = Date.strptime(dob, "%m/%d/%Y").to_time
    s = Time.now - d
    y = (s / (60 * 60 * 24 * 365)).to_i
  rescue => e
    puts sprintf('caught[%s][%s]', e.class, e.message)
    binding.pry
  end
end

db = '../01-Body_Count/foo.db'

dbh = Sequel.connect(sprintf('sqlite://%s', db))

targets = 0

# looking at customers table, for people in their late 50s or their 70s
dbh[:customers].to_a.each do |c|
  age = dob2age(c[:dob])
  next unless c[:state].eql?('MI')
  #if (age >= 55 && age < 60) || (age >= 70 && age < 80)
  if age >= 55
    puts sprintf('target age[%d] found[%s]', age, c)
    targets += 1
  else
    puts sprintf('miss, age[%d]', age)
  end

end

puts sprintf('flag{%d}', targets)

