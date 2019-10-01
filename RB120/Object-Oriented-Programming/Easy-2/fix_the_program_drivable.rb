module Drivable
  def drive
    # code here?
  end
end

class Car
  include Drivable
end

bobs_car = Car.new
bobs_car.drive
