=begin
  inp:
      - Integer [-inf, +inf]
  out:
      - string repr negative, positive and zero Integers

  exp:
    - method name: signed_integer_to_string
    - cannot use Ruby conversion method to_s, String(), format etc.
    - can use integer_to_string from previous exercise    

  imp:
    -? Integer argument only
    -! prepend + if positive
    -! prepend - if negative
    -! prepend nothing if zero

  ds and algo:

    - prepended operator is:
      -> '+' if number > 0
      -> '-' if number < 0
      -< ''  if number = 0
    - return number str repr with operator prepended

=end

DIG_TO_CHAR = %w(0 1 2 3 4 5 6 7 8 9)

def integer_to_string(num)
  num_str = ''
  loop do
    ones = num % 10
    num /= 10
    num_str.prepend(DIG_TO_CHAR[ones])
    break if num == 0
  end
  num_str
end

def signed_integer_to_string(num)
  prefix = if     num > 0 then '+'
           elsif  num < 0 then '-'
           else                ''
           end
  prefix + integer_to_string(num.abs)
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0)    == '0'
