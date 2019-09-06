=begin
  inp:
    - string
  out:
    - True if palindrome
    - False if not palindrome

  req:
    exp:
      - method name: real_palindrome?
      - palindromes:
        - case in-sensitive
        - ignore non-alphanumeric characters
        -> ignore all but alphabetical and digits
      - can use solution method palindrome? of previous exercise

  ds and algo:
  
    - extract all alpha-numeric characters into new string
    - downcase str
    - result = (str == str.reverse)
  
=end

def real_palindrome?(str)
  alphanum_low = str.downcase.gsub(/[^0-9a-z]/, '')
  alphanum_low == alphanum_low.reverse
end

p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true
p real_palindrome?("Madam, I'm Adam") ==  true
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false