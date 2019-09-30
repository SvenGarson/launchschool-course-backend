=begin

inp:
- noun, verb, adjective, adverb                    
out:
- Do you VERB your ADJECTIVE NOUN ADVERB? That's hilarious!

flow:
1. Enter a noun: xyz
2. Enter a verb: xyz
3. Enter an adjective: blue
4. Enter an adverb: xyz
5. -- Empty line --
6. Format outpuot

Further exploration:

- add random prefabricated sentences

  >pseudo, random sentences
  - flow as before to get nou, verb etc
  - choose random sentence from array
  - substitute for polled words
  - show sentence

  >storing sentences and replacing words:
    - sentence format "bla bla VERB bla ADJ etc."
    - sub VERB fo input
    - ....
  
  >pseudo madlibs random
    - prompt inputs
    - get random sentence
    - subs words for the ones input
    - show sentence

=end

MADLIBS = [
  %(Do you VERB your ADJ NOUN ADV? That's hilarious!),
  %(The ADJ NOUN VERBs ADV over the lazy dog.),
  %(The NOUN ADV VERBs up ADJ Joe's turtle.)
]

def mad_subs(str, noun, verb, adj, adv)
  madlibs = String.new(str)
  madlibs.gsub!('NOUN', noun)
  madlibs.gsub!('ADJ', adj)
  madlibs.gsub!('VERB', verb)
  madlibs.gsub!('ADV', adv)
  madlibs
end

print 'Enter a noun: '
noun = gets.chomp
print 'Enter a verb: '
verb = gets.chomp
print 'Enter an adjective: '
adj = gets.chomp
print 'Enter an adverb: '
adv = gets.chomp

madlib = mad_subs(MADLIBS.sample, noun, verb, adj, adv)

puts "\n#{madlib}"