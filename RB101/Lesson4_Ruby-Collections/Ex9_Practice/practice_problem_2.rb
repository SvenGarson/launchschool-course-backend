=begin
  the count method returns the number of blocks that
  return true for a given value.
  In this case 2 of the 3 entries in the array have
  a string shorter than 4, so the block returns true
  only for 'ant' and 'bat', which is why it returns 2
=end

result = ['ant', 'bat', 'caterpillar'].count do |str|
  str.length < 4
end

puts "result: #{result}"