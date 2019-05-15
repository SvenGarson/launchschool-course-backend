=begin

  The Array#map method is called on a two-dimensional
  array [[1, 2], [3, 4]]  .
  The block handed to the map method is called once
  for every object in the original multi-dimensional array.
  Array#map method adds the return value of the block
  to a new array, which has one entry for every original
  object iterated over.

  The prints the first number of the nested arrays as
  string representation since first called on an array
  returns the first entry at index 0, which in this case
  is 1 and 3.

  So the output is:

    => 1
    => 3

  Puts always returns nil, and since that method call is
  the last statement in the block, this value will be added
  to the new array created by Array#map.

  The map method used in the non-desctructive version, which
  does not have any effect on the original value that map is
  called on.

  So the returned but in this case unnused return value of the
  map method is:

    => [nil ,nil]

=end

result = [[1, 2], [3, 4]].map do |arr|
           puts arr.first
         end

p result