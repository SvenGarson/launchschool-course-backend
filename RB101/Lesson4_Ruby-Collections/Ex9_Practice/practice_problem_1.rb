=begin
  return a new array containing all the entries in [1, 2, 3]
  since the last statement is 'hi', and every value apart from
  false and nil are considered truthy, even strings.
  Select adds the currently iterated object to the returned
  array if the block return true for it.
=end

result = [1, 2, 3].select do |num|
           num > 5
           'hi'
         end
         
puts "returned: " + result.inspect
