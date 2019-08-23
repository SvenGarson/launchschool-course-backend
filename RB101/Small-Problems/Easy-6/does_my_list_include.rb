=begin

  inp:
    some array
    object to search for in the array
  output:
    true if the object is in the array
    false if not

  requirements:
    explicit:
    - method called: include?
    - cannot use Array#include?

    implicit:
      ? which method to use for comparison, == ?

  mental model:

    the method called include takes an array and an object to search for 
    int the array. the method returns false if the object is not
    in the array and true if it is

  ds and algo:

    - set found to false
    - for every object in the array:
      - if the currently iterated object is the same as the search object:
          -> set found to true
          -> break loop
    return found

=end

def include?(array, search_obj)
  found = false
  array.each do |elem|
    if elem == search_obj
      found = true
      break
    end
  end
  found
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3)          == false
p include?([nil], nil)     == true
p include?([], nil)        == false