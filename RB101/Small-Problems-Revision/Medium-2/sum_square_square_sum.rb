=begin

>Method
inp:
- n = first n positive integers
out:
- result = (sum(first)^2) - (sum(squares of first n))

imp:
-? range of first n always positive

explore:

	inp: 3
	out: 22

	first n positive integers = [1, 2, 3]
	
		1. square of sums = (1+2+3)^2 = 6^2 = 36
		2. sum of squares = (1^2 + 2^2 + 3^3) = 1 + 4 + 9 = 14
		3. result = 1. - 2. = 36 - 14 = 22

impl:

	>impl 1
	- sq_o_sum = numbers.sum**2
	- sum_o_sq = numbers.map{ |num| num**2 }.sum
	- return sq_o_sum - sum_o_sq

=end

def sum_square_difference(first_n)
	numbers = (1..first_n)
	sq_o_sum = numbers.sum**2
	sum_o_sq = numbers.map{ |num| num**2 }.sum
	sq_o_sum - sum_o_sq
end

p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150