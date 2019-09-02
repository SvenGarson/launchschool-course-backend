=begin
  Because the String#method takes a string parameter,
  not an Integer. Simply casting the expression (40 + 2).
  two ways of dealing with this problem:
  
  1. Casting the expression (40 + 2) to a string before 
     passing it as argument with to_s
  2. Using string interpolation such as "#{(40 + 2)}"
  
=end

puts "the value of 40 + 2 is " + (40 + 2).to_s
puts "the value of 40 + 2 is #{40 + 2}"