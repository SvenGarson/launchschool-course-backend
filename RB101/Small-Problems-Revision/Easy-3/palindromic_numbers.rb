=begin
  inp:
    Integer
  out:
    - if integer is reads like palindrome -> True
    - False otherwise

  exp:
    - method name: palindromic_number?
    - palindromic number reads same forwar ans backward

  ds and algo:

    - convert Integer to string representation
    - same test and previous exercises
  
  Further exploration:

    Starting an integer literal with a zero or 0o
    makes the following literatel octal notation,
    
    And upon passing the evaluated Integer, whether
    Integer in base 10 or otherwise, the leading zeros,
    ignoring the zero for octal literal notation    ,
    are ignored since they don't change the resulting
    number.

=end

def palindromic_number?(number)
  i_str = number.to_s
  i_str == i_str.reverse
end

puts '### Solution primary question ###'
p palindromic_number?(34543)  == true
p palindromic_number?(123210) == false
p palindromic_number?(22)     == true
p palindromic_number?(5)      == true