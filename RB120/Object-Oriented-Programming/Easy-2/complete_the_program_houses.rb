class House
  include Comparable
  attr_reader :price

  def initialize(price)
    @price = price
  end

  def <=>(other_house)
    self.price <=> other_house.price
  end

end

home1 = House.new(100_000)
home2 = House.new(150_000)
puts "Home 1 is cheaper" if home1 < home2
puts "Home 2 is more expensive" if home2 > home1

=begin

  Observations further exploration
  --------------------------------

  The 2 test cases check for the price of the house
  explicity, so this is a valid way to check against
  this simple context.

  If the criteria to compare houses are more complex,
  i.e involving a larger amoung of attributes and
  variables, we could implement explicit methods to
  check against each single one, or multiple ones, or
  we could write a more complex <=> method in order
  to include all the necessary data points to make a
  good decision, if we were to buy it for example.

  But again that really depends on the context given.

  A good classes/type of abstracted objects to include
  Comparable in and override the <=> method would be
  for example:
    
    Stock: comapring the 'value' of a stock, which also
           probably is not as clear cut, i.e needs further
           context. But if we just talk about it's value,
           and we want to decide based on that context alone,
           this we certainly be a sensible way to do it.

  So in general we need to be cautious, it seems to me,
  whenever we override this method, since it seems to
  always be bound to more or less implicit/explicit
  knowledge of the context the comparison is made in.   

=end