=begin
  inp:
    same as previous exercise but MxN instead NxN
  out:
    same as previoous exercise, but from MxN to NxM

  requir.:
    
    explic.:
      - method name: transpose
      - arg        : same as previous
      - return     : same as previous but MxN -> NxM  
      - works with any matrix with a least 1 row and 1 col
    
  ds and algo:

    exploration:
    if arg matrix is converted from MxN to NxM, then first count
    the width and height and create a new matrix that size
    
    so if input  matrix: 3x2
          output matrix: 2x3

    the mapping is the same when the sizing of the new matrix is
    correct

    - new height = old width
    - new_width  = old height
    - create new empty matrix object
    - map the same way as before ...

    - iterative approach:
      - width  = old[0].length
      - height = old.length
      - transpose = empty array
      - for every column [c] in width
        - new array from [0][c] to [height-1][c]
        - add new array to transp
    - return transpose

=end

def transpose_2(matrix)
  width = matrix[0].length
  height = matrix.length
  transp = Array.new
  0.upto(width-1) do |col|
    row = (0...height).map { |row| matrix[row][col]}
    transp << row
  end
  transp
end

def transpose(matrix)
  width = matrix.size
  height = matrix[0].size
  transp = Array.new(height) { Array.new(width) { 0 } }
  0.upto(height-1) do |y|
    0.upto(width-1) do |x|
      transp[y][x] = matrix[x][y]
    end
  end
  transp
end



puts '### First solution simply swapping x and y coordinates on iteration ###'
p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
[[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]

puts '### Second solution with iterative approach ###'
p transpose_2([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose_2([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose_2([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
[[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose_2([[1]]) == [[1]]