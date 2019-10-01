class Vehicle
  
  attr_reader :make, :model, :wheels  

  def initialize(make, model, wheels)
    @make = make
    @model = model
    @wheels = wheels
  end

  def to_s
    "#{make} #{model}"
  end
  
end

class Car < Vehicle
  
  def initialize(make, model)
    super(make, model, 4)
  end

end

class Motorcycle < Vehicle

  def initialize(make, model)
    super(make, model, 2)
  end

end

class Truck < Vehicle
  attr_reader :payload

  def initialize(make, model, payload)
    super(make, model, 6)
    @payload = payload
  end

end

puts Truck.new('Mercedes', 'RipNTear', 'Camping supplies')
puts Car.new('BMW', 'Coupe')
puts Motorcycle.new('Honda', 'Ninja')

=begin

  Observations further exploration
  --------------------------------

  I immediately implemented it with a wheel instance
  variable in the Vehicle class and gave it the
  appropriate public getter method Vehicle#wheels.

  To me makes most sense since it is common state among
  all 3 types of vehicles and the method name always
  matches the attribute name. Furthermore it just returns
  an Integer that is the count of wheels for the type of
  vehicle, also, it never has to do any validation or
  change the wheel count in any way before returning it
  form the method, so moving that state up higher in the
  hierarchy absolutely makes sense in this case.

=end