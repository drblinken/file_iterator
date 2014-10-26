#!/usr/bin/env ruby
# two little examples, call with 
#    ./example.rb example.rb

require 'file_iterator'
# for testing local changes use this import:
# require_relative 'lib/file_iterator.rb'

# iterate through file given as parameter
fi = FileIterator::FileIterator.new
fi.iterate do | line, out | 
	out.puts line 
end

# read a file of integers and sum them up
sum = FileIterator::FileIterator.new('example-data.txt').to_a(&:to_i).inject(&:+)
puts "sum: #{sum}"

