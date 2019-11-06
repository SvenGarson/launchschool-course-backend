class Greeting
  def self.greet(message)
    puts message
  end
end

class Hello < Greeting
  def self.hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

Hello.hi

=begin

  We just define the Hello#hi method as as a class method instead
  of an instance method.

  But to make this work, we would also have to define the
  Greeting#greet message as a class method, because the Hello class
  method 'hi' does not have access to it's superclass' instance
  methods directly.

  What happens though is that class methods inherit similarly to
  instance methods, in that we can call the Greeting::greet class
  method from inside the Hello::hi class method.

=end