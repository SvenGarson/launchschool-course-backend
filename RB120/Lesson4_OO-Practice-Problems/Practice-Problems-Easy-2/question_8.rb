class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
    #rules of play
    '### These are the rules poeple ###'
  end
end


bingo = Bingo.new
puts bingo.rules_of_play
puts bingo.play


=begin

  Just add the 'inheritance operator' to the right of the
  we want to inherit from another.

=end