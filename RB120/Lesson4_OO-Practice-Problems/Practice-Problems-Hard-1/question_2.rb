module VehicleMetrics
  private
  attr_writer :fuel_efficiency, :fuel_capacity
  public
  attr_reader :fuel_efficiency, :fuel_capacity
  attr_accessor :speed, :heading

  def range
    @fuel_capacity * @fuel_efficiency
  end
  
end

class WheeledVehicle
  include VehicleMetrics

  def initialize(tire_array, km_traveled_per_liter, liters_of_fuel_capacity)
    @tires = tire_array
    self.fuel_efficiency = km_traveled_per_liter
    self.fuel_capacity = liters_of_fuel_capacity
  end

  def tire_pressure(tire_index)
    @tires[tire_index]
  end

  def inflate_tire(tire_index, pressure)
    @tires[tire_index] = pressure
  end

end

class Auto < WheeledVehicle
  def initialize
    # 4 tires are various tire pressures
    super([30,30,32,32], 50, 25.0)
  end
end

class Motorcycle < WheeledVehicle
  def initialize
    # 2 tires are various tire pressures
    super([20,20], 80, 8.0)
  end
end

class Catamaran
  include VehicleMetrics

  attr_reader :propeller_count, :hull_count

  def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
    # other code omitted ...
    self.fuel_efficiency = km_traveled_per_liter
    self.fuel_capacity = liters_of_fuel_capacity
  end
end

=begin

  Wheeled attribs
  ---------------
    * tires
    * fuel efficiency
    * fuel capacity
    - speed
    - heading

  Catamaran attribs
  -----------------
    * propeller count
    * hull count
    * fuel efficiency
    * fuel capacity
    - speed
    - heading

  Common attribs
  --------------
    * fuel efficiency
    * fuel capacity
    - speed
    - heading

  Exclusive Wheeled
  -----------------
    - tires

  Exclusive Catamaran
  -------------------
    - propellr count
    - hull count

  Architecture
  ------------
  
    - Module called Metrics
    - take all common attributes setters and getters and
      put them in a module

  But then the the classes that include the Metrics module
  must explicity initialize this state to be useful, which may
  be more of a burden that it's worth it.

  Module method structure
  -----------------------
    
      Accessors public
      ----------------
        - speed
        - heading

      Writer private
      --------------
        * fuel efficiency
        * fuel capacity
      
      Readers public
      --------------
        * fuel efficiency
        * fuel capacity
      
    Se need to be able to privatly set the attributes that
    are just readable outside

  Note:
  -----

  I forgot to add the #range method to the module. It makes
  sense to put it there since in the context of a vehicle,
  wheeled or not, we keep track of the fuel capacity and fuel
  efficiency to figure out how far we can go.

=end