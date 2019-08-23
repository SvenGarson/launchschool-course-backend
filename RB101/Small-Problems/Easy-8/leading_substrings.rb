=begin
  input:
    string
  output:
    - array that contains all substrings from first character
      to first 2, first 3 until eventually the whole word from
      the shortest to the longest

  requirements:
    explict:
      method name: substring_at_start
      list ordered from shortes to longest(i.e last) substring/string
    implicit:
      -? input always one word, i.e seqence of:
          - alphabetical characters
          - alphanumeric characters
          - non-blank characters
      -? input always non-empty

  mental model:

    construct a list of substrings starting with the
    first character, then first two all the way to and including the full
    word and return it sorted by increasing length

  ds and algo:

    - init empty array
    - go trough every character:
        - add string to new string from arg_str[0] to the current character
    return list (is already ordered from shortest to longest sub-/string)

=end

def substring_at_start(str)
  subsies = []
  str.chars.each_with_index do |char, i|
    subsies << str[0, i+1]
  end
  subsies
end

p substring_at_start('abc')   == ['a', 'ab', 'abc']
p substring_at_start('a')     == ['a']
p substring_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']