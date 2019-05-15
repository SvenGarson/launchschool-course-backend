=begin

  Line 1:
    - Action            => Array#map
    - Object            => [[1, 2], [3, 4]]
    - Side Effect       => none
    - Return value      => new Array [1, 3]
    - Return value used => no

  Line 1-4:
    - Action            => Block exec.
    - Object            => Sub-Arrays [1, 2] and [3, 4]
    - Side Effect       => none
    - Return value      => first object in Sub-Arrays 1 and 2
    - Return value used => By Array#map to add to new array

  Line 2:
    - Action            => Kernel#puts
    - Object            => First object of Sub-Array as argument
    - Side Effect       => prints string representation of first int in Sub-Array 1 and 3
    - Return value      => nil
    - Return value used => no

  Line 3:
    - Action            => Array#first
    - Object            => Each Sub-Array
    - Side Effect       => none
    - Return value      => first object of the Sub-Array
    - Return value used => by Array#map to add to new array
  
=end

result = [[1, 2], [3, 4]].map do |arr|
           puts arr.first
           arr.first
         end

p result