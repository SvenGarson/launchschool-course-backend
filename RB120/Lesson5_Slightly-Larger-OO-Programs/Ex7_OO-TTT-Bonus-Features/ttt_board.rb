class TTTBoard
  private

  WINNING_LINES = [
    [1, 2, 3], [4, 5, 6], [7, 8, 9], # rows
    [1, 4, 7], [2, 5, 8], [3, 6, 9], # cols
    [1, 5, 9], [3, 5, 7],            # diagonals
  ]

  attr_accessor :cells

  public

  def initialize
    clear
  end

  def display
    div = "+-----------+"

    puts div
    puts "| #{marker_at(1)} | #{marker_at(2)} | #{marker_at(3)} |"
    puts div
    puts "| #{marker_at(4)} | #{marker_at(5)} | #{marker_at(6)} |"
    puts div
    puts "| #{marker_at(7)} | #{marker_at(8)} | #{marker_at(9)} |"
    puts div
  end

  def []=(index, marker)
    cells[index - 1].marker = marker
  end

  def marker_wins?(marker)
    WINNING_LINES.any? do |line|
      line_contains_marker_thrice(line, marker)
    end
  end

  def unmarked_cells
    unmarked_numbers = []
    cells.each_with_index do |cell, index|
      unmarked_numbers << (index + 1) if cell.unmarked?
    end
    unmarked_numbers
  end

  def more_than_one_unmarked?
    unmarked_cells.size > 1
  end

  def full?
    unmarked_cells.empty?
  end

  def center_free?
    unmarked_cells.include?(5)
  end

  def clear
    self.cells = (1..9).to_a.map do |_|
      TTTCell.new
    end
  end

  def cell_at(index)
    cells[index - 1]
  end

  def winning_cell_number_for(marker)
    WINNING_LINES.each do |line|
      line_stats = TTTLineStats.new(marker, line, self)
      if line_stats.winning_cell_number?
        return line_stats.winning_cell_number
      end
    end
    nil
  end

  def defense_cell_number_for(marker)
    WINNING_LINES.each do |line|
      line_stats = TTTLineStats.new(marker, line, self)
      if line_stats.defense_cell_number?
        return line_stats.defense_cell_number
      end
    end
    nil
  end

  def winning_cell_for?(marker)
    !!winning_cell_number_for(marker)
  end

  def defense_cell_for?(marker)
    !!defense_cell_number_for(marker)
  end

  private

  def line_contains_marker_thrice(line, marker)
    # check if line contains the marker 3 times
    line.all? do |cell_number|
      marker_at(cell_number) == marker
    end
  end

  def marker_at(index)
    cells[index - 1].marker
  end
end

class TTTCell
  MARKER_INIT = ' '

  attr_accessor :marker

  def initialize
    self.marker = MARKER_INIT
  end

  def marked?
    marker != MARKER_INIT
  end

  def unmarked?
    !marked?
  end
end

class TTTLineStats
  private

  attr_accessor :count_map, :unmarked_cell_num, :self_marker

  public

  def initialize(marker, line, board)
    self.self_marker = marker
    self.count_map = Hash.new(0)
    gen_line_stats(line, board)
  end

  def gen_line_stats(line, board)
    line.each do |cell_num|
      cell = board.cell_at(cell_num)
      marker = cell.marker

      if cell.unmarked?
        count_map[:count_unmarked] += 1
        self.unmarked_cell_num = cell_num
      elsif marker == self_marker
        count_map[:count_self] += 1
      else
        count_map[:count_other] += 1
      end
    end
  end

  def winning_cell_number
    # return nil if line does not contain winning cell
    map = count_map
    return if map[:count_self] != 2 || map[:count_unmarked] != 1
    unmarked_cell_num
  end

  def defense_cell_number
    # return nil if line does not contain winning cell
    map = count_map
    return if map[:count_other] != 2 || map[:count_unmarked] != 1
    unmarked_cell_num
  end

  def winning_cell_number?
    !!winning_cell_number
  end

  def defense_cell_number?
    !!defense_cell_number
  end
end
