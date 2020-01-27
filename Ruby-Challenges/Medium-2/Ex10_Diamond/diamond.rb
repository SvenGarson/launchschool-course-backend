class Diamond
  def self.make_diamond(center_char)
    chars = ('A'..center_char).to_a
    diamond_width = (chars.size * 2) - 1
    ramp_char_count = chars.size - 2
    between_center_padding = (1..(ramp_char_count * 2 + 1)).select(&:odd?)
    diamond_string = ''

    p between_center_padding
    diamond_string << diamond_line_string('A', 0, diamond_width)
    diamond_string << diamond_line_string(center_char, diamond_width - 2, diamond_width)
    diamond_string << diamond_line_string('A', 0, diamond_width)
  end

  private

  def self.diamond_line_string(char, center_padding, width)
    if center_padding == 0
      char.center(width) + "\n"
    else
      char + ' '.center(center_padding) + char + "\n"
    end
  end
end

puts Diamond.make_diamond('C')