def swap_ends!(str)
  str[0], str[-1] = str[-1], str[0]
  str
end

def swap(str)
  str.split(' ').map!{ |sub| swap_ends!(sub)}.join(' ')
end

=begin
    split at space
    map to right string
    join subs together
=end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'

=begin
  input:
    space separated string of word of at least length 1
    string contains at least one word
    string contains only words and spaces

  output:
    string in which the first and last character of every
    word is swapped

  requirements:
    explicit:

    implicit:

  questions:
    does 'word' mean sequence of alphanumerics?
    mutate and return the original string or return a new one

=end