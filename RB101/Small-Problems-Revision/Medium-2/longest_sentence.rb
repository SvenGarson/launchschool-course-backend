=begin

inp:
- file and it's source text
out:
- print longest sentence and it's length based on word
	count

exp:
- sentences end with . ! or ?
- words separated by one/multiple spaces
- count words and print words in longest sentence

imp:
-? need to handle files/text of zero length, if yes how
-? can we assume that punctuation is never spaced separated from
	 last word in the sentence?
-? if punctuation can be separated by space form last word,
	 include punctuation in word count?
-? can we use some formatting when displaying the sentence
	 to make the output more readable such as:
	
	Longest sentence has 'xy' words:
	---------------------------------
	bababababababbaa....
	---------------------------------
	

exploration:

	- first split test into sentences based on ending characters
	- for every sentence:
		- count words
	- print longest sentence and how many words

impl:

	>impl 1
	- file open file denoted by arg
	- text = file text
	- sentences = text.split at either [. ! ?]
	- guard against no sentences
	- max_words = 0
	- longest_sentence = nil
	- for every [sent] in sentences:
		- curr_words = sent.length
		- if curr_words > nax_words:
			-> longest_sentence = sent
			-> max_words = curr_words
	- print longest sentence
			

further exploration:

	- in case punctuation if space separated for last word,
		it is split as a word. We coult remove any word that is
		only 1 character long and one of the 3 punctuation chars.

	>impl 1
	- file open file denoted by arg
	- text = file text
	- sentences = text.split at either [. ! ?]
	- guard against no sentences
	- max_words = 0
	- longest_sentence = nil
	- for every [sent] in sentences:
		- curr_words = sent.length
		- if curr_words > nax_words:
			-> longest_sentence = sent
			-> max_words = curr_words
	- print longest sentence

=end

def longest_sentence(file_path)
	# guard against us not being abel to open the file
	text = nil
	begin
		text = File.read(file_path)
	rescue
		puts "\nCould not read '#{file_path}'..."
		return
	end

	# guard against no sentences
	sentences = text.split(/[.!?]/)
	if sentences.empty?
		puts "\n#{file_path} does not contain any sentences..."
		return
	end
	
	longest_sentence = sentences.max_by { |sent| sent.split(' ').length }
	words = longest_sentence.split.length

	puts "\nLongest sentence of '#{file_path}' is #{words} long:"
	puts '---------------------------------------------------------'
	puts longest_sentence

end

# 86 words
longest_sentence('example.txt')
# 157 words
longest_sentence('example_2.txt')
# 1 words
longest_sentence('example_3.txt')
# 0 words
longest_sentence('example_4.txt')

