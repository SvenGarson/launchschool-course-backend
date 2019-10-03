=begin

>Method 'transpose'
inp: nested array matrix
out: new transposed matrix as nested array

exp:
- cannot use transpose mehod or matrix class
- do not modify argument matrix

explore:
	
		base      target
	[1, 2, 3]  [1, 4, 7]
	[4, 5, 6]  [2, 5, 8]
	[7, 8, 9]  [3, 6, 9]

	target [i][j] == base[j][i]

	i = 2 and j = 0

	target[2][0] == base[0][2]
	3 == 3
	OK!

impl:

	- dest = new matrix
	- iterate over rows [i] and columns [k]:
		- dest[j][i] = arg[i][j]
	- return dest

=end

def gen_matrix(rows, cols)
	matrix = Array.new
	rows.times{ |_| matrix << Array.new(cols, 0)}
	matrix
end

def transpose(matrix)
	rows = matrix.size
	cols = matrix[0].size
	dest = gen_matrix(rows, cols)
	for i in (0...rows)
		for j in (0...cols)
			dest[j][i] = matrix[i][j]
		end
	end
	dest
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]