require 'pry'

ROUND_POINTS = 5
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]]
TAG_PLAYER = 'Player'
TAG_COMPUTER = 'Computer'

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize
def display_board(board, score_player, score_computer)
  system('cls') unless system('clear')
  puts "You are #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts "Player #{score_player}/#{ROUND_POINTS} " +
       "Computer #{score_computer}/#{ROUND_POINTS}"
  puts ""
  puts "     |     |"
  puts "  #{board[1]}  |  #{board[2]}  |  #{board[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{board[4]}  |  #{board[5]}  |  #{board[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{board[7]}  |  #{board[8]}  |  #{board[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(board)
  board.keys.select { |cell| board[cell] == INITIAL_MARKER }
end

def random_empty_cell(board)
  empty_squares(board).sample
end

def joinor(arr, sep = ', ', sep_end = 'or')
  case arr.size
  when 0
    ''
  when 1
    arr.first
  when 2
    "#{arr.first} #{sep_end} #{arr.last}"
  else
    copy = arr.dup
    copy[-1] = "#{sep_end} #{copy[-1]}"
    copy.join(sep)
  end  
end

def player_places_piece!(board)
  square = ''
  loop do
    valid_squares = empty_squares(board)
    prompt "Choose a position to place a piece: (#{joinor(valid_squares)}):"
    square = gets.chomp.to_i
    break if empty_squares(board).include?(square)
    prompt "Sorry, that is not a valid choice."
  end
  board[square] = PLAYER_MARKER
end

def risky_cell_for_computer(board)
  for line in WINNING_LINES do 
    player_marked = line.select do |cell_number|
      board[cell_number] == PLAYER_MARKER
    end
    if player_marked.size == 2
      free = (line - player_marked).first
      return free if board[free] == INITIAL_MARKER
    end
  end
  nil
end

def computer_places_piece!(board)
  risky_cell = risky_cell_for_computer(board)
  if risky_cell
    board[risky_cell] = COMPUTER_MARKER
  else
    board[random_empty_cell(board)] = COMPUTER_MARKER
  end
end

def board_full?(board)
  empty_squares(board).empty?
end

def detect_winner(board)
  WINNING_LINES.each do |line|
    if line.all? { |cell| board[cell] == PLAYER_MARKER }
      return TAG_PLAYER
    elsif line.all? { |cell| board[cell] == COMPUTER_MARKER }
      return TAG_COMPUTER
    end
  end
  nil
end

def someone_won?(board)
  !!detect_winner(board)
end

def match_over?(score_player, score_computer)
  score_player >= ROUND_POINTS || score_computer >= ROUND_POINTS
end

score_player = 0
score_computer = 0

loop do
  board = initialize_board

  loop do
    display_board(board, score_player, score_computer)

    player_places_piece!(board)
    break if someone_won?(board) || board_full?(board)

    computer_places_piece!(board)
    break if someone_won?(board) || board_full?(board)

  end

  winner = ''
  if someone_won?(board)
    winner = detect_winner(board)

    score_player += 1 if winner == TAG_PLAYER
    score_computer += 1 if winner == TAG_COMPUTER

    display_board(board, score_player, score_computer)
    prompt "#{winner} won!"
  else
    prompt "It's a tie!"
  end

  if match_over?(score_player, score_computer)
    prompt "#{winner} wins the game!"
    break;
  else
    prompt "Play again? (y or n)"
    answer = gets.chomp
    break unless answer.downcase.start_with?('y')
  end
end

prompt "Thank you for playing Tic Tac Toe!"
