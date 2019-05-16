# order array of number strings by descending numeric value
#                                  ^^^^^^^^^^ ^^^^^^^

arr = ['10', '11', '9', '7', '8']

# using Array#sort and using the Integer value of the string
sorted = arr.sort do |a, b|
           b.to_i <=> a.to_i
         end

# check results
puts '=== Original ==='
p arr
puts '=== Sorted using Array#sort ==='
p sorted

