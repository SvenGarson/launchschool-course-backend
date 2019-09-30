=begin

inp:
- string
out:
- array of all substrings that start from beginning of
  the string, sorted from shortest to longest

exp:
- array of all substrings
- starting from beginning of the string
- order from shortest to longest

imp:
-? need to handle empty strings
-? always one continuous string

dsal:

  - subsies = empty array
  - iterate range [0; string.size[ through [i]:
    - substr = str from 0 to i
    - subsies add substr
  - sort subsies by length ascending order
  - return subsies

=end

def substrings_at_start(str)
  substrings = Array.new
  (0...str.length).each do |i|
    substrings << str[0..i]    
  end
  substrings.sort_by { |sub| sub.length}
end

p substrings_at_start('abc') == ['a', 'ab', 'abc']
p substrings_at_start('a') == ['a']
p substrings_at_start('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
p substrings_at_start('') == []
p substrings_at_start(' ') == [' ']