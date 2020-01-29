class Diamond
  def self.make_diamond(center_char)
    # guard against A as center character
    return "A\n" if center_char == 'A'

    diamond_string = ""

    total_characters = ('A'..center_char).to_a.size
    diamond_width = (total_characters * 2) - 1
    
    # group distance and padding
    char_distance_slope_up = (1...total_characters).to_a
    char_distances = char_distance_slope_up + char_distance_slope_up.reverse[1..-1]
    center_paddings_slope_up = (1...diamond_width).to_a.select(&:odd?)
    center_paddings = center_paddings_slope_up + center_paddings_slope_up.reverse[1..-1]
    distance_padding_list = char_distances.zip(center_paddings)
    
    # drawing
    
    diamond_base_string = 'A'.center(diamond_width) + "\n"   
    diamond_string << diamond_base_string

    distance_padding_list.each do |char_distance, center_padding|
      draw_char = ('A'.ord + char_distance).chr
      diamond_string << diamond_line(draw_char, center_padding, diamond_width)
    end

    diamond_string << diamond_base_string

  end

  private

  def self.diamond_line(character, center_padding, diamond_width)
    (character + " " * center_padding + character).center(diamond_width) + "\n"
  end
end