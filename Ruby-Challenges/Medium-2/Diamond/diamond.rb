class Diamond
  def self.make_diamond(center_character)
    upper_sequence = ascending_character_sequence(center_character)

    return "A\n" if diamond_size(upper_sequence) == 1

    expanded_upper_sequence = expand_sequence_into_diamonds_rows(upper_sequence)
    mirror_sequence_vertically(expanded_upper_sequence).join("\n") + "\n"
  end

  def self.ascending_character_sequence(center_char)
    ('A'..center_char).to_a
  end

  def self.expand_sequence_into_diamonds_rows(sequence)
    sequence.each_with_index.map do |character, index|
      row_width = 1 + index * 2
      expanded_row = character.ljust(row_width)
      expanded_row[-1] = character
      expanded_row.center(diamond_size(sequence))
    end
  end

  def self.diamond_size(sequence)
    sequence.size * 2 - 1
  end

  def self.mirror_sequence_vertically(sequence)
    half_diamond_size = diamond_size(sequence) / 2
    sequence + sequence[0, half_diamond_size].reverse
  end
end
