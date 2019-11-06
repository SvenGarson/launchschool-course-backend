class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    @age += 1
  end
end

cat = Cat.new('Clumsy')
puts cat.age == 0
cat.make_one_year_older
puts cat.age == 1

=begin

  We can just 

=end