class Matrix

  def initialize(matrix_string)

    self.data = parse_matrix_string(matrix_string)
  
  end

  def saddle_points
    saddle_points = Array.new

    each_cell_position do |row_index, column_index|
      next unless saddle_point?(row_index, column_index)

      saddle_points << [row_index, column_index]
    end

    saddle_points
  end

  def saddle_point?(row_index, column_index)

    saddle_value = data[row_index][column_index]
    row_data = rows[row_index]
    column_data = columns[column_index]

    #row_data = row_data[0...row_index] + row_data[row_index + 1..-1]
    #column_data = column_data[0...column_index] + column_data[column_index + 1..-1]

    puts "\ncoordinate: [#{row_index}, #{column_index}]"
    p row_data
    p column_data

    row_test_passed = row_data.all? { |row_value| saddle_value >= row_value}
    column_test_passed = column_data.all? { |column_value| saddle_value <= column_value }

    row_test_passed && column_test_passed
  end

  def each_cell_position
    (0...rows.first.length).each do |row_index|
      (0...rows.length).each do |column_index|
        yield(row_index, column_index)
      end
    end
  end

  def rows
    data.dup
  end

  def columns
    columns = Array.new
  
    (0...rows.first.length).each do |column_index|
      next_column = Array.new
      
      (0...rows.length).each do |row_index|
        next_column << data[row_index][column_index]
      end

      columns << next_column
    end

    columns
  end

  private

  def parse_matrix_string(matrix_string)
    row_strings = matrix_string.split("\n")
    matrix = Array.new
    
    row_strings.each do |row_string|
      row_data = row_string.split.map(&:to_i)
      matrix << row_data
    end

    matrix
  end

  def to_s
    matrix_row_strings = Array.new
    
    data.each do |row_data|
      row_string = row_data.join(', ')
      matrix_row_strings << "[#{row_string}]"
    end

    matrix_row_strings.join("\n")
  end

  attr_accessor(:data)

end