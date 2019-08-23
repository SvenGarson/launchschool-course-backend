=begin
  input:
    two arrays of the same size
  output:
    new array containing the elements of both input arrays in alternation
      first array 0, seconds array 0, first array 1, second array 1 etc.

  requirements:
    explicit:
      method named interleave
      two arguments each an array
      both input arrays have the same size and are not empty
      add from both arrays to new on in alternation
      return new array
    implicit:
      n/a

  mental model:
    go through the range of one of the arrays from 0 to size-1 and 
    add all items to a new array in alternation starting with the
    first array, then the second array, for every object in order.

  test cases:

    n/a

  ds and algo:

    create new array
    for i range (0...array.size)
      add index i object from first  array to new array
      add index i object from second array to new array
    return new array

=end

def interleave(arr_left, arr_right)
  size = arr_left.size
  accum = []
  for index in (0...size) do
    accum << arr_left[index]
    accum << arr_right[index]
  end
  accum
end

p interleave([1,2,3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']