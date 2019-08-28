=begin
  input:
    string containing at least two words
  output:
    new string containing the second last word

  requirements:
    explicit:
      method named: penultimate
      a word is any sequence of non-blank characters
      argument string contains at least two words

    implicit:
      - does blank mean a space in this context, or space, newline, tab, all ?

  mental model:

    Take the input string and split it at the blank characters/space and return the
    second last word as new string

  ds and algo:

    - split string at space
    - return the second last word

=end

def penultimate(string)
  string.split(' ')[-2]
end

p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'