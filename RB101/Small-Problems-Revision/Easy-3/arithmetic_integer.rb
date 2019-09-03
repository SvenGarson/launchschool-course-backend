=begin
  type:
    - program
  flow:
    - ==> Enter the first number:
    - 23
    - ==> Enter the second number:
    - 17
    - ==> 23 + 17 = 40
    - ==> ....
    - ==> 23 ** 17 = 1410....6103
  inp:
    1) positive int
    2) positive int
  out:
    - + - * / % ^
    in format: '==> first op second = result'

  req:
    exp:
      - no need to validate input

=end

puts '==> Enter the first number:'
first = gets.chomp.to_i
puts '==> Enter the second number:'
second = gets.chomp.to_i
puts "==> #{first} + #{second} = #{first+second}"
puts "==> #{first} - #{second} = #{first-second}"
puts "==> #{first} * #{second} = #{first*second}"
puts "==> #{first} / #{second} = #{first/second}"
puts "==> #{first} % #{second} = #{first%second}"
puts "==> #{first} ** #{second} = #{first**second}"