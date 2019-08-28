=begin
  input:
    some array
  output:
    one array that nests two array inside
    first nested array contains first half of the input array
    second nested array contains second half of the input array

  requirements:
    explicit:
    methods named: halvsies
      if original array size is odd -> place it in the first nested aray

    implicit:
      if inp array i empty, return array with empty sub-arrays
      if array contains only one element, add it to the first sub array and
        make the second sub-array an empty one

  mental model:
    Split the original array into a nested 2 element array where the first
    sub array is the the first half of the original array and the second sub
    array is the second half of the original array.
    In case the original array has an odd length, put the center value of the
    original array at the end of the first sub array.

  test cases:

    inp: [1,2,3,4]
    out: [[1,2], [3,4]]

    inp array size even so:
      1st sub array => range (0...inp.size/2)        ==> [1,2]
      2nd sub array => range (inp.size/2...inp.size) ==> [3,4]

    inp: [1,2,3,4,5]
    out: [[1,2,3], [4,5]]

    inp array size odd so:
      1st sub array => range (0..inp.size/2)           ==> [1,2,3]
      2nd sub array => range (inp.size/2+1...inp.size) ==> [4,5]

  ds and algo:
    find the index at which to split the original array into two halves
    the split is the index at which the second sub-array starts to be
    copied out

    if original.size == even:
      -> split index =  original.size / 2
    if original.size == odd:
      -> split index = (original.size / 2) + 1

  set split index:
    if original.size is even => split index =  size/2
    if original.size is odd  => split index = (size/2)+1
    create new array
    add 1st sub-array to new array with references from original in range (0...split)
    add 2nd sub-array to new array with references from original in range (split...size)
    return new array

  test cases with algo:

    inp: [1,2,3,4]
    out: [[1,2], [3,4]]

    inp.size is even so split index = size / 2 = 4 / 2 = 2
    1st sub range = (0...split)     => [0, 1]
    2nd sub range = (split...size)  => [2, 3]
    resulting new array = [[1, 2], [3, 4]]

    inp: [1,2,3,4,5]
    out: [[1,2,3], [4,5]]

    inp.size is odd so split index = (size / 2) + 1 = (4 / 2) + 1 = 3
    1st sub range = (0...split)     => [0, 1, 2]
    2nd sub range = (split...size)  => [3, 4]
    resulting new array = [[1, 2, 3], [4, 5]]

    accum:
      - determine split index based on input array size even or odd
      - construct range for first and second sub array
      - create new array containing the sub-arrays with the objects
        from the original in the ranges computed
      - return the new array

=end

def halvsies(array)
  size = array.size
  split_index = size / 2
  split_index += 1 if size.odd?
  range_sub_left  = (0...split_index)
  range_sub_right = (split_index...size)
  [array[range_sub_left], array[range_sub_right]]
end

p halvsies([1,2,3,4])   == [[1,2], [3,4]]
p halvsies([1,5,2,4,3]) == [[1,5,2], [4,3]]
p halvsies([5])         == [[5], []]
p halvsies([])          == [[], []]