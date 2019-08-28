def num_sum(ceiling)
=begin
  sum = 0
  1.upto(ceiling) { |i| sum += i}
  sum
=end
  (1..ceiling).inject(:+)
end

def num_product(ceiling)
=begin
  product = 1
  1.upto(ceiling) { |i| product *= i}
  product
=end
  (1..ceiling).inject(:*)
end

puts '>> Please enter an integer greater than 0:'
number = gets.chomp.to_i

puts "Enter 's' to compute the sum, 'p' to compute the product."
operation = gets.chomp.downcase

result = case operation
         when 's'  then num_sum(number)
         when 'p'  then num_product(number)
         end

puts "The sum of integers between #{1} and #{number} is #{result}."