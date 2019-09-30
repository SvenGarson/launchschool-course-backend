=begin

inp:
- array
out:
- new array with arg contens but first object moved to
  the end

exp:
- return new array
- do not mutate original array
- cannot use Array#rotate/rotate!

imp:
- ok if the returned array reference the original
  i.e we use Array#dup to copy or do we need to
  deep copy to have new array reference same value
  but other object in memory

dsal:

  - res = copy of original
  - return res if size <= 1
  - shift first object to the end of res
  - return res

=end

def rotate_array(arr)
  cpy = arr.dup
  return cpy if cpy.length <= 1
  
  cpy << cpy.shift
end

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
p rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
p rotate_array(x) == [2, 3, 4, 1]   # => true
p x == [1, 2, 3, 4]                 # => true