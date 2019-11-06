class Cube

  attr_accessor :volume

  def initialize(volume)
    @volume = volume
  end
end

c = Cube.new(5.65)
p c.volume

=begin

  Just adding an auto-generated getter method by using
  attr_reader for that instance variable name as attribute
  does the trick.

=end

