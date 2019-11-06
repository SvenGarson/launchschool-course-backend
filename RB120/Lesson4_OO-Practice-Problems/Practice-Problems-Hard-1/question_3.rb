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

class WaterVehicle
  include VehicleMetrics

  attr_reader :propeller_count, :hull_count

  def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
    @propeller_count = num_propellers
    @hull_count = num_hulls
    self.fuel_efficiency = km_traveled_per_liter
    self.fuel_capacity = liters_of_fuel_capacityity
  end
end

class Catamaran < WaterVehicle
end

class Motorboat < WaterVehicle

  def initialize(km_traveled_per_liter, liters_of_fuel_capacity)
    super(1, 1, km_traveled_per_liter, liters_of_fuel_capacity)
  end

end

=begin

  If we consider we already have the code we generated in the
  last exercise, question_2 to be present.

  Add functionality and requirements
  ----------------------------------
    
    - add motorboat class
    - motorboard attributes:
      * single propeller
      * single hull
    - the rest is the same as a catamaran

  We can add a new superclass that both Catamaran and
  Motorboat inherit from, that includes all the state
  and functionality the Catamaran has until no, but with
  different constructor arguments to reflect t

=end