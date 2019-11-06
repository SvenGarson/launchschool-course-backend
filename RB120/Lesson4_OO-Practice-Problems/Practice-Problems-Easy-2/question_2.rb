class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end

trip = RoadTrip.new
10.times do |_|
  p trip.predict_the_future
end

=begin

  The result will be the same format as in question 1, but this time
  there are 2 methods with the same name in the lokup path.

  Even though the Oracle, which is the superclass of RoadTrip,
  contains the method definition for Oracle#predict_the_future
  and for Oracle#choice, when invoking the #choice method, ruby starts
  at the bottom of the chain, in this case the class RoadTrip through
  the method lookup path.

  in this case the RoadTrip#choices is the first occurence of a method
  called choices, so this is the one executed and in turn, the
  RoadTrip#choices return value is used as the random ending for the
  string ni the format 'You will ' + random string from RoadTrip#choices

  So the possible return values are:

    1. 'You will visit Vegas'
    2. 'You will fly to Fiji'
    3. 'You will romp in Rome'

=end