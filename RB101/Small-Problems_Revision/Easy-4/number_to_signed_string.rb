DIGITS = ['0','1','2','3','4','5','6','7','8','9']

def integer_to_string(number)
  number_str = ''
  while number > 0 do
    ones = number % 10
    number_str.prepend(DIGITS[ones])
    number /= 10
  end
  number_str.size > 0 ? number_str : '0'
end

def signed_integer_to_string(number)
  num_str = integer_to_string(number.abs)
  sign = ''
  case number <=> 0
  when -1 then sign = '-'
  when  1 then sign == '+'
  end
  num_str.prepend(sign)
  puts "#{sign} ==> #{num_str}"
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0)    == '0'