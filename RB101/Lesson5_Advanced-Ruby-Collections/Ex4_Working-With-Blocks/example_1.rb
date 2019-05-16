=begin

  The each method is called on a nested, two-dimensional
  array. The array contains, two arrays, each containing two 
  integers.

  The block handed to the each method has a parameter called
  'arr', which represents the object currently iterated,
  which in this case is the reference to the nested arrays
  inside [[1, 2], [3, 4]].

  Everey iteration then, puts is called with the argument
  arr.first, which represents the first methjod being called
  on the currently iterated array.

  The first method returns the first object in the array, 
  i.e, the object at index 0, which is then printed by puts-

  Puts returns nil as the block's final statement

  This leads to the output:

    1
    3

  Which is the first item of both nested arrays.

  Array#each has no side effects and returns an, in this
  case unused, reference to the array it is called on,
  which is [[1, 2], [3, 4]]

=end


[[1, 2], [3, 4]].each do |arr|
  puts arr.first
end
