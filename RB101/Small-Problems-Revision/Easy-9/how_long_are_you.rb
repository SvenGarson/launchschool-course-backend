=begin

inp:
- string with words separated by exactly one space
out:
- array that contains word with space and character
  count appended -> 'Hey' ==> 'Hey 3'

exp:
- string can be empty
- words separated by one space

dsal:

  >pseudo
  - words = split string into words at each space
  - for each word in words:
    - len = word.length
    - append string = ' ' + len
    - word += append string
  - return updated words

=end

def word_lengths(str)
  words = str.split(' ')
  words.map! do |word|
    append_str = " #{word.length}"
    word << append_str
  end
end

p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]

p word_lengths("baseball hot dogs and apple pie") ==
  ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]

p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]

p word_lengths("Supercalifragilisticexpialidocious") ==
  ["Supercalifragilisticexpialidocious 34"]

p word_lengths("") == []