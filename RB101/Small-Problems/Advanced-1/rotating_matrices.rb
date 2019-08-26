=begin
  in:
    same as previous exercise
  out:
    same as previous exercise, but matrix rotated 90 deg clock-wise

  require.:

    explic.:
      - method named: rotate90()
      - arg         : same
      - return      : new matrix rotated 90 deg clock-wise
    
  ds and algo:
    
    exploration: after tinkering, I found that the 90 degree, clock-wise
    rotation of an arbitrary matrix is the transpose with the rows simple
    reversed in place.

    - create new matrix with size NxM from arg size MxN
    - transpose new matrix
    - reverse the rows of the transposed matrix in place
    - return new matrix

  further exploration:
    
    inp:
      1. matrix to rotate
      2. rotation in degrees: 90; 180; 270; 360; ..
      
    explic.:
      - rotate matrix based on degrees arg

    implic.:
      -? angle in degrees always 90, 180, 270 or 360
      -? fall back if negative, zero, or number entered
         that is not on of the four mentioned above
      -! for now, don't do anything if degrees negative or zero
      -! divide degrees by 90, and rotate the matrix that
         many times. This also means that numbers between
         the four will fallback to the multiple of 90 (or
         zero) between the options, and numbers higher than
         360 will round to the correct amoount of operation:
      -! the rotation divided by 90 can be divided moduled by
         four, so only the last rotations that are not a full
         turn clock-wise are computed
          0   / 90 = 0
          90  / 90 = 1
          180 / 90 = 2
          270 / 90 = 3
          360 / 90 = 4 -> 4 % 4 = 0 -> no rotation since it's tha same result
          450 / 90 = 5 -> 5 % 4 = 1 -> one rotation
      
  
=end

def transpose(matrix)
  width = matrix[0].length
  height = matrix.length
  transp = Array.new
  0.upto(width-1) do |col|
    row = (0...height).map { |row| matrix[row][col]}
    transp << row
  end
  transp
end

def rotate90(matrix)
  transpose(matrix).each { |row| row.reverse!}
end

def rotate_by(matrix, degrees)
  return if degrees <= 0
  rot = matrix.dup
  rotation = (degrees / 90) % 4
  rotation.times { rot = rotate90(rot) }
  rot
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

puts '### Solution rotation 90 degrees ###'
p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2

puts '### Solution further exploration: rotating degrees based on parameter ###'
p matrix1 == rotate_by(matrix1, 4)
p matrix1 == rotate_by(matrix1, 8)
p matrix1 == rotate_by(matrix1, 12)
p rotate_by(matrix1, 90)  == rotate90(matrix1)
p rotate_by(matrix1, 180) == rotate90(rotate90(matrix1))
p rotate_by(matrix1, 270) == rotate90(rotate90(rotate90(matrix1)))
p rotate_by(matrix1, 360) == rotate90(rotate90(rotate90(rotate90(matrix1))))
p rotate_by(matrix1, 450) == rotate90(matrix1)
