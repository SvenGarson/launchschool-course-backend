=begin

inp:
- nth fib number in sequence starting at 1
out:
- the fib number at that sequence index

exp:
- use recursion:
	- method calls itself
	- stop condition
	- method uses it's own result

imp:
-? arg always positive integer

exploration:

	- using recursion, find the nth fib number in the
		sequence

	f(1) = 1
	f(2) = 1
	f(n) = f(n-1) + f(n-2) where n > 2

	- exit condition: arg <= 2
	- each fib number is 

=end

def fibonacci(nth)
	return 1 if nth <= 2
	fibonacci(nth - 1) + fibonacci(nth - 2)
end

p fibonacci(1) == 1
p fibonacci(2) == 1
p fibonacci(3) == 2
p fibonacci(4) == 3
p fibonacci(5) == 5
p fibonacci(12) == 144
p fibonacci(20) == 6765