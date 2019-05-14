=begin
  
  Hash#map returns a new array containing the values returned by
  the block for each entry in the hash.

  So the return value of the example is:

    {nil, "bear"}

  because the if statement is the only/last statement in the
  block and it returns the currently iterated value of the 
  key value pair if the string is longer than 3.
  The if statement returns nil if no test succeeds,
  which is the case if the string is shorter or exactly 3 long.

=end

result = { a: 'ant', b: 'bear' }.map do |key, value|
          if value.size > 3
            value
          end
         end

puts "result: #{result}"

