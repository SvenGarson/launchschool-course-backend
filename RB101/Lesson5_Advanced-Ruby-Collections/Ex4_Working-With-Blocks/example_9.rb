=begin

  The original Array is [[[1], [2], [3], [4]] , [['a'], ['b'], ['c']]]

  The non-destructive map method is called on the original array with a block
  that operates on the original Array's Sub-Array's [[1], [2], [3], [4]]
  and [['a'], ['b'], ['c']] which are labeled as 'element1' during each
  iteration.

  Then each of those Sub-Arrays are iterated by Array#each which iterates
  through all the Sub-Array's in [[1], [2], [3], [4]] and [['a'], ['b'], ['c']]
  which is [1], [2], ..., ['a'], ['b'] which are labeled as 'element2' during
  each iteration.
  The return value of this second level each method, which is each Sub-Array,
  is used by the first level map method to add to the new Array, which is what 
  this whole expression will result in.

  Then each Sub-Sub-Array, [1], [2], ..., ['a'], ['b'], is iterated by 
  Enumerable#partition, which iterates through 1, 2, 3, 4, 'a', 'b', 'c',
  which are labeled 'element3' during each iteration.
  The partition method returns two Array's, the first one with all the
  iterated over object for which the provided block returned a truthy value,
  and the second one with all the object for which the provided block returned
  an falsey value.

  The size method is both defined as Integer#size and String#size.

  The Integer#size version returns the number of bytes the Integer itself
  takes up in memory.

  The String#size version return the length of the string, i.e, how many
  characters it contains.

  Both methods return an Integer, which is considered a truthy value, so
  all the objects are added to the first array which is returned by partition.

  Allthough 2 new Array's are returned by partition, the second level each method
  does not regard the return value of the block it is provided.

  So in the end the return value of this whole expression is a new Array
  containing all the original references to the Array 
  [[[1], [2], [3], [4]] , [['a'], ['b'], ['c']]]

  So each Sub-Array's of the original and returned Array's contain references
  to the same objects.

=end

dat = [[[1], [2], [3], [4]] , [['a'], ['b'], ['c']]]

result = dat.map do |element1|
           element1.each do |element2|
             element2.partition do |element3|
               element3.size > 3
             end
           end
         end

# return value eof map method
puts '=========================================================='
puts 'Array and returned Array do not reference the same object'
puts '=========================================================='
puts "Original: #{dat.object_id}"
puts "Result  : #{result.object_id}"
puts "They are different references: #{dat.object_id != result.object_id}"

# return value of each method for Sub-Array's
puts '=========================================================='
puts 'Sub-Array references do reference the same objects'
puts '=========================================================='
sub_arrays_match = true
for index in (0...2) do
  id_sub_orig = dat[index].object_id
  id_sub_res  = result[index].object_id
  print "Sub-Array index: #{index}\t, "
  print "original_id: #{id_sub_orig} "
  puts  "returned_id: #{id_sub_res}"
  id_match = (id_sub_orig == id_sub_res)
  if !id_match && sub_arrays_match
    sub_arrays_match = false
  end
end
puts "Sub-Array's Id's match: #{sub_arrays_match}"
print "\  n"
