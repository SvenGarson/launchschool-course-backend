class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

oracle = Oracle.new
10.times do |_|
  p oracle.predict_the_future
end

=begin

  The result will of oracle.predict_the_future, after initializing
  the oracle instance, will be either of the 3 strings:

    1. 'You will eat a nice lunch'
    2. 'You will take a nap soon'
    3. 'You will stay at work late'

  Since when we invoke the Oracle#predict_the_future method,
  we return the concatenated string 'You will ' with a random
  string received from the return value of the Oracle#choices
  method invocation, which is an array containing these 3 strings. 

=end