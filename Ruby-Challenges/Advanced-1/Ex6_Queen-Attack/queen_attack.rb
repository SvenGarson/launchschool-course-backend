class Position
  attr_accessor(:row, :column)

  def initialize(row_column_array)
    self.row = row_column_array.first
    self.column = row_column_array.last
  end

  def +(other_position)
    Position.new([row + other_position.row, column + other_position.column])
  end

  def ==(other_position)
    row == other_position.row && column == other_position.column
  end

  def to_a
    [row, column]
  end

  def to_s
    "row: #{row}, column:#{column}"
  end
end

class Queens

  BOARD_SIZE = 8
  COORDINATE_RANGE = (0...BOARD_SIZE)
  WHITE_QUEEN_CHAR = 'W'
  BLACK_QUEEN_CHAR = 'B'
  NO_PAWN_CHAR = '_'

  def initialize(white: [0, 3], black: [7, 3])
    self.white_position = Position.new(white)
    self.black_position = Position.new(black)
    
    init_board
    validate_queen_positions
    plot_queen_markers
  end

  def white
    white_position.to_a
  end

  def black
    black_position.to_a
  end

  def set_char_at(position, character)
    return unless coordinates_valid?(position)

    board_rows_string_array[position.row][position.column] = character
  end

  def char_at(position)
    return unless coordinates_valid?(position)
    
    board_rows_string_array[position.row][position.column]
  end

  def attack?
    row_tiles = gather_white_queen_row_tiles
    column_tiles = gather_white_queen_column_tiles
    diagonal_tiles = gather_white_queen_diagonal_tiles
    
    tiles_to_check = row_tiles + column_tiles + diagonal_tiles
    
    tiles_to_check.include?(BLACK_QUEEN_CHAR)
  end

  def to_s
    map_string = ''
    
    board_rows_string_array.each do |row|
      map_string << row.chars.join(' ') + "\n"
    end

    map_string.chomp
  end

  private

  def gather_white_queen_diagonal_tiles
    diagonal_tiles = ''
    diagonal_tiles << gather_board_tiles_in_direction(from: white_position, direction: Position.new([ 1,  1]))
    diagonal_tiles << gather_board_tiles_in_direction(from: white_position, direction: Position.new([-1,  1]))
    diagonal_tiles << gather_board_tiles_in_direction(from: white_position, direction: Position.new([ 1, -1]))
    diagonal_tiles << gather_board_tiles_in_direction(from: white_position, direction: Position.new([-1, -1]))
    diagonal_tiles
  end

  def gather_white_queen_column_tiles
    column_tiles = ''
    column_tiles << gather_board_tiles_in_direction(from: white_position, direction: Position.new([ 1,  0]))
    column_tiles << gather_board_tiles_in_direction(from: white_position, direction: Position.new([-1,  0]))
    column_tiles
  end

  def gather_white_queen_row_tiles
    row_tiles = ''
    row_tiles << gather_board_tiles_in_direction(from: white_position, direction: Position.new([ 0, -1]))
    row_tiles << gather_board_tiles_in_direction(from: white_position, direction: Position.new([ 0,  1]))
    row_tiles
  end

  def gather_board_tiles_in_direction(from: , direction: )
    gathered_tile_characters = ''
    next_tile_position = from + direction
    
    while coordinates_valid?(next_tile_position)
      gathered_tile_characters << char_at(next_tile_position)

      next_tile_position += direction
    end

    gathered_tile_characters
  end

  def init_board
    self.board_rows_string_array = Array.new(BOARD_SIZE)
    
    BOARD_SIZE.times do |row_index|
      board_rows_string_array[row_index] = NO_PAWN_CHAR * BOARD_SIZE
    end
  end

  def validate_queen_positions
    raise ArgumentError, "White queen: #{white_position} is not a valid position!" unless coordinates_valid?(white_position)
    raise ArgumentError, "Black queen: #{black_position} is not a valid position!" unless coordinates_valid?(black_position)
    raise ArgumentError, "White and Black queen cannot occupy the same position!" if white_position == black_position
  end

  def plot_queen_markers
    set_char_at(white_position, WHITE_QUEEN_CHAR)
    set_char_at(black_position, BLACK_QUEEN_CHAR)
  end

  def coordinates_valid?(position)
    COORDINATE_RANGE.cover?(position.row) && COORDINATE_RANGE.cover?(position.column)
  end

  attr_accessor(:white_position, :black_position, :board_rows_string_array)
end