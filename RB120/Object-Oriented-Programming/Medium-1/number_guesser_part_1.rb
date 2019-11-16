class GuessingGame

  GUESS_RANGE = (1..100)
  MAX_GUESSES = 7
  RESULT_WON = :won
  RESULT_LOST = :lost

  def play
    reset
    
    game_result = loop do
      display_remaining_guesses
      guess = prompt_valid_number
      consume_guess

      display_feedback_guessed_number(guess)

      break(RESULT_WON) if guess_correct?(guess)

      unless guess_remaining?
        display_no_more_guesses
        break(RESULT_LOST)
      end
          
    end

    display_game_result(game_result)
        
  end

  private

  attr_accessor :number_to_guess, :guesses_left

  def display_no_more_guesses
    print "\nYou have no more guesses. "
  end

  def display_game_result(result)
    game_result_message = case result
                          when RESULT_WON
                            "\nYou won!"
                          when RESULT_LOST
                            "You lost!"
                          end

    print "#{game_result_message}\n\n"
  end

  def consume_guess
    self.guesses_left = guesses_left - 1
  end

  def guess_remaining?
    guesses_left > 0
  end

  def guess_correct?(guess)
    guess == number_to_guess
  end

  def prompt_valid_number
    loop do
      display_enter_number_prompt
      choice = gets.chomp
      break(choice.to_i) if valid_input_string?(choice)
      print "Invalid guess. "
    end
  end

  def valid_input_string?(input_string)
    valid_int_string?(input_string) && GUESS_RANGE.cover?(input_string.to_i)
  end

  def valid_int_string?(number_string)
    number_string.to_i.to_s == number_string
  end

  def display_feedback_guessed_number(guess)
    feedback_message = case guess <=> number_to_guess
                       when 0
                         "That's the number!"
                       when -1
                         "Your guess is too low."
                       else
                         "Your guess is too high."
                       end
    puts feedback_message
  end

  def display_enter_number_prompt
    print "Enter a number between #{GUESS_RANGE.first} and " \
          "#{GUESS_RANGE.last}: "
  end

  def display_remaining_guesses
    guess_string = (guesses_left > 1) ? 'guesses' : 'guess'
    puts "\nYou have #{guesses_left} #{guess_string} remaining."
  end
  
  def reset
    find_random_guessing_number
    self.guesses_left = MAX_GUESSES
  end

  def find_random_guessing_number
    self.number_to_guess = GUESS_RANGE.to_a.sample
  end

end

game = GuessingGame.new
game.play
game.play

=begin

I think with the current program features, an additional Player class
does not make sense, since all the player does really is to choose a
number. We could store the amount of guesses left as well as the choice
made in a Player class, ut again since this program is so simple, it is
simpler and we have less complexity by implementing it in 1 class.

But if we were to implement a Player class, we would only ever need one
instance of it, which could be worthwhile with more Player responsiblities.

We could just make the Player instance a collaborator of the Game class.

=end