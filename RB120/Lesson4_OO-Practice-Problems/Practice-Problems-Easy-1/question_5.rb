class Fruit
  def initialize(name)
    p name.object_id
    name = name
    p name.object_id
  end
end

class Pizza
  def initialize(name)
    @name = name
  end
end

=begin

  Only the Pizza class has an instance variable called name.
  We know, because instance variables are lead by one '@',
  which makes them accessible when the current self object
  is an instance of that same class.

  Furthermore, the Pizza class overrides the constructor,
  which is invoked when we call Pizza.new, which is why, when
  we spawn a new instance of the Pizza class, the instance
  variable name is initialized.

  In the Fruit method we just initialize a local variable.
  And actually it's not even that, since the identifiers is
  the same than the parameter passed in, it is just re-assignment
  to the same object, so nothing changed.

=end