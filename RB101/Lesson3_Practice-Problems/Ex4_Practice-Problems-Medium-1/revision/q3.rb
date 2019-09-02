=begin
  The loop is a so called do while or do until loop
  which runs at least once since the exit condition
  is checked after the code that constitutes the
  actualy loop.

  Simply changing the loop to:

  while divisor > 0 (do)
    .. code ..
  end

  will fix the problem to handle the requirements.
  In case the divisor, i.e the parameter number is zero
  or negative, the loop will never execute.

  Bonus 1:

  The number % divisor checks if the divisor divides the
  number evenly to an integer, i.e, the division has no
  fraction.

  Bonus 2:
  
  The line 8 is the last line the method evaluates. Ruby
  returns the last expression evaluated from the method,
  which is in this case is the factors array. if the last
  line did not contain the identifier of the array, the
  array would not be the reference returned.

=end