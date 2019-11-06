class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end
end

=begin

  Since the Cat#make_one_year_older is an instance method
  of the cat class, in the context of this methods being
  executed, self simply refers to the object, which is an
  instance of the Cat class that the method invocation
  message is sent to.

  So in short, the Cat instance which the method is invoked
  on, i.e, the caller.

=end