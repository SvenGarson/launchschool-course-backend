=begin
  input:
    non-empty integer array
  output:
    print multiplicative average of all the integers in the array
      rounded to 3 decimal places

  requirements:
    explicit:
      method name: show_multiplicative_average
      parameter: non-empty array of integers

    implicit:
      n/a    

  mental model:

    Multiply all the integers in the array and divide the result by the number
    of initegers in the array and return that value

  ds and algo:

    accum = 1
    for every number in the input array:
        accum *= number
    result = accum / array.size

=end

def show_multiplicative_average(array)
  multavg = array.inject(:*).to_f / array.size
  puts format("The result is %.3f", multavg)
end

show_multiplicative_average([3, 5])

show_multiplicative_average([6])

show_multiplicative_average([2,5,7,11,13,17])