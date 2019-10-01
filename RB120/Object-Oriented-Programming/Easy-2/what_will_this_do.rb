class Something
  def initialize
    @data = 'Hello'
  end

  def dupdata
    @data + @data
  end

  def self.dupdata
    'ByeBye'
  end
end

thing = Something.new
puts Something.dupdata
puts thing.dupdata

=begin

  Observations before running the code
  ------------------------------------

  The code will print:

    1. 'ByeBye'
    2. 'HelloHello'

  First we invoke the class method Something::dupdata
  that returns a string that is the instance variable
  @data concatenated with itself.

  Then we invoke the instance method Something#dupdate
  which always returns the String 'ByeBye'.

=end