class Television
  def self.manufacturer
    # method logic
    'IBeeM'
  end

  def model
    # method logic
  end
end

p Television.manufacturer
p Television::manufacturer

=begin

  Television::manufacturer is a class method since it is
  defined on the object self, which at definition time is
  the Television class object itself.

  We can invoke the Television::manufacturer class method
  like so:

    Television.manufacturer or even Television::manufacturer
    since a class name is also just a constant.

=end