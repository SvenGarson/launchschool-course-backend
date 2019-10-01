class Pet
  def initialize(name, age)
    @name = name
    @age = age
  end
end

class Cat < Pet

  def initialize(name, age, color)
    super(name, age)
    @color = color
  end

  def to_s
    "My cat #{name} is #{age} years old and has #{color} fur."
  end

  private

  attr_reader :name, :age, :color

end

pudding = Cat.new('Pudding', 7, 'black and white')
butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
puts pudding, butterscotch

=begin

  Further exploration observations
  --------------------------------

  If we modify the Pet class to accept, in this case,
  3 arguments, we would not need to define the initialize
  method in the Cat class since the initialize method in
  the Pet class in the first one to be called because it
  is the first definition of #initialize in the lookup path.

  The potential problem I see it that, if we make a class
  inherit from the Pet class where the a state for color or
  fur color does not make sense, we then have a state, an
  instance method for an attribute that we would not use and
  worse, we would not know how with what to initialize it and
  we would need to a work around to make sure we don't break
  anything.

  That's why it is a good idea to have state/instance variables
  exclusively in classes that absolutely need them, if they do
  not, we should factor them out to someplace appropriate.

=end