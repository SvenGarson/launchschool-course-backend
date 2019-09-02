=begin
  The problem is that the Array.+ method returns a
  new array and does not mutate the array called on,
  which is only a problem though if the intention was
  to mutate the array refernced from outside.

  This means that in the second method, line 8
  assigns a local variable called buffer to the new
  array returned by the Array#+ method, shifts the
  object from the new array if the array is bigger than 
  max_buffer_size and finally returns the new array
  reference
=end