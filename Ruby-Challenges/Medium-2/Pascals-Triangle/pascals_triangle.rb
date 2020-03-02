class Triangle
  def initialize(row_count)
    self.row_count = row_count
  end

  def rows
    base_rows = triangle_base_rows

    base_rows[1..-1].each_cons(2) do |last_row, current_row|
      1.upto(current_row.size - 2) do |current_index|
        current_row[current_index] = current_row_value(current_index, last_row)
      end
    end

    base_rows
  end

  private

  def current_row_value(current_index, last_row)
    last_row[current_index - 1] + last_row[current_index]
  end

  def triangle_base_rows
    # generate rows of correct length rows with value 1
    Array.new(row_count) do |index|
      [1] * (index + 1)
    end
  end

  attr_accessor(:row_count)
end
