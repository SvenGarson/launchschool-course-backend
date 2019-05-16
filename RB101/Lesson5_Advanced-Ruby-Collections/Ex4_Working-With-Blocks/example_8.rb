=begin

  The original array [[8, 13, 27], ['apple', 'banana', 'cantaloupe']]
  is iterated by map in order to replace each array with the return 
  value of the select method. This return value will be added to a new
  array since Array#map is the non-destructive version of the method.

  For each Sub-Array [8, 13, 27] and ['apple', 'banana', 'cantaloupe'],
  a new Sub-Array is created and returned by the select method, which is 
  also the non-destructive version, which's return value is used by the 
  map method to add to the new array the whole expression results in.

  The select method iterates every object in the Sub-Arrays and creates
  one new Array for each Sub-Array iterated containing the items for which
  the block provided to the select method returns a truthy value.

  The conditional checks whether the iterated item is an integer or other
  data type, and then returns true if:
    - The iterated value is an Integer and larger that 13
    - The iterated value is not an Integer (String in this case) and
      has a size/length of less than 6

  The block returns nil, i.e a falsey value otherwhise and does not add
  that entry to the new array returned by select.

  Map then returns a new Array, containing the Sub-Array's that contain 
  objects based on the criteria tested for in the block provided to select.

  The result returned by map is:

    [[27], ['apple']]

=end