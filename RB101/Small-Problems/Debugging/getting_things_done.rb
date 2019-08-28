def move(n, from_array, to_array)
  return if n == 0
  to_array << from_array.shift
  move(n - 1, from_array, to_array)
end

# Example

todo = ['study', 'walk the dog', 'coffee with Tom']
done = ['apply sunscreen', 'go to the beach']

move(2, todo, done)

p todo == ['coffee with Tom']
p done == ['apply sunscreen', 'go to the beach', 'study', 'walk the dog']

=begin

  # Explanation #

  The problem is that the recursive move method has no exit/return condition
  based on the n parameter. Each recursive invocation level n is decreased by
  1, but this parameter is never checke agains, so it goes from 2, to zero, and
  negative values and goes lower and lower until there is no more room on the stack
  for further arguments / variables / scope.

  Simple returning from the recursive method when the n parameter has reached zeri
  fixes the problem.

  # Further epxloration #
  If the from_array is smaller than n, and the array will be emptied before the
  move method returns, the shift method returns nil if there is no more object to
  return from the array, so the to_array will have nil added as many times as it
  is called over the initial capacity of the to_arrray

=end