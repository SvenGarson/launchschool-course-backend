=begin
  in:
    count ceileing of numbers for sum/square, [1, arg]
  out:
    (sum[1, arg]^2) - (sum of squares[1, arg])

  requir.:
    
    explic.:
      - method name: sum_square_difference()
      - arg        : Integer (as given by tests)
      - return     : square of sums - sum of squares
      - range goes from 1 to arg inclusive

    implic.:
      -? parameter always >= 1

  ds and algo:
    
    - create range (1..arg)
    - L = (sum range) ^ 2
    - R = sum (squared range)
    - return L - R

=end

def sum_square_difference(ceiling)
  range = (1..ceiling)
  sum_squared  = range.reduce(0, :+) ** 2
  squared_sums = range.reduce(0) { |memo, v| memo + (v**2) }
  sum_squared - squared_sums
end

p sum_square_difference(3)   == 22
p sum_square_difference(10)  == 2640
p sum_square_difference(1)   == 0
p sum_square_difference(100) == 25164150