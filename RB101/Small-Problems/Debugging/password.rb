=begin
  The problem is one of scope. First the top level variable password
  is set to nil, then if the password is nil i.e not valid, set_password
  is invoked. Since ruby methods cannot acces any variables outside their
  own scope directly, apart form Constant's and Global's, the password
  variable on line 14 really is a new local variable and does not mutate 
  the top level one, so does not actually set the password but does return
  it. The same happens in the verify_password method, but this time generates
  an undefined variable/method error, since the password variable is not
  instanciated in the method itself, not a global or constant, so not visible
  in the conditional on the right side.

  The easiest fix is to make the set_password return a new password, and then
  pass that set password as argument to the verify_password method on invocation.

=end

password = nil

def set_password
  puts 'What would you like your password to be?'
  gets.chomp
end

def verify_password(password)
  puts '** Login **'
  print 'Password: '
  input = gets.chomp

  if input == password
    puts 'Welcome to the inside!'
  else
    puts 'Authentication failed.'
  end
end

if !password
  password = set_password
end

verify_password(password)