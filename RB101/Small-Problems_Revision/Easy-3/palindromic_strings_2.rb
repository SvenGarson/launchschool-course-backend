ALPHA_NUMERIC_S = ('0'..'9').to_a + ('A'..'Z').to_a + ('a'..'z').to_a

def real_palindrome?(string)
  alphanum_str = string.chars.map do |ch|
    if ALPHA_NUMERIC_S.include?(ch)
      ch.downcase
    else
      ''
    end
  end
  alphanum_str = alphanum_str.join
  alphanum_str == alphanum_str.reverse
end

def real_palindrome_2?(string)
  string = string.downcase.delete('^a-z0-9')
  string == string.reverse
end

puts '=== Solution A ==='
p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true
p real_palindrome?("Madam, I'm Adam") == true
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false

puts '=== Given Solution ==='
p real_palindrome_2?('madam') == true
p real_palindrome_2?('Madam') == true
p real_palindrome_2?("Madam, I'm Adam") == true
p real_palindrome_2?('356653') == true
p real_palindrome_2?('356a653') == true
p real_palindrome_2?('123ab321') == false