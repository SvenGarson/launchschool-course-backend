class RailFenceCipher

  def self.encode(message, rows)
    return '' if message.empty?
    
    cipher_rows_string_array = Array.new
    rows.times { |_| cipher_rows_string_array << '' }

    diagonal_coordinates_for(message, rows).each do |cursor_x, cursor_y|

      # plot into corresonding cipher row string
      cipher_rows_string_array[cursor_y] << message[cursor_x]

    end

    cipher_rows_string_array.join

  end

  def self.decode(cipher, rows)
    return '' if cipher.empty?
    return cipher if rows == 1
    
    cipher = cipher.dup

    # count string length for rows
    row_lengths_map = Hash.new(0)

    diagonal_coordinates_for(cipher, rows).each do |cursor_x, cursor_y|

      # record number of occurences per row
      row_lengths_map[cursor_y] += 1

    end

    message_rows = Array.new(rows)
    row_lengths_map.each do |cursor_y, char_count|

      message_rows[cursor_y] = cipher[0, char_count]
      cipher = cipher[char_count..-1]
    end

    rows_to_message_string(message_rows)
  end

  private

  def self.rows_to_message_string(rows)
    
    rows = rows.dup

    rows.map!(&:chars)
    message_string = ''
    row = 0
    index_direction = 1

    loop do
      row_chars = rows[row]
      
      if row_chars.empty?
        break
      else
        message_string << row_chars.shift
      end

      next_row = row + index_direction
      if next_row >= rows.size || next_row < 0
        index_direction *= -1
      end

      row += index_direction

    end    

    message_string
  end

  def self.diagonal_coordinates_for(message, rows)
    Enumerator.new do |yielder|
      columns = message.size
      cursor_y = 0
      cursor_y_direction = 1

      for cursor_x in (0...columns)
        # record coordinate
        yielder << [cursor_x, cursor_y]

        # correct y direction before using it to increment the y cursor
        next_cursor_y = cursor_y + cursor_y_direction
        if next_cursor_y >= rows || next_cursor_y < 0
          cursor_y_direction *= -1
        end

        cursor_y += cursor_y_direction

      end
    end
  end
end