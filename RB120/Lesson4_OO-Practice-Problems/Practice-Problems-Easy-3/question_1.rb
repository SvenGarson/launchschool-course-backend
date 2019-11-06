class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

=begin

  First case
  ----------
  Outputs => 'Hello'

  Second case
  ------------
  Undefined method error

  Third case
  ----------
  Argument Error, Given 0 Needed 1

  Fourth case
  -----------
  Output => 'Goodbye'

  Fifth case
  ----------
  Undefined method error

=end