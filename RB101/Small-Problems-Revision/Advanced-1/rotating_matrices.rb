=begin

>method 'rotate90'
inp: matrix as in previous exercise
out: matrix rotated clock-whise by 90 degrees

imp:
-? still return a new matrix as previously
-? can we use the methods we designed in previous
	 exercises

impl:

	>imp 1
	- transp = transpose argument MxN matrix into new NxM
	- revers each rows of transp in place
	- return that matrix

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

def rotate90(matrix)
	transpose(matrix).each { |row| row.reverse! }
end

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2