require 'pry'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

def prompt(msg)
  puts "=> #{msg}"
end

def display_board(board)
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

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER}
  new_board
end

def empty_squares(board)
  board.keys.select{ |cell| board[cell] == INITIAL_MARKER}
end

def player_places_piece!(board)
  square = ''
  loop do
    prompt "Choose a square (#{empty_squares(board).join(',')}):"
    square = gets.chomp.to_i
    break if empty_squares(board).include?(square)
    prompt "Sorry, that is not a valid choice."
  end
  board[square] = PLAYER_MARKER
end

def computer_places_piece!(board)
  square = empty_squares(board).sample
  board[square] = COMPUTER_MARKER
end

def board_full?(board)
  empty_squares(board).empty?
end

def detect_winner(board)
  winning_lines = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                  [[1, 5, 9], [3, 5, 7]]              # diagonals
  
end

def someone_won?(board)
  !!detect_winner(board)
end

board = initialize_board
display_board(board)

loop do
  player_places_piece!(board)
  computer_places_piece!(board)
  display_board(board)
  break if someone_won?(board) || board_full?(board)
end

if someone_won?(board)
  prompt "#{detect_winner(board)} won!"
else
  prmpt "It's a tie!"
end

display_board(board)