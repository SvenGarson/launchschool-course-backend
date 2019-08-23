=begin
  input:
    string
  output:
    list of substrings that are palindromic

  requirements:
    explicit:
      - method named: palindromes
      - argument: on string
      - palindrome IS:
          same sequence of characters forwards and backwards
          case sensitive: so AbbA != Abba != abba
      - palindrome is NOT:
          single character
      - can and should use substring method
      - list ordered the way the palindromes appear,
        based on the substrings method
      - duplicated palindromes are added as often as they appear

    implicit:
      -? input string always non-empty
      -? input string always one word

  mental model:

    generate and return a list of valid palindromes from all the possible
    subtrings in arg_string and order them the way they appear, adding
    the palindromes as often as they appear

  ds and algo:

    - generate substring
    - for each substring:
      - if palindrome -> add to list
    - return list

=end

def substring_at_start(str)
  subsies = []
  str.chars.each_with_index do |char, i|
    subsies << str[0, i+1]
  end
  subsies
end

def substrings(str)
  subsies = []
  (0...str.size).each do |i|
    sub_str = str[i...str.size]
    subsies += substring_at_start(sub_str)
  end
  subsies
end

def is_palindrome?(string)
  (string == string.reverse) && string.size > 1
end

def palindromes(string)
  substrings(string).select { |sub| is_palindrome?(sub) }
end

p palindromes('abcd')  == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]