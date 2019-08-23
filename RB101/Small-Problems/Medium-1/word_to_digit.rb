=begin
  input:
    string with sentence
  output:
    the same string with number words replaced with the digit characters

  requir.:
    explic.:
      - method name: word_to_digit
      - return the same string with ...?
      - sequence of : 'one', 'two', ... lowercase

    implic.:
      -? does '... return the same string ...' mean to mutate it or just 
         'the same string' as in the same content with some changes
      -? need to handle uppercase, lowercase, mixed-case digit text
         representation
      -! the four. will be a problem when spliting at whitespaces
      -! my current solution does handle any number word contained in another
         word gracefully, just replaced every pccurence with the number character

  mental model:

    change the word for a digit in the string to it's corresponding
    character in place at return it

  ds and algo:

    - for every word => digit char in map:
      - replace occurence of word in original string with the digit char
    - return the original string

=end

WORD_DIG_HSH = {
  'one' => '1', 'two' => '2', 'three' => '3', 'four' => '4', 'five' => '5',
  'six' => '6', 'seven' => '7', 'eight' => '8', 'nine' => '9'
}

def word_to_digit(sentence)
  WORD_DIG_HSH.each_pair do |word, dig_char|
    sentence.gsub!(word, dig_char)
  end
  sentence
end

p word_to_digit('Please call me at five five five one two three four. Thanks.')
p word_to_digit('There is a freight train passing through fifth avenue!.')