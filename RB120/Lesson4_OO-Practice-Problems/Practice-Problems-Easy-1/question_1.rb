=begin

  1) true is an, and the only instance of the TrueClass
  2) "hello" is an instance of the String class, a literal
  3) [1, 2, 3, "happy days"] is an instance of the Array class
     which contains 4 references to other objects
  4) 142 is an instance of the Integer class

  We can retrieve the class of an object by calling the Object#class
  method.

=end

p true.class == TrueClass
p "hello".class == String
p [1, 2, 3, "happy days"].class == Array
p (142.class == Integer || 142.class == Fixnum)
