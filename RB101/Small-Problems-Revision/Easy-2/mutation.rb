=begin
  
  The program is goint to print:

  1. Moe 
  2. Larry
  3. CURLY
  4. SHEMP
  5. Harpo
  6. CHICO
  7. Groucho
  8. Zeppo

  Line 1 assigns a new String array to the lvar array1.
  On line 3 we copy the references of the strings in array1
  to array2. on line 4 we then destructively upcase every 
  string that starts with either a C or an S, which,
  allthough we mutate the references of array1, are the same
  references in array2, which is why the references in array2
  reflect the changes, since the data the references point to
  was changed for the identical pointers in both arrrays.

=end