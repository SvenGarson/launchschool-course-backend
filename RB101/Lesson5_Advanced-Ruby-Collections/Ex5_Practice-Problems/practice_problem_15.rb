# return an array which contains only the hashes in which all
# the integers are even 

arr = [
  {a: [1, 2, 3]},
  {b: [2, 4, 6], c: [3, 6], d: [4]},
  {e: [8], f: [6, 10]}
]

even_hash_arr = arr.select do |hsh|
                  hsh.values.flatten.all? do |number|
                    number.even?
                  end
                end

puts '=== Original ==='
puts arr
puts '=== Result ==='
puts even_hash_arr