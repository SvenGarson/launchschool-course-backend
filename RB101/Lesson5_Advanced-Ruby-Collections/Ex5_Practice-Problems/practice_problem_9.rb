# return a new of the same structure but with the sub-array's
# being ordered alphabetically or numerically in descending order
# based on the iterated data type                ^^^^^^^^^^

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

sorted = arr.map do |arr|
           arr.sort do |a, b|
              b <=> a
           end
         end

puts '=== Original ==='
p arr
puts '=== Sorted ==='
p sorted