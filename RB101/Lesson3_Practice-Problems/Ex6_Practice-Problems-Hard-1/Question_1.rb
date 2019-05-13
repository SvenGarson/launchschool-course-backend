=begin§

  The ruby interpreter walks through the code and
  allocates memory for every variable, even in if
  statements and initializes them to nil.

  So allthough the statement 'greering = "hello world"'
  will never actually run, the greeting variable is 
  declared and initialized. Though with the value nil.

=end

if false
  greeting = "hello world"
end

greeting