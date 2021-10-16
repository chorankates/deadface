#!/bin/env ruby
## foo.rb

require 'pry'
require 'sequel'

db = '../01-Body_Count/foo.db'

dbh = Sequel.connect(sprintf('sqlite://%s', db))

employee_ids = dbh[:employees].select(:employee_id).where(:city => 'El Paso').to_a.collect { |e| e[:employee_id] }

loan_values = 0

dbh[:loans].to_a.each do |l|
  next unless employee_ids.include?(l[:employee_id])
  # 0.32e5 => 32,000
  loan_values += l[:amt].to_f
end

puts sprintf('value[%s]', loan_values)

