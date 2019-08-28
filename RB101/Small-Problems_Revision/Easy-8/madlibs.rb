=begin
  input:
    1. noun
    2. verb
    3. adverb
    4. adjective
  output:
    generate string in format:
      - Do you [verb] your [adjective] [noun] [adverb]? That's hilarious!
  
  requirements:
    explicit:
      - by examples as for words in turn:
        1. Enter a noun: ???
        2. Enter a verb: ???
        3. Enter an adjective: ???
        4. Enter an adverb: ???
    implicit:
      -? can valid input be expected
      -? need to handle empty or number or ? input

  mental model:

    Request a verb, adjective, noun and adverb in turn, then generate and
    show a string that contains a the words injected into a madlib story.

  ds and algo:

    - get and store word as in explicit requirements
    - generate a string/ story for the words given
    - show the string/madlib

  helper methods:
    - get word (message):
      -> prompts message, reads and returns input read unchecked
    - generate madlib (noun, verb, adjective, adverb):
      -> generate string in the format given in the tests using user input

=end

def prompt_for_word(prompt)
  print "#{prompt}: "
  gets.chomp
end

def gen_madlib(noun, verb, adjective, adverb)
  "Do you #{verb} your #{adjective} #{noun} #{adverb}? That's hilarious!"
end

noun      = prompt_for_word('Enter a noun')
verb      = prompt_for_word('Enter a verb')
adjective = prompt_for_word('Enter an adjective')
adverb    = prompt_for_word('Enter an adverb')
madlib_str = gen_madlib(noun, verb, adjective, adverb)
puts "\n#{madlib_str}\n"