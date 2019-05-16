# return a new array using Array#map without modifying the original
# array. Increment every Integer by one

original = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]
mapped = original.map do |hash|
           hsh_incr = {}
           hash.each_pair do |k, v|
             hsh_incr[k] = hash[k] + 1
           end
           hsh_incr
         end

mapped_2 = original.each_with_object([]) do |hash, coll|
             hsh_incr = {}
             hash.each_pair do |k, v|
               hsh_incr[k] = v + 1
             end
             coll << hsh_incr
           end

puts '=== Original ==='
p original
puts '=== Mapped ==='
p mapped
puts '=== Mapped 2 ==='
p mapped_2