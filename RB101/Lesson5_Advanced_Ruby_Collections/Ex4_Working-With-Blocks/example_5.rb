=begin

  Line 1:
    - Action            => Array#map outer
    - Object            => Original Array [[1, 2], [3, 4]]
    - Side Effect       => none
    - Return value      => New Array [[2, 4], [6, 8]]
    - Return value used => no

  Line 1 - 5:
    - Action            => Block exec. outer
    - Object            => original Array
    - Side Effect       => none
    - Return value      => Each mapped Sub-Array [2, 4] and [6, 8]
    - Return value used => Used by outer map method to add to new Array

  Line 2:
    - Action            => Array#map inner
    - Object            => Each Sub-Array
    - Side Effect       => none
    - Return value      => Each Sub-Array with every contained value multiplied by 2
    - Return value used => Used by outer Array#map to add to new Array

  Line 2 - 4:
    - Action            => Block exec. inner
    - Object            => Each int in each Sub-Array 
    - Side Effect       => none
    - Return value      => Each integer in Sub-Array multiplied by 2
    - Return value used => Used by inner map method to add to new Array

  Line 3:
    - Action            => Integer#* multiplication
    - Object            => Each integer in Sub-Array
    - Side Effect       => none
    - Return value      => Each integer in Sub-Array multiplied by 2
    - Return value used => Used by inner map method to add to new Sub-Array

=end

result = [[1, 2], [3, 4]].map do |arr|
           arr.map do |num|
             num * 2
           end
         end

p result