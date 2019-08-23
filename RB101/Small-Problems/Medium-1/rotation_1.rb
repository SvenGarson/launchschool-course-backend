=begin
  input:
    array
  output:
    new array that hase the same references than orig but the first
    reference moves to the end of the array

  requir.:

    expl.:
      - method name: rotate_array
      - argument: one array
      - return a new array
      - do not modify original array

    impl.:
      -? how to handle empty array
          -> just return an empty array
      -? Array#dup good enough of a copy operation
      -? which objects is the array gooing to have so duplicating might
         have to be adjusted

  ds and algo:

    - duplicate arg array
    - remove first object from index 0
    - if shifted object not nil -> add it to the end of the array
    - return the new array

=end

def rotate_array(arr)
  cpy = arr.dup
  if (tmp = cpy.shift)
    cpy.push(tmp)
  end
  cpy
end
p rotate_array([7,3,5,2,9,1]) == [3,5,2,9,1,7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1,2,3,4]
p rotate_array(x) == [2,3,4,1]
p x == [1,2,3,4]