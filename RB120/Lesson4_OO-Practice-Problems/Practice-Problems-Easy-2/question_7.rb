class Cat
  @@cats_count = 0

  def initialize(type)
    @type = type
    @age  = 0
    @@cats_count += 1
  end

  def self.cats_count
    @@cats_count
  end
end

p Cat.cats_count == 0
cat_1 = Cat.new('Ying')
cat_2 = Cat.new('Yang')
p Cat.cats_count == 2

=begin

  @@cats_count is a class variable, and is, because of that,
  accessible to the Cat class object and all the Cat class
  instances. Both the class itself and it's instance can access
  the @@cats_count class variable, by that I mean the exact same
  object in memory.

  This has the following implications:

  - On Class definition level, the @@cats_count is initialized to
    the integer zero, which means we can retrieve the class variable
    without ever calling a method before the first retrieval.
  - When we initialize a new Cat instance, the @@cats_count is
    incremented by one for each instance created.
  - When we invoke the Cat::cats_count method, we return the
    @@cats_count class variable, which has as it's value the number
    of cat objects spawned.

=end