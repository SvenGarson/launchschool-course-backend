class Bag
  def initialize(color, material)
    @color = color
    @material = material
  end
end

my_bag = Bag.new('Brown', 'Leather')
your_bag = Bag.new('Yellow', 'Fabric')

p my_bag
p your_bag

=begin

  To create a new instance of the Bag class, we need to
  invoke the Class::new method, which again invokes, the
  in this case overriden constructor Bag#initialize(color, material)
  which we have to pass 2 arguments. One color and one material.

=end