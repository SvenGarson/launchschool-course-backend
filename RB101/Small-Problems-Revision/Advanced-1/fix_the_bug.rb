=begin

The problem is not obvious in that we don't
explicity provide the elsif check on line 4
an object to check.

If ruby does not have a conditional test on
the same line, i.e line 4, it will evaluate the
next expression and use it's truthiness to 
evaluate whether or not to execute this branch.

So the conditional actually checked against is
the return value of the Array#map method on line 5,
to which we also pass a block which influences the
return value of the Array#map method.

The return value of Array#map is always a new array
though, and is considered a truthy wheher it contains
objects or is empty. The only objects in ruby that are
considered False/falsey in a conditional context ar
False and nil.

Ruby 'consumes' this expression and uses it as conditional,
so that there is effectively not more code run in the
executed branch, which is why for cases where the parameter
array is not empty, the method return nil.

Simply checkig the branch on line 4 to execute on arrays that
contain at least 1 object fixes the problem.

=end

def my_method(array)
  if array.empty?
    []
  elsif array.size > 1
    array.map do |value|
      value * value
    end
  else
    [7 * array.first]
  end
end

p my_method([]) == []
p my_method([3]) == [21]
p my_method([3, 4]) == [9, 16]
p my_method([5, 6, 7]) == [25, 36, 49]