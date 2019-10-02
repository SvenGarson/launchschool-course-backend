=begin

inp:
- again sequence number of desired fib numbers
	last digit, starting at 1
out:
- the last digits of the fib number at sequence spot
	arg/nth a integer

imp:
-? return integer that is the last digit

dsal:

	>impl 1
	- fib = fib number for nth
	- return ones place as integer

=end

def fibonacci(nth)
	last = [1, 1]
	fib = 1
	3.upto(nth) do |_|
		fib = last.first + last.last
		last[0], last[1] = last.last, fib 
	end
	fib
end

def fibonacci_last(nth)
	fibonacci(nth) % 10
end

p fibonacci_last(15) == 0        # -> 0  (the 15th Fibonacci number is 610)
p fibonacci_last(20) == 5   # -> 5 (the 20th Fibonacci number is 6765)
p fibonacci_last(100) == 5       # -> 5 (the 100th Fibonacci number is 354224848179261915075)
p fibonacci_last(100_001) ==  1 # -> 1 (this is a 20899 digit number)
p fibonacci_last(1_000_007) == 3# -> 3 (this is a 208989 digit number)
fibonacci_last(123456789) # -> 4