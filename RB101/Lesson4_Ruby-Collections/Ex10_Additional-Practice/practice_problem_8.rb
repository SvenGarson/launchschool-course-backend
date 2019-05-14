=begin
  The first snippet would output:

    1
    3

  Since the shift method returns and removed the first
  object of the array and shifts the rest of the array
  one index forward.

  This means that after shifting the first time, the
  number 3 shifts to the second place in the array and
  4 to the third.

  Then the number 3 is printed and after the next shift
  number 4 shifts to the second position.

  Since the iteration is at the second position, index 1,
  there is nothing to iterate over after.

  The second snippet would output:

    1
    2

  Same thing as with the first, only that objects are returned 
  and removed from the back of the array.

  After the first iteration the number 4, and after the second
  iteration the number 3 are removed from the array.

  As before, there is nothing left to iterate over next.

=end

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

puts '==========='

numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.pop(1)
end