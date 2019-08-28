=begin
  input:
    two arrays with numbers which are both the same size
  output:
    new array that contains the product of each pair of numbers at the
      same index of array 1 and array 2

  requirements:
    explicit:
      method named: multiply_list
      takes two arrays as arguments
      returns new array
    implicit:
      n/a

  mental model:

    Take two arrays of numbers of the same size and return a new array
    that contains the product of each pair of values in both arrays at the
    same index and return that array

  ds and algo:

    - create new array the size of one of the input arrays
    - iterate the range of one of both arrays from (0...array.size):
        - new array at current index = product of value in array 1 and array 2
          at the current index
    - return array

=end

def multiply_list(array_1, array_2)
  prod_arr = Array.new(array_1.size)
  array_1.each_with_index do |elem, i|
    prod_arr[i] = elem * array_2[i]
  end
  prod_arr
end

p multiply_list([3,5,7], [9,10,11]) == [27, 50, 77]