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

  def get_square_at(key)
    @squares[key]
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def set_square_at(square, marker)
    @squares[square].marker = marker
  end

  def full?
    unmarked_keys.empty?
  end

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  def someone_won?
    !!detect_winner
  end

  # returns winning marker or nil
  def detect_winner
    if WINNING_LINES.any? do |line|
      line.all? do |line_cell|
        @squares[line_cell].marker == TTTGame::HUMAN_MARKER
      end
    end
      TTTGame::HUMAN_MARKER
    elsif WINNING_LINES.any? do |line|
      line.all? do |line_cell|
        @squares[line_cell].marker == TTTGame::COMPUTER_MARKER
      end
    end
      TTTGame::COMPUTER_MARKER
    end
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

  def to_s
    @marker
  end
end

class Player
  attr_reader :marker

  def initialize(marker)
    @marker = marker
  end
end

class TTTGame
  HUMAN_MARKER = 'X'
  COMPUTER_MARKER = 'O'
  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new(HUMAN_MARKER)
    @computer = Player.new(COMPUTER_MARKER)
  end

  def display_welcome_message
    puts "Welcome to Tic Tac Toe!"
    puts ""
  end

  def display_goodbye_message
    puts "\nThanks for playing Tic Tac Toe!"  
  end

  def display_board(clear=true)
    system('clear') || system('cls') if clear
    puts "You're an #{human.marker}. Computer is an #{computer.marker}."
    puts "   |   |   "
    puts " #{board.get_square_at(1)} | #{board.get_square_at(2)} | #{board.get_square_at(3)} "
    puts "   |   |   "
    puts "---+---+---"
    puts "   |   |   "
    puts " #{board.get_square_at(4)} | #{board.get_square_at(5)} | #{board.get_square_at(6)} "
    puts "   |   |   "
    puts "---+---+---"
    puts "   |   |   "
    puts " #{board.get_square_at(7)} | #{board.get_square_at(8)} | #{board.get_square_at(9)} "
    puts "   |   |   "
  end

  def human_moves
    puts "Choose a square from (#{board.unmarked_keys.join(', ')}): "
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end
    
    board.set_square_at(square, human.marker)
  end

  def computer_moves
    board.set_square_at(board.unmarked_keys.sample, computer.marker)
  end

  def display_result
    display_board
    case board.detect_winner
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
    (answer == 'y') ? true : false
  end

  def play
    display_welcome_message

    loop do
      display_board(false)

      loop do
        human_moves
        break if board.someone_won? || board.full?

        computer_moves
        break if board.someone_won? || board.full?

        display_board
      end
      display_result
      
      break unless play_again?
      board.reset
      system('cls') || system('clear')
      puts "Let's play again!"
    end
    display_goodbye_message
  end
end

game = TTTGame.new
game.play