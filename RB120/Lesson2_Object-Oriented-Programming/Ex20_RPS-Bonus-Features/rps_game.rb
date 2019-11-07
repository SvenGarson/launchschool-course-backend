class RPSGameResult
  private

  attr_writer :round_winner, :game_winner, :winner,
              :round_msg, :game_msg

  public

  attr_reader :round_winner, :game_winner, :winner,
              :round_msg, :game_msg

  def initialize(round_winner, game_winner, winner, round_msg, game_msg)
    @round_winner = round_winner
    @game_winner = game_winner
    @winner = winner
    @round_msg = round_msg
    @game_msg = game_msg
  end
end

class RPSGame
  private

  attr_reader :history
  attr_reader :result

  public

  attr_accessor :max_score, :player_human, :player_computer, :result

  def initialize
    @history = RPSHistory.new
  end

  def tick
    winner = detect_winner_and_increment_score

    round_msg = winner ? "#{winner.name} wins the round!" : "It's a tie!"
    game_msg = winner ? "#{winner.name} wins the game!" : ''

    self.result = RPSGameResult.new(!!winner,
                                    game_over?,
                                    winner,
                                    round_msg,
                                    game_msg)

    add_result_to_history
  end

  def detect_winner_and_increment_score
    human = player_human
    computer = player_computer

    if human.move > computer.move
      human.increment_score
      human
    elsif computer.move > player_human.move
      computer.increment_score
      computer
    end
  end

  def add_result_to_history
    # player_move_name, computer_move_name, winner_name
    history.add_entry(player_human.move.to_s.capitalize,
                      player_computer.move.to_s.capitalize,
                      result.winner ? result.winner.name : 'Tie')
  end

  def round_winner?
    result.round_winner
  end

  def round_message
    result.round_msg
  end

  def game_winner?
    result.game_winner
  end

  def game_message
    result.game_msg
  end

  def reset
    player_human&.zero_score
    player_computer&.zero_score
    history.clear
  end

  def print_player_score
    human = player_human
    computer = player_computer
    str_human_score = "\n  #{human.name}: #{human.score}/#{max_score}"
    str_computer_score = "\n  #{computer.name}: #{computer.score}/#{max_score}"
    RPSOutput.print_typewriter(str_human_score)
    RPSOutput.print_typewriter(str_computer_score)
  end

  def print_history
    history.print_table(player_human, player_computer)
    print_player_score
  end

  private

  def game_over?
    player_human.score >= max_score || player_computer.score >= max_score
  end
end
