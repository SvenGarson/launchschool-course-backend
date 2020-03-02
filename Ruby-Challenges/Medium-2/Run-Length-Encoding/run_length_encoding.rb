class RunLengthEncoding
  def self.decode(encoded_string)
    count_char_groups = encoded_string.scan(/\d*[a-z\p{S} ]/i)

    decoded = ''

    count_char_groups.map! do |group|
      group_count = group[/\A\d+/]
      
      if group_count
        decoded << group[-1] * group_count.to_i
      else
        decoded << group[-1]
      end
    end

    decoded
  end

  def self.encode(raw_string)
    encoded = ''

    string_character_groups(raw_string).each do |group|    
      group_length = group.size
      
      encode_count = group_length > 1 ? group_length.to_s : ''
      encoded << encode_count + group[0]
    end

    encoded
  end

  def self.string_character_groups(string)
    groups = Array.new
    last_char = string[0]
    current_group_string = String.new

    string.each_char do |current_char|
      if current_char != last_char
        last_char = current_char
        groups << current_group_string
        current_group_string = String.new
      end
      current_group_string << current_char
    end
    groups << current_group_string
    groups
  end
end
