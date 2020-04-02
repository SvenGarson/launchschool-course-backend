class OCR
  DIGIT_ZERO = <<-NUMBER.chomp
 _
| |
|_|

  NUMBER

  DIGIT_ONE = <<-NUMBER.chomp

  |
  |

  NUMBER

  DIGIT_TWO = <<-NUMBER.chomp
 _
 _|
|_

  NUMBER

  DIGIT_THREE = <<-NUMBER.chomp
 _
 _|
 _|

  NUMBER

  DIGIT_FOUR = <<-NUMBER.chomp

|_|
  |

  NUMBER

  DIGIT_FIVE = <<-NUMBER.chomp
 _
|_
 _|

  NUMBER

  DIGIT_SIX = <<-NUMBER.chomp
 _
|_
|_|

  NUMBER

  DIGIT_SEVEN = <<-NUMBER.chomp
 _
  |
  |

  NUMBER

  DIGIT_EIGHT = <<-NUMBER.chomp
 _
|_|
|_|

  NUMBER

  DIGIT_NINE = <<-NUMBER.chomp
 _
|_|
 _|

  NUMBER

  OCR_DIGIT_TO_CHARACTER_MAP = {
    DIGIT_ZERO  => '0',
    DIGIT_ONE   => '1',
    DIGIT_TWO   => '2',
    DIGIT_THREE => '3',
    DIGIT_FOUR  => '4',
    DIGIT_FIVE  => '5',
    DIGIT_SIX   => '6',
    DIGIT_SEVEN => '7',
    DIGIT_EIGHT => '8',
    DIGIT_NINE  => '9'
  }

  def initialize(ocr_text)
    self.ocr_text = ocr_text
  end

  def convert
    ocr_rows = Array.new

    ocr_text.split("\n\n").each do |raw_ocr_row|
      padded_lines = padd_lines_to_multiple_of_3(raw_ocr_row)
      all_chars = extract_ocr_characters(padded_lines)

      converted_string = ''

      all_chars.each do |ocr_char_string|
        converted_string << convert_ocr_char(ocr_char_string)
      end

      ocr_rows << converted_string
    end

    ocr_rows.join(',')
  end

  private

  def padd_lines_to_multiple_of_3(text)
    padded_splits = text.split("\n").map do |line|
      rpad_to_multiple_of_3(line)
    end

    padded_splits.join("\n")
  end

  def next_multiple_of_3(number)
    if (number % 3) == 0
      number
    else
      number.fdiv(3).ceil.to_i * 3
    end
  end

  def rpad_to_multiple_of_3(text)
    padd_size = if text.empty?
                  3
                else
                  next_multiple_of_3(text.length)
                end

    text.ljust(padd_size)
  end

  def valid_length?
    ocr_text.count("\n") == 3
  end

  def convert_ocr_char(text)
    if OCR_DIGIT_TO_CHARACTER_MAP.key?(text)
      OCR_DIGIT_TO_CHARACTER_MAP[text]
    else
      '?'
    end
  end

  def extract_ocr_characters(text)
    lines = text.split("\n")
    ocr_chars_in_text = lines.first.length / 3

    ocr_chars = Array.new

    0.upto(ocr_chars_in_text - 1) do |ocr_index|
      start_index = ocr_index * 3
      end_index = start_index + 3

      ocr_char = Array.new
      lines.each do |line|
        # remove trailing spaces to match data in map
        ocr_char << line[start_index...end_index].rstrip
      end

      # add newline at end to compensate for blank last line
      ocr_chars << ocr_char.join("\n") + "\n"
    end

    ocr_chars
  end

  attr_accessor(:ocr_text)
end
