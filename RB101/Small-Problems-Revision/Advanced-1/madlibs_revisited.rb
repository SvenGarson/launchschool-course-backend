=begin

inp:
1. text file that contains madlibs sentences
2. nounse,adverbs, etc in the program to replace words
	 in the text
out:
- print text with marked word replaced with random
	N/ADV etc randomly

exp:
- read text from text file
- words can be hardcoded
- plug words in randomly

impl:

	>text file
	- contains lines of text with the markers:
		- VERB / ADV / NOUN / ADJ
		to be replaced with random ones before printing

	>replacement words
	- just use a hash that has a list of a category of 
		words where the key to the list of word is the same
		as the marker in the source tex.

	>imp 1
	- load text file and check errors:
		- text empty
		- file could not be opened
	- repleace each token VERB, ADV, ADJ, NOUN with a sample word
		from data hash
	- print that string with replaced words

	>imp 1
	- load text file an check for:
		- file load error?
		- string empty?
	- replace every occurence of token with a sample of that category
	- print the string

Further exploration:

	- automatically adjust text inserted to the case	
		of the word in the source file, which comes in handy
		if the word to be replaced is the first one in a sentence

=end

FILE_PATH = 'madlibs.txt'

REPLACEMENTS = {
	'VERB' => %w(licks runs sleeps whistles lingers shudders mumbles eats cries).freeze,
	'ADV'  => %w(noisily quickly cunningly beastly effectively humbly swiftly slowly).freeze,
	'NOUN' => %w(cat dog house tail wallet can book butt robe key).freeze,
	'ADJ'  => %w(yellow big tiny awesome heavy fat squeeky light flat wide fluffy).freeze
}

def replace_with_random_samples(str, pattern_str, selection)
	str.gsub!(pattern_str){ |_| selection.sample}
end

text = File.read(FILE_PATH)
if text.empty?
	puts "#{FILE_PATH} does not contain any text ..."
	exit(false)
end

replace_with_random_samples(text, 'VERB', REPLACEMENTS['VERB'] )
replace_with_random_samples(text, 'ADV', REPLACEMENTS['ADV'] )
replace_with_random_samples(text, 'NOUN', REPLACEMENTS['NOUN'] )
replace_with_random_samples(text, 'ADJ', REPLACEMENTS['ADJ'] )


puts text



