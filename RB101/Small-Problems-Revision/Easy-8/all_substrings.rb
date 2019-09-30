=begin

inp:
- string
out:
- array of all substrings from index
  0 to string length - 1

exp:
- can use 'substrings_at_start' from previous exercise

dsal:

  - substrings = new array
  - for [start] in range [0; strlen[ :
    - subsies = substrings at start(start...strlen)
    - substrings << sub
  - return substrings

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

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde', 
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]