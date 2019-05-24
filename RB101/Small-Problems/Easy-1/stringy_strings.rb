def stringy(count, opt=1)

  numbers = []
  num = (opt == 1) ? 1 : 0

  count.times do |index|
    numbers << num
    num = (num == 1) ? 0 : 1
  end

  numbers.join

end

puts '=== Original ==='
puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

puts '=== Inverted Order ==='
puts stringy(6, 0) == '010101'
puts stringy(9, 0) == '010101010'
puts stringy(4, 0) == '0101'
puts stringy(7, 0) == '0101010'