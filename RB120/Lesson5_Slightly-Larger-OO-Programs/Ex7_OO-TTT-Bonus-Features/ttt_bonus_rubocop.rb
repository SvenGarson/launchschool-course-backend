require_relative 'ttt_player.rb'
require_relative 'ttt_utils.rb'
require_relative 'ttt_board.rb'

class TTTGame
  WINNING_SCORE = 5

  OPT_HUMAN = :human
  OPT_COMPUTER = :computer
  OPT_CHOOSE = :choose
  FIRST_PLAYER = OPT_CHOOSE

  private

  attr_accessor :p_human, :p_computer, :p_current,
                :p_last_chosen, :board

  public

  def initialize
    clear
    display_welcome
    init_players
    self.board = TTTBoard.new
  end

  def start
    loop do # per game loop
      reset_game
      loop do # per round loop
        clear_and_display_board
        choose_cell
        clear_and_display_board

        grant_winner_point
        display_round_result

        break if game_over?
        finalize_round
      end
      display_game_winner
      break unless play_again?
    end
    display_goodbye
  end

  private

  def give_reading_time
    sleep 3
  end

  def display_game_winner
    clear_and_display_board if p_current == p_computer
    puts "\n#{p_current.name} wins the game!"
  end

  def display_round_winner
    puts "\n#{p_current.name} wins the round!"
  end

  def display_tie
    puts "\nIt's a tie!"
  end

  def display_welcome
    puts "Welcome to Tic Tac Toe!"
  end

  def display_goodbye
    clear
    puts "\nThank you for playing Tic Tac Toe <3\n\n"
  end

  def grant_winner_point
    return unless board.marker_wins?(p_current.marker)
    p_current.increment_score
  end

  def round_winner?
    board.marker_wins?(p_current.marker)
  end

  def game_over?
    p_current.score >= WINNING_SCORE
  end

  def next_round?
    round_winner? || board.full?
  end

  def finalize_round
    board.clear if next_round?
    alternate_player
  end

  def display_round_result
    if round_winner?
      display_round_winner
      give_reading_time
    elsif board.full?
      display_tie
      give_reading_time
    end
  end

  def play_again?
    TTTInput.prompt_yes_no?("\nDo you want to play \
another round to #{WINNING_SCORE} points? (y/n)",
                            "\nPlease choose ")
  end

  def display_players
    human = p_human
    comp = p_computer
    name_human = TTTStringGen.expand_to_length(human.name, comp.name)
    name_comp = TTTStringGen.expand_to_length(comp.name, human.name)
    puts "(#{human.marker}) #{name_human} #{human.score} \
/ #{WINNING_SCORE}"
    puts "(#{comp.marker}) #{name_comp} #{comp.score} \
/ #{WINNING_SCORE}"
  end

  def display_board
    board.display
    display_players
  end

  def clear
    TTTOutput.clear
  end

  def clear_and_display_board
    clear
    display_board
  end

  def reset_game
    p_human&.reset_score
    p_computer&.reset_score
    set_current_player
    board.clear
  end

  def choose_cell
    p_current.choose_cell(board)
  end

  def alternate_player
    # next player the one initially defined by
    # the constant or the one chosen by the user
    if next_round?
      self.p_current = p_last_chosen
    else
      self.p_current = case p_current
                       when p_human
                         p_computer
                       when p_computer
                         p_human
                       end
    end
  end

  def set_current_player
    self.p_current = case FIRST_PLAYER
                     when OPT_HUMAN
                       p_human
                     when OPT_COMPUTER
                       p_computer
                     when OPT_CHOOSE
                       choose_player
                     end
    self.p_last_chosen = p_current
  end

  def choose_player
    choice = TTTInput.prompt_options(
      "\nDo you want to play first? ",
      "\nPlease choose yes(y) or no(n).",
      "\nw(yes no Yes No y n)"
    )
    choice.start_with?('y') ? p_human : p_computer
  end

  def init_board
    self.board = TTTBoard.new
  end

  def init_players
    self.p_human = TTTPlayerHuman.new
    self.p_computer = TTTPlayerComputer.new(p_human.marker)
  end
end

# game flow starts here
TTTGame.new.start
