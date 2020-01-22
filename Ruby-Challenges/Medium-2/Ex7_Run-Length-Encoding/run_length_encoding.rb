class RunLengthEncoding

  def self.encode(data_string)
    string_chunks = chunk_string_characters(data_string)

    string_chunks.each.with_object(String.new) do |chunk, encoded_string|
      encode_length_string = chunk.length == 1 ? '' : chunk.length.to_s
      encoded_string << "#{encode_length_string}#{chunk[0]}"
    end
  end

  def self.decode(encoded_string)
    count_char_groups = encoded_string.scan(/\d*[a-z ]{1}/i)
    count_char_groups.each_with_object(String.new) do |count_char, decoded_string|
      count = count_char[/\A\d+/]
      count = count.nil? ? 1 : count.to_i
      
      char = count_char[/[a-z ]\z/i]  
      decoded_string << (char * count)
    end
  end

  private

  def self.chunk_string_characters(string)
    last_char = string[0]
    chunks = Array.new
    chunk_string = String.new
    
    string.each_char do |current_char|
      # detect  when to start new chunk
      if current_char != last_char
        chunks << chunk_string
        chunk_string = String.new
      end

      chunk_string << current_char
      last_char = current_char
    end

    chunks << chunk_string
  end

end