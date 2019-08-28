=begin
  input:
    one string with words with
      each word being any sequence of non-blank characters
  output:
    method named: word_cap
    takes a string
    new string with original string:
      - each character downcased
      - the first character upcase
      --> i.e capitalized

  requirements:
    explicit:
      return new string
      words contain non-blank characters
      the last test shows that quoted words are to be left as they are

    implicit:
      ? what exactly is meant by 'non-blank' ?
        that could printing character, or non-white space, ... ?
      ? can we assume that the worda are separated by a space/spaces only?
  
    mental model:

      return a new string which contains the same words as the original but
      with each word being downcased and the first character capitalize.
      then return that string

    ds and algo:

      split array at space
      create new empty array
      iterate the words split:
        capitalize the word non destructively
        and add it to the array
      join words in array with a space
      return the joined string
=end

def word_cap(string)
  words_capped = string.split.map do |word|
    word.capitalize!
  end
  words_capped.join(' ')
end

puts word_cap('four score and seven')      == 'Four Score And Seven'
puts word_cap('the javaScript language')   == 'The Javascript Language'
puts word_cap('this is a "quoted" word') == 'This Is A "quoted" word'