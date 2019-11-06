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

=begin

  At the point where we define self.cats_count, the current self object
  is the Cat class object itself, which is why this method ends up being
  a class method.

  This is why the methods Cat::cats_count is available as a class method
  by invoking Cat.cats_count.

=end