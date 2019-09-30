=begin

inp:
- string
out:
- string with arg consonants doubled

exp:
- do not double:
  -> vowels (a e i o u)
  -> digits
  -> punctuation
  -> whitespace
- arg str empty -> return empty str
- consonant is character that is not a vowel

imp:
-? what's a consonant

dsal:

  >pseudo  
  - res = new empty string
  - for every char in arg:
    - if chat i consonant
      -> add char twice
    - else
      -> add char once
  - return res

  >pseudo consonant
  - alpha = a through z upper and lower
  - vowels = a e i o u
  - consonants = alpha - vowels
  
  so consonant is alpha that is not a vowel

=end

def is_consonant?(char)
  char = char.downcase
  char =~ /[a-z]/ && 'aeiou'.include?(char) == false
end

def double_consonants(str)
  res = ''
  str.chars.each do |char|
    multiplier = is_consonant?(char) ? 2 : 1
    res << char * multiplier
  end
  res
end

p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""