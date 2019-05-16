# using methods like select or reject, return a new array
# identical in structure but containing only multiples of 3

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

mult_of_three = arr.map do |arr|
                  arr.select do |i|
                    (i % 3) == 0
                  end
                end

puts '=== Original ==='
p arr
puts '=== Multiples of 3 ==='
p mult_of_three