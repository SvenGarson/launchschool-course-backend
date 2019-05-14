=begin
  
  - The blocks return value is:
      - true for odd number
      - false for even numbers
  - The block return value is determined by the 'odd?''
    method that is called on the iterated number, because
    it is the last statement evaluated in the block

  In this code any? returns true since the block returns 
  a truthy value at least once.

  Also, as soon as the block returns a truthy value, the
  methods stops iterating the array.

  The result is:

    1
    true

=end

result = [1, 2, 3].any? do |num|
           puts num
           num.odd?
         end

puts "result: #{result}"