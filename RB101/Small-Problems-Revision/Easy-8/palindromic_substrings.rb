=begin

inp:
- string
out:
- list of all palindromic substring in the
  order they appear in the original string

exp:
- palindrome:
  -> reads same forward and backward
  -> case-sensitive
  -> more than one character
- list will contain duplicates
- can use 'substrings' method from previous exercise

dsl:

  >pseudo is palindrome? => true/false
  - true if str == str.reverse && str.length > 1

  >palindromic substrings
  - all_subs = substrings form string
  - palind_subs = select all that are palindromic
  - return palind_subs

=end

def substrings_at_start(str)
  substrings = Array.new
  (0...str.length).each do |i|
    substrings << str[0..i]    
  end
  substrings.sort_by { |sub| sub.length}
end

def substrings(str)
  substrings = []
  for i_start in (0...str.length)
    curr_sub = substrings_at_start(str[i_start..-1])
    substrings.concat(curr_sub)
  end
  substrings
end

def palindrome?(str)
  (str.length > 1) and (str == str.reverse)
end

def palindromes(str)
  substrings(str).select { |subs| palindrome?(subs) }
end

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]