=begin

  The return value of #to_s depends on the objects custom 
  implementation, where as the String#to_s just returns self,
  an, for instance, Integer#to_s converts the Integer(self) to
  a string representation and returns that string.

  So it depends and varies among the object #to_s is invoked on.

  But by default, i.e, calling Object#to_s will return a string
  representing the Object's class name and it's object_id.

=end