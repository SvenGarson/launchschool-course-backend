=begin
  the return value of reject is an array of the objects
  for which the block returns a falsey value.
  In this case, 'puts num' is the only statement in the block,
  hence returns a falsey value (nil) to be yielded by reject,
  which results in a new array containing all the original
  elements [1, 2, 3]
=end

result = [1, 2, 3].reject do |num|
           puts num
         end

puts "result: #{result}"