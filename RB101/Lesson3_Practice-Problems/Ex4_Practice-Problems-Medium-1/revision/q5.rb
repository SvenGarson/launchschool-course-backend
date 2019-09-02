=begin
  The problem is one of scope. Ruby methods cannot access
  any local variables outside their own scope, even if it
  is top-level. The usual fix is to pass the limit to the
  method as argument on invocation.

  This means that the method definition has to be changed
  to:

  def fib(first_num, second_num, limit)
    ... code ...
  end

  And the method is now called with the limit as actual
  argument like so:

  fib(0, 10, 15)

=end