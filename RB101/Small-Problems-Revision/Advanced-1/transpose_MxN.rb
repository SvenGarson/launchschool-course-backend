=begin

>Method 'transpose'
inp:
- matrix as in previous exercise (nested array of numbers)
- can be any size but at least 1 row and 1 column
out: 
- return a new transposed matrix with the
	the sizing of input matrix MxN reversed to NxM

imp:
-? still return a new matrix and do not mutate the argument

impl:

	The solution from before already covers the requirements

=end

def gen_matrix(rows, cols)
	matrix = Array.new
	rows.times{ |_| matrix << Array.new(cols, 0)}
	matrix
end

def transpose(matrix)
	rows = matrix.size
	cols = matrix.first.size
	dest = gen_matrix(cols, rows)
	for i in (0...rows)
		for j in (0...cols)
			dest[j][i] = matrix[i][j]
		end
	end
	dest
end

p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]
