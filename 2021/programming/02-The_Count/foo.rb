#!/bin/env ruby
## foo.rb - it's not quite the dollar qord programming question, but it's close

require 'pry'
require 'socket'

def chr2value(chr)
  chr.ord - 97
end

def word2value(word)
  total = 0
  word.split('').each do |c|
    total += chr2value(c)
  end
  total
end

host = 'code.deadface.io'
port = 50_000

s = TCPSocket.new(host, port)
seen = Array.new


while line = s.gets
  seen << line
  puts line.chop

  if line.match(/Your word is:\s(\w+)/)
    v = word2value($1)
    puts sprintf('word[%s] value[%d]', $1, v)
    s.puts(v)
  end

end
