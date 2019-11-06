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

class Truck
  include Speed

  def go_very_slow
    puts "I am a heavy truck and like going very slow."
  end
end

some_car = Car.new
some_truck = Truck.new

some_car.go_fast
some_truck.go_fast

=begin

  Just include the Speed module into the car and Truck class.
  We can test if it works by invoking the go_fast method on 
  a Car and Truck instance.

=end