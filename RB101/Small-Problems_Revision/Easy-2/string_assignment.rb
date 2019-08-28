=begin
  It will print:

    BOB
    BOB

  because the name and save_name variables are references to the same object
  in memory. The destructive version of upcase!, denoted by the exclamation
  mark, actually mutates the object the reference is pointing to.
  Since both variables point to the same object, they both print the same
  value.

=end

name = 'Bob'
save_name = name
name.upcase!
puts name, save_name