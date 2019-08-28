def palindrome?(obj)
  obj == obj.reverse
end

puts '=== Palindromic Strings ==='
p palindrome?('madam') == true
p palindrome?('Madam') == false
p palindrome?("madam i'm madam") == false
p palindrome?('356653') == true

puts '=== Palindromic Arrays ==='
p palindrome?([true, 1, 'Hello', 'Hello', 1, true]) == true
p palindrome?([true, 1, 'mello', 'Hello', 1, true]) == false
p palindrome?([false, 1, 'ABC', 'ABC', 1, true]) == false
p palindrome?([123456, 1, 'Hello', 'Hello', 1, 123456]) == true