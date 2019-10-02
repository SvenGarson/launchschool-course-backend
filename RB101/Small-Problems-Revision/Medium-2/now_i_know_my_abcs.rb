=begin

inp:
- string
out:
- true or false whether string can be
	spelled by blocks, using each block
	only once

exp:
- 2 letters per block
- cannot use both letters per block
- true if arg can be spelled using only
	one of the characters per block and
	false otherwhise
- need to handle uppercase, lowercase and mixed case
	input string

imp:
-? is tthere any overlap in the block characters,
	 so I don't have to count all of them during
	 an interview

exploration:

	- define blocks
	- for each character in input string:
		- if some block contains this character:
			-> remove that block
		- else
			- return false

	block as array of strings
	
	['BO', 'XK', etc]

impl:

	>impl 1
	- for each [char] in arg string:
		- remove each block that contains [CHAR] upcased
		- if no block was removed, return false
	- return true

	>is a block removed fro each character in the string
	- blocks = copy of BLOCKS
	- str.chars.all? do |char|	
			blocks.reject! { |block| block.include?(char.upcase) }

	or just figure out how many times each block is used
	and in case any block is used twice return false,
	true otherwhise

	>does any block contain 2 of the characters needed for 
	 the given string?
	- blocks.none? { |block| block.count >= 2 }

=end

BLOCKS = %w(BO XK DQ CP NA GT RE FS JW HU VI LY ZM)

def block_word?(str)
	blocks = BLOCKS.dup
	str.chars.all? do |char|
		blocks.reject! { |block| block.include?(char.upcase) }
	end
end

def block_word_2?(str)
	str_upper = str.upcase
	BLOCKS.none? { |block| block.count(str_upper) >= 2 }
end

puts '### Solution using removing used blocks from an array ###'
p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true

puts '### Solution checking whether each block used more than once ###'
p block_word_2?('BATCH') == true
p block_word_2?('BUTCH') == false
p block_word_2?('jest') == true