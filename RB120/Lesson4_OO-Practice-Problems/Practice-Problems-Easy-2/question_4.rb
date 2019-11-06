class BeesWax

  attr_accessor :type

  def initialize(type)
    @type = type
  end

  def describe_type
    puts "I am a #{@type} of Bees Wax"
  end
end

some_wax = BeesWax.new('Some')
p some_wax.type == 'Some'
some_wax.type = 'Bright'
p some_wax.type == 'Bright'

=begin

  We can replace the two explicit definitions for the type attribute's
  setter and getter methods, namely BeesWax#type and BeesWax#type=,
  by one method call which will define both methods for us.

  So we removed the setter and getter method with 'attr_accessor :type',
  which is really a method clal like so: 

  attr_accessor(:type)

=end