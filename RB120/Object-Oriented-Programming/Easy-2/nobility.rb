module Walkable
  def walk
    "#{name} #{gait} forward"
  end
end

class Person
  include Walkable
  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "strolls"
  end
end

class Cat
  include Walkable
  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "saunters"
  end
end

class Cheetah
  include Walkable
  attr_reader :name

  def initialize(name)
    @name = name
  end

  private

  def gait
    "runs"
  end
end

class Noble
  include Walkable  

  attr_reader :name, :title

  def initialize(name, title)
    @name = name
    @title = title
  end

  def walk
    "#{title} #{name} #{gait} forward"
  end

  def gait
    'struts'
  end

end

byron = Noble.new("Byron", "Lord")

p byron.walk == "Lord Byron struts forward"
p byron.name == "Byron"
p byron.title == "Lord"

=begin

  Thoughts further exploration
  ----------------------------

  This can be solved in many ways using inheritance and
  mixing in modules.

  One approach
  ------------

  We could have a superclass names 'Walker' that has the
  type of gait and the name as state, even for the Noble
  we could just enter the title as name in the right order.

  Each subclass would then initialize the super class by 
  passing it the right name and gait, and also off course
  define te right getter methods for the name and gait.
  
  In this Walker class we could define the 'walk' method
  to return the desired string by interpolating the name
  and gait in the superclass by using the getter methods.

  We could just define a new type of entity which inherits
  that functionality from the Walker superclass.

  If we were to treat the 'title' differently, we could
  mostly keep out structure but could add a to_s method
  to the Walker class and override that in the Noble class
  to include the title in front of the name, where the
  title could be a state in  the Noble class itself.

  There are more ways off course, but we want to move
  the common state and behaviour as far up the hierarchy
  as possible and also have the code as clean and concise
  as we can.

=end