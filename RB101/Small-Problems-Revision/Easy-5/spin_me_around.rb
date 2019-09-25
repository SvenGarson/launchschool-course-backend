=begin
  The spin_me method first splits the str parameter at
  the spaces into a string array, then iterates that array
  and runs the block for each string in that array.
  
  The block will then reverse the word in the stirng array
  with the mutative String#reverse! method which changes the
  string in place to it's reversed version

  Since the Array#each method always returns the object it is
  called on, the Array#join method is invoked on that same
  string array and returns a new String that contains all of
  the reversed Strings in the split array concatenated into
  one separated by a space.

  The last method called in the spin_me method is Array#join
  which means that it's return value is implicitly returned,
  which in this case is a string that contains 'olleh dlrow'.

  The parameter string is used only once as caller for the 
  String#split method, so the string returned is not the one
  entered as parameter.

=end

def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(' ')
end

orig = 'hello world'
result = spin_me(orig)

puts "original == result => #{orig.equal? result}"
puts "Object id original: #{orig.object_id}"
puts "Object id result  : #{result.object_id}"