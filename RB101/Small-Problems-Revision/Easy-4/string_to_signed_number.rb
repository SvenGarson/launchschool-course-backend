=begin
  inp:
    - string representation of integer
  out:
    - if arg first char +, return positive Integer
    - if arg first char -, reutnr negative Integer
    - if arg first char not - or +, default to positive Integer
  
  exp:
    - string always contains valid number
    - cannot use String#to_i, Integer constructor
    - method called: string_to_signed_integer
    - can use string_to_integer or previous exercise

  ds and algo:

    - if first char -
      -> return negative number
    - else
      - return positive number

    - if first char '-'
      - remove minus from string
      - return integer repr of that string
    - else
      - remove + from number string, if any
      - return integer repr of that string
    
=end

def string_to_integer(num_str)
  mult = 1
  accum = 0
  for char in num_str.chars.reverse
    dig = char.ord - '0'.ord
    accum += dig * mult
    mult *= 10
  end
  accum
end

def string_to_signed_integer(num_str)
  if num_str.start_with?('-')
    -string_to_integer(num_str[1..-1])
  else
    string_to_integer(num_str.gsub(/[+]/, ''))
  end
end

p string_to_signed_integer('4321') == 4321
p string_to_signed_integer('-570') == -570
p string_to_signed_integer('+100') == 100