class Board
  WINNING_LINES = [
    [1, 2, 3], [4, 5, 6], [7, 8, 9], # rows
    [1, 4, 7], [2, 5, 8], [3, 6, 9], # cols
    [1, 5, 9], [3, 5, 7],            # diagonals
  ]

  def initialize
    @squares = {}
    reset
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def []=(cell, marker)
    @squares[cell].marker = marker
  end

  def full?
    unmarked_keys.empty?
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  def someone_won?
    !!winning_marker
  end

  def winning_marker
    WINNING_LINES.each do |line|
      marked = winning_markers_for(line)
      if marked.size == 3 && marked.uniq.size == 1
        return marked.first
      end
    end
    nil
  end

  # rubocop:disable Metrics/AbcSize
  def draw
    puts "   |   |   "
    puts " #{get_square_at(1)} | #{get_square_at(2)} | #{get_square_at(3)} "
    puts "   |   |   "
    puts "---+---+---"
    puts "   |   |   "
    puts " #{get_square_at(4)} | #{get_square_at(5)} | #{get_square_at(6)} "
    puts "   |   |   "
    puts "---+---+---"
    puts "   |   |   "
    puts " #{get_square_at(7)} | #{get_square_at(8)} | #{get_square_at(9)} "
    puts "   |   |   "
  end
  # rubocop:enable Metrics/AbcSize

  private

  def winning_markers_for(line)
    line.each_with_object([]) do |cell_number, accum|
      square = get_square_at(cell_number)
      accum << square.marker if square.marked?
    end
  end

  def get_square_at(key)
    @squares[key]
  end
end

class Square
  INITIAL_MARKER = ' '

  attr_accessor :marker

  def initialize
    @marker = INITIAL_MARKER
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def marked?
    !unmarked?
  end

  def to_s
    @marker
  end
end

class Player
  HUMAN_MARKER = 'X'
  COMPUTER_MARKER = 'O'

  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end

  def choose_move(_board_); end
end

class PlayerHuman < Player
  def initialize
    super(HUMAN_MARKER)
  end

  def choose_move(board)
    puts "Choose a square from (#{board.unmarked_keys.join(', ')}): "
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end

    board[square] = marker
  end
end

class PlayerComputer < Player
  def initialize
    super(COMPUTER_MARKER)
  end

  def choose_move(board)
    board[board.unmarked_keys.sample] = marker
  end
end

class TTTGame
  def play
    display_welcome_message

    loop do
      display_board

      loop do
        current_player_moves
        break if board.someone_won? || board.full?
        clear_screen_and_display_board if human_turn?
      end
      display_result

      break unless play_again?
      reset
      display_play_again_message
    end
    display_goodbye_message
  end

  private

  attr_reader :board, :human, :computer
  attr_accessor :current_player

  def initialize
    @board = Board.new
    @human = PlayerHuman.new
    @computer = PlayerComputer.new
    first_to_move
  end

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts ""
  end

  def display_goodbye_message
    puts "\nThanks for playing Tic Tac Toe!"
  end

  def clear
    system('clear') || system('cls')
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def display_result
    display_board
    case board.winning_marker
    when human.marker
      puts "You won!"
    when computer.marker
      puts "Computer won!"
    else
      puts "It's a tie!"
    end
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again? (y/n) "
      answer = gets.chomp
      break if %w(y n).include?(answer)
      puts "Sorry, must be y or n"
    end
    answer == 'y' ? true : false
  end

  def reset
    board.reset
    first_to_move
    clear
  end

  def display_play_again_message
    puts "Let's play again!\n"
  end

  def display_board
    puts "You're an #{human.marker}. Computer is an #{computer.marker}.\n"
    board.draw
    puts ""
  end

  def first_to_move
    self.current_player = human
  end

  def human_turn?
    current_player == human
  end

  def current_player_moves
    curr = current_player
    curr.choose_move(board)
    self.current_player = case curr
                          when human then computer
                          when computer then human
                          end
  end
end

game = TTTGame.new
game.play
