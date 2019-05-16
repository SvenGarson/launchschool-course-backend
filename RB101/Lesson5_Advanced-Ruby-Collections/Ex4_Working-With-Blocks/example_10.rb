=begin

  The original Array [[[1, 2], [3, 4]] , [5, 6]] is iterated by Array#map,
  where every Sub-Array if labaled as 'arr'.

  Each Sub-Array [[1, 2], [3, 4]] and [5, 6] are then iterated at a
  second level by Array#map where each object, Array and Integer are
  labeled el.

  Inside the block provided to the second level map method,
  the conditional checks whether the currently iterated item 'el'
  is an Array or an Integer.

  For an array like [1, 2] the to_s method return the same as Object#inspect,
  which for the Array [1, 2] is "[1, 2]".
  Then the String#size mehod is called on the result of the to_s method which
  return the length of the string, which in the case of even an empty Array is
  at least 2 because: [].to_s => "[]".size ==> 2.

  Since there is no other data type at this level of the array other than
  Initeger, the else block runs for every non-Array object iterated by the
  second level map method.

  In case 'el' is an Integer, the return value of the if
  statement is the currently iterated Integer + 1, which is then used by the
  map method to be added to the new Array.

  In case 'el' is not an Array, but an Array, the third level map method if
  called on the Array currently iterated by the second level map.
  The third level map iterated the iterated Sub-Sub-Arrays [1, 2] and [3, 4]
  and returns a new Array with the return value provided to the third level map,
  which is the Integer values incremented by 1.

  The return value of the third level map is used by the second level map to
  add to the new Array, if the currently iterated object by the second level
  map method is an Array. And the return value of the second level map method
  is used by the first level map method to add to the new Array, which is also
  the return value for this whole expression.

  So the return value is:

    result = [[[2, 3], [4, 5]], [6, 7]]

=end

dat = [[[1, 2], [3, 4]] , [5, 6]]

result = dat.map do |arr|
           arr.map do |el|
             if el.to_s.size == 1 # it's an integer
               el + 1
             else # it's an Array
               el.map do |n|
                 n + 1
               end
             end
           end
         end

p result

