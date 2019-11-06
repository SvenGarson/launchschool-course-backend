module Speed
  def go_fast
    puts "I am a #{self.class} and going super fast!"
  end
end

class Car
  include Speed
  def go_slow
    puts "I am safe and driving slow."
  end
end

Car.new.go_fast

=begin

  The Speed modules prints out the current self object.
  The current self object of an included module is an
  instance of the class that includes the module, and
  since we invoke the go_fast module methods on a Car
  instance, the current self in the module method call
  is the class of the Car instance, which is Car.

  This is why in question_2, self.class in the modules
  method evaluated to the Truck and Car classes respectively.
  Because those are the classes including the module.

=end