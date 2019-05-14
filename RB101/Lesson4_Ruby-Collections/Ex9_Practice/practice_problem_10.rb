=begin

  The map method returns a new array that contains
  the result of the provided block for every item
  of the array the map method is called on.

  The map method call prints:

    2
    3

  The result of the map method call is:

    [1, nil, nil]

  The if statement returns nil if the number iterated
  is larger than 1 (since puts always returns nil) and
  returns the iterated number if it is less than or
  equal to 1.

=end

result = [1, 2, 3].map do |num|
           if num > 1
             puts num
           else
             num
           end
         end

p "result: #{result}"