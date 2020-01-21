class Triangle

  attr_reader(:rows)

  def initialize(row_count)
    self.row_count = row_count
    initialize_rows
    compute_rows
  end

  private

  def compute_rows
    rows.each_with_index do |row, row_index|
      row.each_with_index do |cell, cell_index|
        # ignore 1's already set in skelleton, i.e, the edge
        next if cell == 1
        
        # compute cell based on last row
        last_row = rows[row_index - 1]
        cell_value = last_row[cell_index-1, 2].sum
        rows[row_index][cell_index] = cell_value
      end
    end
  end

  def initialize_rows
    self.rows = Array.new
    rows << [1]
  
    (2..row_count).each do |nth_row|
      center_cells = (nth_row - 2) > 0 ? (nth_row - 2) : 0
      row = [1] + ([0] * center_cells) + [1]
      rows << row
    end
  end

  attr_reader(:row_count)
  attr_writer(:row_count, :rows)

end