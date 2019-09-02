=begin
  The new_answer on line 7 evaluates to 50 and the
  method call mess_with_it has no side effect on
  the it's argument, the local variable answer.

  The call to the Kernel#p method though, has
  the actualy argument answer - 8 passed to it
  as actual argument, which means that the expression
  answer - 8 evaluates to 42 - 8, and is passed to the
  method as the Integer 34.

  Output: 34

  The output would change if the new_answer variable
  were used, since that one reflects the method result.

=end