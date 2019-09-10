=begin
  
  inp:
    - string of space separated words
  out:
    - string with each first and last char of
      words swapped

  exp:
    - method name: swap
    - every word contains at least one letter
    - string contains at least one word
    - each string only words and spaces

  imp:
    -? every word separated by exactly one space
    -? does 'return a string' mean a new one with
       the changes made or same string object

  ds and algo:

    - splits = split string at space
    - for every word in splits:
      - if word length <= 1 next
      - swap character first and last
    - join string with space
    - return it

  further exploration:

  The problem with invoking the method by passing ot
  the two characters from the string is that the 
  String#[] method returns a substring containg the
  character at that index. The method does indeed swap
  the two characters so that th references handed to the
  method are now swapped. This is only a re-binding of
  local variables though and has no effect on external
  state, especially since we are working with new strings.

  If we were though, to save the result of swap_...characters
  into a variable, which would then hold the swapped
  characters, we could reassign the new characters to our
  word, but that would make the code longer and less clear.

=end

def swap(str)
  str.split.each do |word|
    next if word.length < 2
    word[0], word[-1] = word[-1], word[0]
  end.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'
