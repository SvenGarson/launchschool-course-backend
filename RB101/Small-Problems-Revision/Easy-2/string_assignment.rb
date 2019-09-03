=begin
  The program prints BOB twice:

  1. BOB
  2. BOB

  That's because the String.upcase! method is destructive
  and actually changes the object the reference points to.
  Line 1 creates a new local variable/reference to a string
  that contains 'Bob', the 2nd line creates a new local
  variable that is assigned the same reference to the same
  string 'Bob' in memory.
  Since both the local variables point to the exact same 
  object in memory and the upcase! method changes the data
  of the object, the puts method prints the same string twice,
  i.e, the same object.
  

=end