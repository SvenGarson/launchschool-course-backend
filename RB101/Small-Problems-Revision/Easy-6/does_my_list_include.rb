=begin
  
inp:
- some array
out:
- object searched for in array

exp:
- method name: include?
- return true if object in the array,
  false otherwhise
- cannot use Array#include?

dsal:

- if any equals object -> true

=end

def include?(arr, item)
  arr.any? { |obj| obj == item }
end

p include?([1,2,3,4,5], 3) == true
p include?([1,2,3,4,5], 6) == false
p include?([], 3)      == false
p include?([nil], nil) == true
p include?([], nil)    == false