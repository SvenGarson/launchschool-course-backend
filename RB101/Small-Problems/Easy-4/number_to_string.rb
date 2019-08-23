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

p integer_to_string(4321) == '4321'
p integer_to_string(0)    == '0'
p integer_to_string(5000) == '5000'