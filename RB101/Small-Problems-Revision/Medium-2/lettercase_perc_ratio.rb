=begin

inp:
- string with at least one character

imp:
-? can I use a helper method
-? should the returned hash contain
	 integer values for percentages that
	 have no fractional part or just use 
	 floats

out:
- hash that contains:
	- percentage of lowercase chars
	- percentage of uppercase chars
	- percentage of neither   chars

explore:

	inp: 'Ab!?'
	out:
		- lowercase perc -> (1/4)*100 = 25%
		- uppercase perc -> (1/4)*100 = 25%
		- neither   perc -> (2/4)*100 = 50%

dsal:

	>impl 1
	- total = string.length
	- upper = uppercase char count
	- lower = lowercase char count
	- neither = total - (upper + lower)
	- perc_upper = upper / total
	- perc_lower = lower / total
	- perc_neither = neither / total

	>impl 2
	- total = str.length
	- upper = str uppercase chars length
	- lower = str lowercase chars length
	- neither = total - (upper and lower)
	- return hash for total, upper, lower and neither count

Firtehr exploration:

	- round percentages to the second decimal

=end

def gen_percentage_hash(total, lower, upper, neither)
	{
		lowercase: lower.fdiv(total) * 100.0,
		uppercase: upper.fdiv(total) * 100.0,
		neither: neither.fdiv(total) * 100.0
	}
end

def letter_percentages(str)
	total = str.length
	upper = str.gsub(/[^A-Z]/, '').length
	lower = str.gsub(/[^a-z]/, '').length
	neither = total - (upper + lower)
	perc_hash = gen_percentage_hash(total, lower, upper, neither)
	# round percentages to second decimal
	perc_hash.transform_values!{ |perc| perc.round(2) }
end

p letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
p letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }
p letter_percentages('abcdefGHI') == { lowercase: 66.67, uppercase: 33.33, neither: 0.0 }