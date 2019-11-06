class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
  end
end

bingo = Bingo.new

# invokes Game#play since no method overrided
p bingo.play

# re-open Bingo class and define, and with that
# override the Game#play method with Bingo#play
class Bingo

  def play
    "No. I'm the real game! Let's play bingo instead!"
  end
end

p bingo.play

=begin
  
  If we initialize a Bingo object and call the #play method on it,
  Ruby will go through the usual method lookup path to find and
  execute the first method in the list to match the requested
  method.

  In this case the method lookup path is structured as following:

    1. Bingo  class
    2. Game   class
    3. Object class
    4. and so on ...

  This means that ruby will execute the play method defined in the
  Bingo class, which in this case overrided the definition in the
  Game class.

=end