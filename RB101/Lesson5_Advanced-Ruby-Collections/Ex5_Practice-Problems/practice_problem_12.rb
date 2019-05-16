# without using the to_h method, write some code that returns a hash where
# the key is the first object in each sub-array and and the value the second
# object of each sub-array

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

hsh = arr.each_with_object({}) do |arr, coll|
        coll[arr[0]] = arr[1]
      end

puts '=== Original ==='
p arr
puts '=== Hash ==='
p hsh
puts '=== Matches requirements ? ==='
str_req = '{:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}'
str_hsh = hsh.to_s
puts str_req == str_hsh