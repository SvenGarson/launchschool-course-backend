# return a new array containing the same sub-arrays but ordered
# in a way that only the odd numbers are taken into consideration
# expected result => [[1, 8, 3], [1, 6, 7], [1, 4, 9]]

arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

sorted = arr.sort_by do |sub_arr|
           sub_arr.select do |i|
             i.odd?
           end
         end

p '=== Original ==='
p arr
p '=== Sorted ==='
p sorted