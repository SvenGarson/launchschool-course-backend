=begin

inp:
- string that contains at least 2 words,
  separated by blank
out:
- next to last word of string

exp:
- arg string has at least 2 words
- word = any sqeuence of non-blank characters

imp:
-? return new string

dsal:

  >pseudo initial:
  - split string at blank character
  - retreive and return next to last word in splits

  further exploration:

  - handle string with <= 1 words, if no second
    to last word -> return empty string

  >pseudo strin fwith less than 2 words:
  - split string at blanks
  - if split >= 2 words:
    -> return next to last
  - else
    -> return empty string

  further exploration:

    - get middle of a word of a sentence/phrase.
      Build and elaborate on it's edge cases.

    potential edge cases:
    - empty string
    - word can be any printing character
    - one word only
    - even amount of words, i.e no real 'middle'
    - what is considered a word, how are words separated

    inp:
    - string that contains words separated by blank characters
      string can have any length, and number of blank seperated
      words or be empty
    out:
    - center word of input string or empty if there's not 'center

    exp:
    - output string:
      -> empty if:
          - string empty or even amount of words
      -> word if:
          - 1 odd amount of words
    '
    dsal:

      > pseudo: center word
      - if string empty of words.length even
        -> return empty string
      - else
        - return splits[word.s / 2]
      
        
  
=end

def center_word(str)
  splits = str.split
  count = splits.length
  count.even? ? '' : splits[(count / 2).floor]
end

def penultimate_addon(str)
  words = str.split
  (words.length >= 2) ? words[-2] : ''
end

def penultimate(str)
  str.split[-2]
end

puts '### Solution to initial problem ###'
p penultimate('last word') == 'last'
p penultimate('Launch School is great!') == 'is'

puts '### Solution to further exploration, futher edge cases ###'
p penultimate_addon('notenough') == ''
p penultimate_addon('') == ''
p penultimate_addon(' ') == ''

puts '### Solution to center word after establishing some edge cases ###'
p center_word('') == ''
p center_word('this_is_center') == 'this_is_center'
p center_word('first this_is_center last') == 'this_is_center'
p center_word('even wordcount') == ''
p center_word('_ ! _') == '!'
