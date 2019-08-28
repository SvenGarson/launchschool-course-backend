=begin
  input:
    string
  output:
    list of substrings with space and number of characters appended

  requirements:

    explicit:
      - method name: word_lengths
      - argument:
        string with:
          - word separated by exactly one space
          - any substring of non-space characters is a word
      - for each substring append a space and the count of chars
        in the word
      - empty strings result in an empty array
  
    implicit:
      n/a

  ds and algo:

    - create array of words split at space
    - for every word in the split array:
      - count characters of the current wors
      - append ' [character count]' to the 
        original word
    - return the split array

=end

def word_lengths(string)
  string.split.map! { |word| "#{word} #{word.length}" }
end

p word_lengths('cow sheep chicken') == ['cow 3', 'sheep 5', 'chicken 7']
p word_lengths('baseball hot dogs and apple pie') ==
  ['baseball 8', 'hot 3', 'dogs 4', 'and 3', 'apple 5', 'pie 3']
p word_lengths("It ain't easy, is it?") == 
  ['It 2', "ain't 5", 'easy, 5', 'is 2', 'it? 3']
p word_lengths('Supercalifragilisticexpialidocious') == 
  ['Supercalifragilisticexpialidocious 34']
p word_lengths('') == []