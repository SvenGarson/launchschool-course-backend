=begin
  type:
    - program
  flow:
    - Please enter an integer greater than 0:
    - gets integer
    - Enter 's' to compute the sum, 'p' to compute the product.
    - gets option
    -> for 's' -> The sum of the integers between 1 and X is Y.
    -> for 'p' -> The product of the integers between 1 and X is Y.

  req:
    exp:
    
    imp:
      -? again no input validation
      -? again no range checks

  ds and algo:

    - get input -> flow
    - build array of numbers from 1 to entered inclusive
    - sum or product of the numbers
    - show result -> flow

=end

puts 'Please enter an integer greater than 0:'
ceiling = gets.chomp.to_i
puts "Enter 's' to compute the sum, 'p' to compute the product."
option = gets.chomp
numbers = (1..ceiling)
case option
when 's'
  puts "The sum of the integers between 1 and #{ceiling} is #{numbers.reduce(0, :+)}."
when 'p'
  puts "The product of the integers between 1 and #{ceiling} is #{numbers.reduce(1, :*)}."
end