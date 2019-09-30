=begin

inp:
- string
out:
- string which each word capitalized,
  i.e, first char uppercase, rest lowercase

exp:
- return new string
- word = any sequence of non blank character
- for now consider space only as whitespace:
- capitalize only first chracter, if that is non-alpha,
  then do nothing
imp:
-? which whitespace to consider
-? argument always non-zero length
-? string always separacted by one blank,
   this will matter for joining the string

dsal:

  - split string at space
  - for each word in split arr
    - capitalize the word
  - join capitalized splits and return it

=end

def word_cap(str)
  str.split.map! { |word| word.capitalize }.join(' ')
end

p word_cap('four score and seven') == 'Four Score And Seven'
p word_cap('the javaScript language') == 'The Javascript Language'
p word_cap('this is a "quoted" word') == 'This Is A "quoted" Word'