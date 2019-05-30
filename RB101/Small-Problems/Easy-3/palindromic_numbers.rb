def palindromic_number?(number)
  puts "input:  #{number}"
end

puts '=== Palindromic Numbers ==='
p palindromic_number?(34543) == true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true


=begin

  A leading zero before an integer makes it an octal literal.
  The problem is that the octal is evaluated when it is passed
  to the method, so inside the method it is unknown whether the
  number has been evaluated from an octal, or any litarel for
  that matter, or simply entered as the number it is.

=end