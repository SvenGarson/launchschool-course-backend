class ValueError < StandardError

end

class Board

  VALID_EDGE_BORDER_PATTERN = /\A\+-*\+\z/
  VALID_TILE_BORDER_PATTERN = /\A\|.*\|\z/
  VALID_BOARD_CHARACTERS_PATTERN = /\A[-\+\|\* ]*\z/

  def initialize(board_row_strings)
    # catch invalid board data
    raise ValueError.new('Board data invalid!') unless self.class.board_data_valid?(board_row_strings)

    init_board_data(board_row_strings)
  end

  def self.transform(board_row_strings)
    board = Board.new(board_row_strings)
    board.mark_bomb_count_in_copy
  end

  attr_accessor(:row_strings, :tile_count_horizontal, :tile_count_vertical)

  def mark_bomb_count_in_copy
    board_rows_copy = copy_board_rows

    each_empty_cell_at_coordinate do |center_x, center_y|
      bomb_count = bomb_count_around(center_x, center_y)

      board_rows_copy[center_y][center_x] = bomb_count.to_s if bomb_count != 0
    end

    board_rows_copy
  end

  private

  def bomb_count_around(x, y)
    bomb_count = 0

    (y - 1).upto(y + 1) do |neighbour_y|
      (x - 1).upto(x + 1) do |neighbour_x|
        # ignore center character of invalid coordinates
        next if (neighbour_x == x) && (neighbour_y == y)
        # ignore invalid coordinates
        next unless coordinates_valid?(neighbour_x, neighbour_y)

        # count if neighbour is bomb character
        neighbour_character = char_at(neighbour_x, neighbour_y)
        bomb_count += 1 if neighbour_character == '*'
      end
    end

    bomb_count
  end

  def each_empty_cell_at_coordinate
    (1...(tile_count_vertical - 1)).each do |y|
      (1...(tile_count_horizontal - 1)).each do |x|
        # ignore cells that are any other character than space
        next unless char_at(x, y) == ' '
      
        yield(x, y)
      end
    end
  end

  def char_at(x, y)
    row_strings[y][x]
  end

  def coordinates_valid?(x, y)
    (0...tile_count_horizontal).cover?(x) && (0...tile_count_vertical).cover?(y)
  end

  def copy_board_rows
    row_strings.each_with_object(Array.new) do |row, row_string_copy|
      row_string_copy << row.dup
    end
  end

  def init_board_data(board_row_strings)
    self.row_strings = board_row_strings
    self.tile_count_horizontal = row_strings.first.length
    self.tile_count_vertical = row_strings.size
  end

  def self.board_data_valid?(board_row_strings)
    passed_rows_same_length = board_rows_same_length?(board_row_strings)
    passed_border_intact = board_rows_border_intact?(board_row_strings)
    passed_valid_characters = board_rows_characters_valid?(board_row_strings)

    passed_rows_same_length && passed_border_intact && passed_valid_characters
  end

  def self.board_rows_characters_valid?(board_row_strings)
    board_row_strings.join.match?(VALID_BOARD_CHARACTERS_PATTERN)
  end

  def self.board_rows_border_intact?(board_row_strings)
    board_row_strings.all? do |row_string|
      edge_border_valid = row_string.match?(VALID_EDGE_BORDER_PATTERN)
      tile_border_valid = row_string.match?(VALID_TILE_BORDER_PATTERN)
      edge_border_valid || tile_border_valid
    end
  end

  def self.board_rows_same_length?(board_row_strings)
    # fail if now map row string
    return false if board_row_strings.empty?

    first_row_length = board_row_strings.first.length

    board_row_strings[1..-1].all? do |row_string|
      row_string.length == first_row_length
    end
  end

end