def digit_list_A(digit)
  digit.to_s.chars.map { |digit| digit.to_i}
end

def digit_list_B(digit)
  dig_str = digit.to_s.chars
  dig_arr = []
  while dig_str.size > 0
    dig_arr << dig_str.shift.to_i
  end
  dig_arr
end

puts '=== Version A ==='
p digit_list_A(12345) == [1, 2, 3, 4, 5]
p digit_list_A(7) == [7]
p digit_list_A(375290) == [3, 7, 5, 2, 9, 0]
p digit_list_A(444) == [4, 4, 4]

puts '=== Version B ==='
p digit_list_B(12345) == [1, 2, 3, 4, 5]
p digit_list_B(7) == [7]
p digit_list_B(375290) == [3, 7, 5, 2, 9, 0]
p digit_list_B(444) == [4, 4, 4]