=begin

  inp:
    - string that contains double characters
  out:
    - new string with consecutive characters
      collapsed into a single one

  exp:
    - method name: crunch
    - cannot use String#squeeze or String#squeeze!
  imp:
    -! empty string results in empty string

  ds and algo:

    - res = new empty string
    - for each char in string:
      - if char is different from last char in res
        -> add char
    - return res

  further exploration:
    
    1) We stop iterating 1 before the index hits tex.length because
       otherwhise we will read from an index that is out of bounds
       which in turn will return nill, which in turn cannot be pushed
       onto a string.

    2) Used String#chars and for loop ,for a change, in the solution

=end

def crunch(str)
  res = ''
  for char in str.chars
    res << char if char != res[-1]
  end
  res
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''
