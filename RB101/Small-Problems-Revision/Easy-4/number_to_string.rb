=begin
  inp:
    - Integer [0, +inf]
  out:
    - string repr of arg

  exp:
    - method name: integer_to_string
    - cannot use Integer#to_s, String(), Kernel#format etc.
    
  ds and algo:

  - str = new string
  - loop:
    - ones = number % 10 (0 to 9)
    - number /= 10
    - str << DIG_CHARS[ones]
    - break if number == 0
  - reverse str since we started at ones place
  - return str

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

p integer_to_string(4321) == '4321'
p integer_to_string(0)    == '0'
p integer_to_string(5000) == '5000'