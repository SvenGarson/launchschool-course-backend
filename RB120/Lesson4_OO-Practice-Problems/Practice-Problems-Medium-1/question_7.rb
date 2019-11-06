class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.information
    "I want to turn on the light with a brightness level of super high and a colour of green"
  end

end

=begin

  We could just name the method 'information', since we need
  and will call the method on the class itself, which is
  named 'Light'.

  So the method call looks like the following:

    Light.information

  This is both more clear and more succinct.

=end