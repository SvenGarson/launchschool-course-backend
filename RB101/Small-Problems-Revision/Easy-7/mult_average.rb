=begin

inp:
- non empty Integer array
out:
- average of all Int's rounded to 3rd decimal

exp:
- display average rounded to third decimal place
- array never empty

dsal:

  - product of all Integers in array
  - return product / array length

=end

def show_multiplicative_average(arr)
  prod = arr.reduce(:*).to_f
  avg = prod.fdiv(arr.length).round(3)
  "The result is #{format('%.3f', avg)}"
end

p show_multiplicative_average([3, 5]) == 'The result is 7.500'
# The result is 7.500

p show_multiplicative_average([6]) == 'The result is 6.000'
# The result is 6.000

p show_multiplicative_average([2, 5, 7, 11, 13, 17]) == 'The result is 28361.667'
# The result is 28361.667