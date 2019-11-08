require_relative 'ttt_player.rb'
require_relative 'ttt_utils.rb'

class TTTGame
  WINNING_SCORE = 5

  OPT_HUMAN = :human
  OPT_COMPUTER = :computer
  OPT_CHOOSE = :choose
  FIRST_PLAYER = OPT_CHOOSE

  private

  attr_accessor :p_human, :p_computer, :p_current

  public

  def initialize
    reset
  end

  def start
    display_welcome
    init_players
    reset
  end

  private

  def reset
    p_human&.reset_score
    p_computer&.reset_score
    set_current_player
    init_board
  end
  
  def set_current_player
    self.p_current = case FIRST_PLAYER
                     when OPT_HUMAN
                       p_human
                     when OPT_COMPUTER
                       p_computer
                     when OPT_CHOOSE
                       # choose here
                     end
  end

  def init_board

  end

  def init_players
    self.p_human = TTTPlayerHuman.new
    self.p_computer = TTTPlayerComputer.new([p_human.marker])
    p p_human
    p p_computer
    sleep 5
  end

  def display_welcome
    puts "Welcome to Tic Tac Toe!"
  end
end

TTTGame.new.start