#!/bin/env ruby
## foo.rb

require 'pry'
require 'sequel'

db = '../01-Body_Count/foo.db'

dbh = Sequel.connect(sprintf('sqlite://%s', db))

employee_ids = dbh[:employees].select(:employee_id).where(:state => 'CA').to_a.collect { |e| e[:employee_id] }
cust_to_city = Hash.new
dbh[:customers].to_a.each do |c|
  cust_to_city[c[:cust_id]] = c[:city]
end

employee_to_city = Hash.new
dbh[:employees].to_a.each do |e|
  employee_to_city[e[:employee_id]] = e[:city]
end

loan_values = Hash.new(0) 

dbh[:loans].to_a.each do |l|
  next unless employee_ids.include?(l[:employee_id])
  next unless l[:loan_type_id].eql?(2)

  cust_city = cust_to_city[l[:cust_id]]
  employee_city = employee_to_city[l[:employee_id]]

  city = employee_city
  #city = cust_city

  #loan_values[city] += l[:balance].to_f
  loan_values[city] += l[:amt].to_f

end

current = 0
ceiling = 5
loan_values.keys.sort { |a,b| loan_values[b] <=> loan_values[a] }.each do |k|

  puts sprintf('%20s => %10d', k, loan_values[k])
  current += 1
  break if current > ceiling
end

binding.pry

