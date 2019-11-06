class Computer
  attr_accessor :template

  def create_template
    @template = "template 14231"
  end

  def show_template
    template
  end
end

puts "First version"
pc = Computer.new
p pc.show_template
pc.create_template
p pc.show_template

class Computer
  attr_accessor :template

  def create_template
    self.template = "template 14231"
  end

  def show_template
    self.template
  end
end

puts "Second version"
pc = Computer.new
p pc.show_template
pc.create_template
p pc.show_template

=begin

  The functionality is the exact same from the overall
  effect on the internal state of the Computer instances
  to the usage and returned values.

  The difference is merely one of syntax, at least for how
  the class definitions are right now.

  The differences are:

  The first class implementation of #create_template use the
  instance variable directly by re-assigning @template, the
  second class implementation of #create_template uses the
  public writer method to change the state of the template
  instance variable.

  The difference for both implementations of the #show_template
  methods are subtle. The first implementation used the getter
  method show_template with with the default receiver and
  the second implementation calls the getter method with an
  explicit receiver of self.

  There are potential problems if the code changed and these
  specific lines of code don't.

  In the first class definition for instance, if there was a
  local, leading the code 'template' on line line, this local
  variable would be returned and the getter method would not
  be called unless we call it with self explicitly.

  This could not happen in the second example for example
  


=end