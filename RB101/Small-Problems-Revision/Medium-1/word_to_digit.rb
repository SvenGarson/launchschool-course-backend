=begin

inp:
- string -> with numbers as word
out:
- same string 'five' replaced by '5'

exploration:

	- what about the case?
	- what about spacing

exp:
- for now handle lowercase only
- return same string
- handle numbers from 0-9 inclusive
- take words as always space separated by one space

imp:
-? return new or the same string object
-? can input be upper and mixed case
-? handle numbers from [0; 9] enough
-? number string repr always space separated

impl:

	>stab
	- create hash where [K, V]:
		-> Key   = number string repr 'five'
		-> Value = number as digit character '5'
	- for each string repr key:
		- replace these occurences in arg string with the character version

	==> doesnt work for any case since we assume the substrings to be any case,
		so we should rather check substrings downcased to find the key in the hash


Further explorations:

	- handle any case (upper, lower, mixed) of number representation
	- generate allp possible strings 
	- what about when number representations are written without
		separator such ass fivesix?
	- how about formating phone number based on the length, how to
		separate it five five five eight zero ... => 555-80...

=end

CONV_HSH = {
	'zero' => '0', 'one' => '1', 'two' => '2', 'three' => '3', 'four' => '4',
	'five' => '5', 'six' => '6', 'seven' => '7', 'eight' => '8', 'nine' => '9'
}

def word_to_digit(str)
	CONV_HSH.each_pair do |str_repr, repl|
		str.gsub!(str_repr, repl)
	end
	str
end

p word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'