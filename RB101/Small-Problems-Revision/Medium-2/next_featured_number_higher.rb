=begin

>Methdo featured
inp:
- Integer after which to look for featured number
side-effect:
- none
out:
- next featured number greater that inp or error string
	if no more featured number next

exp:
- featured number is:
	- odd
	- multiple of 7
	- it's digits are unique
- return featured number larger than inp
- return error message if no more featured numbers possible
- no more featured numbers after/including 9_999_999_999
	so the last one possible is
- take 9_999_999_999 as max fatured number since that's given
	

imp:
-? range of featured numbers possible
-? inp always positive or include negative

impl:

	>brute force:
	- from arg+1 to max_featured-1: as [curr]
		- return curr is featured
	- return error message
	
optimization:

	- checking only multiples of 7
	-	checking only mo7 that are also odd

	multiples of 7:

	[7, 14, 21, 28, 35, 42, 49]

observation:
	
	- multiples are odd/even/odd/even/odd
		so we can start from an odd multiple of seven
		and add 14 to get to the next odd one

	>impl faster
	- curr = first odd, mo7 > arg
	- until curr >= max_featured:
		# we know curr is mo7 and odd
		- return curr if digits unique
		- increment curr by 14
	- we exceeded range:
		-> return error message

=end

MAX_FEAT = 9_999_999_999
ERR_MSG = '-> There is no possible number that fulfills those requirements'

def next_odd_multiple_of_7(base)
	curr = base
	until (curr % 7) == 0 and curr.odd? and curr > base
		curr += 1
	end
	curr
end

def digits_unique?(number)
	number.to_s.chars.uniq! == nil
end

def featured(number)
	curr =  next_odd_multiple_of_7(number)
	until curr >= MAX_FEAT
		return curr if digits_unique?(curr)
		curr += 14
	end
	ERR_MSG
end

def is_featured?(number)
	number.odd? and (number % 7) == 0 and number.to_s.chars.uniq! == nil
end

def featured_brute_force(base)
	(base + 1).upto(MAX_FEAT - 1) do |curr|
		return curr if is_featured?(curr)
	end
	ERR_MSG
end

puts '### Solution using brute force checking every number in range ###'
p featured_brute_force(12) == 21
p featured_brute_force(20) == 21
p featured_brute_force(21) == 35
p featured_brute_force(997) == 1029
p featured_brute_force(1029) == 1043
p featured_brute_force(999_999) == 1_023_547
p featured_brute_force(999_999_987) == 1_023_456_987
puts featured_brute_force(9_999_999_999) # -> There is no possible number that fulfills those requirements

puts "\n### Solution starting from odd multiples of seven and incrementing by 14 ###"
p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987
puts featured(9_999_999_999) # -> There is no possible number that fulfills those requirements