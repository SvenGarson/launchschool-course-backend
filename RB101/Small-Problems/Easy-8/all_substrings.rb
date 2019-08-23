=begin
  input:
    string
  output:
    see example

  requirements:
    explict: substrings
      list ordered from shortes to longest(i.e last) substring/string
    implicit:
      -? input always one word, i.e seqence of:
          - alphabetical characters
          - alphanumeric characters
          - non-blank characters
      -? input always non-empty

  examples:

    inp: 'abc'
    out: ['a', 'ab', 'abc',
          'b', 'bc'
          'c'
         ]

  ds and algo:

  1st approach using substring_ar_start

    - init accum list
    - for every substring in the arg_str starting with full word,
      then from the second character until the last:
        - create list of increasingly ordered substrings of current substring
        - add list object to the accum list
    - return accum list

  2nd approach without substring_ar_start:

    - init accum list
    - for every substring, whole word, start from secon char, to last, ... :
      - construct sub-sub string from sub, first char, first two etc
      - add sub-sub to the list
    - return accum list


=end

def substring_at_start(str)
  subsies = []
  str.chars.each_with_index do |char, i|
    subsies << str[0, i+1]
  end
  subsies
end

def substrings_2(str)
  subsies = []
  (0...str.size).each do |i|
    sub_str = str[i..-1]
    (0...sub_str.size).each do |j|
      subsies << sub_str[0..j]
    end
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

puts '### Solution using substring_at_start method ###'
p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]

puts '### Solution using nothing but iteration ###'
p substrings_2('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]