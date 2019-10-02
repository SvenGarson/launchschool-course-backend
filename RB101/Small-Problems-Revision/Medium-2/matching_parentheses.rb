=begin

inp:
- string
out:
- true if parentheses are balanced
	false otherwhise

exploration:

	- () true
	- )( false

	value of ( = 1
	value of ) = -1

	- () -> (0 + 1) - 1 => 1 - 1 = 0 OK both rules
	- )( -> (0 - 1) + 1 => -1 + 1 = 0
		-> OK for zero at end
		-> NOT OK for current > 0 if new ) i.e -1
	- ((hey))) ( -> ((((0+1+1)-1)-1)-1) +1
		-> (((2-1)-1)-1) + 1
		-> ((1-1)-1) + 1
		-> (0-1) + 1  ==> RULE 2 broken cannot open close before opening
		-> 0 + 1
		-> 1        	==> RULES 1 imbalanced count of opening and cosing parenh 
	
	rules?
		1. if ) of value -1 added and current is > 0 ok
		2. value after considering each parentheses must be 0

observations:
	rules:
		- cannot open parentheses before closing:
			-> if current value -1, i.e ')', imbalanced if running
				 total is < 1
		- final sum of parentheses values must be zero
		- balanced if no parantheses

impl:

	>impl 1
	- extract = extract () from arg string
	- if extract count odd, cannot be balanced
	--> extract can be empty at this point
	- score = 0
	- for [char] in extract(which can be only parentheses) :
		- if char == ')' and score < 1:
			- return false
		- else
			- score += value of current 
	- return true i score == 0, false otherwhise

	thoughts:
	- we could guard against odd numbers of parentheses, but
		that won't make the solution any better

=end

def balanced?(str)
	extract = str.gsub(/[^()]/, '').chars
	extract.map! { |char| (char == '(' ) ? 1 : -1 }
	score = 0
	extract.each do |value|
		# imbalanced if closing before having opened
		if value == -1 and score < 1
			return false
		else
			score += value
		end
	end
	score == 0
end

p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false