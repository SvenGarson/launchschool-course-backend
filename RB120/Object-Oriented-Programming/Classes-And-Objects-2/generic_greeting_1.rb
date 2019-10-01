class Cat

  def self.generic_greeting
    puts "Hello! I'm a cat!"
  end

end

# solution to first problem
Cat.generic_greeting

# further exploration
kitty = Cat.new
kitty.class.generic_greeting

=begin

  Since the 'generic_greeting' is a Cat class method,
  and the Object#class method returns the class the
  instance is instanciated from, which is the same object
  than the class object Cat, the method invocation is
  identical to the one called with the Cat class as
  explicit receiver.

=end