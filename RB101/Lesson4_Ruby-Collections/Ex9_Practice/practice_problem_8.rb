=begin

  Array#take returns a new array with the first n objects
  of the array it is called on based on the parameter n.

  The method is not destructive, since the array is the same
  before and after calling take on the array. 

=end

arr = [1, 2, 3, 4, 5]
result = arr.take(2)

puts "pre-take: #{arr}"
puts "result: #{result}"
puts "post-take: #{arr}"

