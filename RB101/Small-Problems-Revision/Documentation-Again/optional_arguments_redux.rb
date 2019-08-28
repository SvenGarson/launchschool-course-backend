require 'date'

puts Date.new
puts Date.new(2016)
puts Date.new(2016, 5)
puts Date.new(2016, 5, 13)

=begin

  This code will print:
    
    -4712-01-01   -> value of defaulted parameters
    2016-01-01
    2016-05-01
    2016-05-13

=end