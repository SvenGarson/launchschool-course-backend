=begin

inp:
- index of fibonacci number to return in sequence
	starting at 1
out:
- fib number at arg index in fib sequence

imp:
-? argument always positive

dsal:

	>stab
	- index = 3 since we start after both fib numbers
		which are both 1
	- loop:
		- next fib = last first + last second
		- if index >= arg return next fib
		- increment index
	
	>impl
	- return 1 if arg <= 2
	- last_left = 1
	- last_right = 1
	- fib = nil
	- index = 3
	- loop:
		- fib = last_left + last_right
		- break if index >= arg
		- last_left = last_right
		- last_right = fib
		- index += 1
	- return fib

	>ref
	- last = [1, 1]
	- fib = 1
	- 3.upto(nth) do |_|:
		- fib = ...
	- return fib

=end

def fibonacci(nth)
	# guard: return 1 for first 2 numbers in sequence
	return 1 if nth <= 2
	# consider only numbers in sequence after the second
	last_left = last_right = 1
	fib = nil
	index = 3
	loop do
		fib = last_left + last_right
		break if index >= nth
		last_left, last_right = last_right, fib
		index += 1
	end
	fib
end

def fibonacci_short(nth)
	last = [1, 1]
	fib = 1
	3.upto(nth) do |_|
		fib = last.first + last.last
		last[0], last[1] = last.last, fib 
	end
	fib
end

puts '### Solution using Kernel#loop ###'
p fibonacci(-5) == 1
p fibonacci(0) == 1
p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(6) == 8
p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
# p fibonacci(100_001) # => 4202692702.....8285979669707537501

puts '### Solution using Integer#upto ###'
p fibonacci_short(-5) == 1
p fibonacci_short(0) == 1
p fibonacci_short(1) == 1
p fibonacci_short(2) == 1
p fibonacci_short(6) == 8
p fibonacci_short(20) == 6765
p fibonacci_short(100) == 354224848179261915075
# p fibonacci_short(100_001) # => 4202692702.....8285979669707537501