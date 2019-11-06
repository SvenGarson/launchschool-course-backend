module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end

puts "\nStarting at Orange class:"
p Orange.ancestors

puts "\n\nStarting at HotSauce class:"
p HotSauce.ancestors
puts ''

=begin

  When an object receives a message, i.e a method is called on
  an object, ruby goes up the method lookup path in the exact
  same order every time, and executes the first found method
  matching the called methods name. This order is:

    1. modules prepended by the class of the instance receiving
       the message
    2. the class definition of the object itself
    3. modules included by the class of the instance receiving
       the message
    4. The same for the superclass until ruby finds a matching
       definition, or does not find it at all, at which point
       it will throw an exception.


  We can find an objects ancesors by thinking through the rules
  Ruby enforced by walking the lookup path, or we call the ::anncestors
  method, which returns an array of the ancestors, from which we can
  derive in what order the methods may be called.

  For the given exmaple the lookup chain is:

    Starting at an Orange instance:
      1. Orange class
      2. Taste module
      3. Object class
      4. Kernel module
      5. BasicObject class

    Starting at a HotSauce instance:
      1. HotSauce class
      2. Taste module
      3. Object class
      4. Kernel module
      5. BasicObject class

=end