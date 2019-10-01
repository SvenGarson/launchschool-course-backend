module Transportation
  
  class Vehicle; end

  class Truck < Vehicle
  
  end

  class Car < Vehicle
  
  end

end

vehicle = Transportation::Vehicle.new
truck   = Transportation::Truck.new
car     = Transportation::Car.new

p vehicle.class
p truck.class
p car.class