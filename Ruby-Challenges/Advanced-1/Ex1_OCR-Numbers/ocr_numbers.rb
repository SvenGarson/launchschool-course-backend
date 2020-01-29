class OCR

  OCR_CHAR_WIDTH = 3
  OCR_CHAR_HEIGHT = 3
  CHAR_COUNT_PER_OCR_CHAR = OCR_CHAR_WIDTH * OCR_CHAR_HEIGHT

  OCR_REFERENCE = <<-NUMBER.chomp
 _     _  _     _  _  _  _  _ 
| |  | _| _||_||_ |_   ||_||_|
|_|  ||_  _|  | _||_|  ||_| _|

  NUMBER

  def initialize(text)
    @text = text
    @reference_map = Hash.new
    init_ocr_reference_map
  end

  def convert

    decimal_string_result_list = Array.new

    ocr_lines(@text).each do |line|
      line_linear = ocr_line_linear(line)
      chars = ocr_chars(line_linear)
      decimal_string_result_list << ocr_chars_to_number_string(chars)
    end
      
    decimal_string_result_list.join(',')
  end

  def ocr_chars_to_number_string(ocr_chars) 
    number_string = String.new
    
    ocr_chars.each do |ocr_char|
      replacement = @reference_map[ocr_char]
      
      representative_char = replacement ? replacement : '?'
      number_string << representative_char
    end

    number_string
  end

  def init_ocr_reference_map
    reference_linear = ocr_line_linear(OCR_REFERENCE)
    reference_ocr_strings = ocr_chars(reference_linear)

    reference_ocr_strings.each_with_index do |ocr_char_string, index|
      @reference_map[ocr_char_string] = index.to_s
    end
  end

  def ocr_chars(linear_char_string)
    character_count = linear_char_string.length / CHAR_COUNT_PER_OCR_CHAR
    ocr_char_lines = Array.new
    skip_chars_to_next_char_row = character_count * OCR_CHAR_WIDTH

    for nth_char_index in (0...character_count) do
      char_lines = ''
      
      char_base_index = nth_char_index * OCR_CHAR_WIDTH
      char_base_index.step(linear_char_string.size - 1, skip_chars_to_next_char_row) do |char_line_start_index|
        char_lines << linear_char_string[char_line_start_index, OCR_CHAR_WIDTH]
      end      

      ocr_char_lines << char_lines

    end

    ocr_char_lines
  end

  def ocr_line_linear(line)
    char_strips_hori = line.split("\n")
    
    # expand each char line into a multiple of 3
    char_strips_hori.map! do |char_line|
      expected_size = next_multiple_of_3(char_line.length)
      delta = char_line.ljust(expected_size)
      puts "WTF" if delta.length == 0
      delta
    end

    char_strips_hori.join
  end

  def ocr_lines(source_text)
    source_text.split("\n\n")
  end

  def next_multiple_of_3(number)
    remainder = number % 3
    if number != 0 && remainder == 0
      number
    else
      number + (3 - remainder)
    end
  end
end