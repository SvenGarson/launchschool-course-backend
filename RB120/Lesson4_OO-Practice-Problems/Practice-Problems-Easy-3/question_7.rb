class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def information
    "I want to turn on the light with a brightness level \
of #{brightness} and a color of #{color}"
  end

end

light = Light.new('Dim', 'Yellow')
puts light.information
light.brightness = 'Brighter'
light.color = 'Deep orange'
puts light.information

=begin

  We have 2 instance variables which save the state on initializing
  the Light instance.

  The problem lies in the Light::information method.
  First, it's a Light class method and it does not output or do
  anything general regarding to the Light class, and since it can't
  access the instance variables of a given instance, we cannot even
  use these instance variables to return a sensible information string.

  The return statement is also unnecessary, since it will return the
  string implicitly.

  I think the most sensible thing to do is to make the information
  method an instance method of Light, i.e, Light#information and use
  the instance variable state of brightness and color in the
  information string.

  The accessor for brightness and color seems sensible since apparently
  it is suppposed to be a controlable light source, hence we can keep
  the accessor, i.e, the setter and getter method for brightness and
  color as is.

=end