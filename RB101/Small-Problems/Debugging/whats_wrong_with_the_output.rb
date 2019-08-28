arr = ["9", "8", "7", "10", "11"]

p arr.sort { |x, y| y.to_i <=> x.to_i }
# or using parentheses
p (
    arr.sort do |x, y|
      y.to_i <=> x.to_i
    end
  )

# Expected output: ["11", "10", "9", "8", "7"] 
# Actual output: ["10", "11", "7", "8", "9"] 

=begin
  The problem is the precedence of the way a block is defined:
  The {} notation has precedence over the do ... end notation.
  in this case the the do end notation is used and causes the
  block to be passed to the puts method and the sort method
  handed to the puts method as acual argument.

  So the code above really equated to the following:
    
    p(arr.sort)do y.to_i <=> x.to_i end

  So, since the Kernel.p method ignore the block passed to it and
  and the sort method has no block t yield to, the block will have
  no effect overall and the sort method will sort it's default way,
  which is by using the <=> / spaceship operator on the objects in
  the collection it is called on.
  In this case the comparison happens between the original strings
  in the arr, where the comparison, for instance, between the string
  '10' <=> '11' evaluates to -1 since the first two characters are
  the same, but for the second characters, the '0' is 'lower' than
  '1' ascii whise, so the overall result is that '10' comes before
  '11'.

  To fix this we need to have the block passed to the sort method and
  the return value of the sort method passed to the Kernel.p method.

=end