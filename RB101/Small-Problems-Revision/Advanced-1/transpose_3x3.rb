=begin
  in:
    3x3 matrix in array-array format:
      [
        [0,1,2],
        [3,4,5],
        [6,7,8]
      ]
  out:
    - new matrix object, same format
    - transpose of arg

  requir.:

    explic.:
      - method name: transpose
      - arg        : matrix in nested array format
      - return     : new matrix, transpose of arg
      - do not mutate arg
      - cannot use Array#transpose
      - cannnot use Matrix class
      
    implic.:


  mental model: take a nested array as 3x3 matrix and compute
  it's transpose by building and returning a new matrix of the
  same format where the old rows now become columns in the new
  matrix.

  test cases:
  
    in:
          1 4 3
          5 7 9
          8 2 6         

    out:

          1 5 8
          4 7 2
          3 9 6

    ds and algo:

      - iterate y matrix range (0...3) as [y]:
        - iterate x matrix range (0...3) as [x]:
          - tmp = arg[y][x]
          - transpose[x][y] = tmp
      - return new matrix    

=end

def transpose(matrix)
  transp = Array.new(3) { [] }
  0.upto(2) do |y|
    0.upto(2) do |x|
      transp[x][y] = matrix[y][x]
    end  
  end
transp
end

matrix = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

new_matrix = transpose(matrix)

p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

matrix_id = [
  [1, 0, 0],
  [0, 1, 0],
  [0, 0, 1]
]

p transpose(matrix_id) == matrix_id
p matrix_id == [[1, 0, 0], [0, 1, 0], [0, 0, 1]]