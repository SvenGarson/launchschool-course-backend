class PhoneNumber
  AREA_CODE_LENGTH = 3
  PREFIX_LENGTH = 3
  LINE_LENGTH = 4

  VALID_NUMBER_LENGTH = AREA_CODE_LENGTH + PREFIX_LENGTH + LINE_LENGTH
  INVALID_NUMBER = '0' * VALID_NUMBER_LENGTH

  def initialize(raw_phone_number_string)
    self.raw_phone_number_string = raw_phone_number_string
  end

  def number
    if raw_number_contains_letters?
      INVALID_NUMBER
    elsif raw_number_valid_length?
      raw_number_digits
    elsif raw_number_valid_extended_length_and_format?
      raw_number_digits[1..-1]
    else
      INVALID_NUMBER
    end
  end

  def area_code
    number[0, AREA_CODE_LENGTH]
  end

  def to_s
    # pretty format (123) 456-5555
    digits = number

    formatted_number = ''

    formatted_number << "(#{area_code}) "

    formatted_number << digits[AREA_CODE_LENGTH, PREFIX_LENGTH]
    formatted_number << '-'

    formatted_number << digits[AREA_CODE_LENGTH + PREFIX_LENGTH, LINE_LENGTH]
  end

  private

  def raw_number_contains_letters?
    raw_phone_number_string.match?(/[a-z]+/i)
  end

  def raw_number_digits
    raw_phone_number_string.scan(/\d+/).join
  end

  def raw_number_total_digits
    raw_number_digits.length
  end

  def raw_number_start_with?(digit)
    raw_number_digits.start_with?(digit.to_s)
  end

  def raw_number_valid_length?
    raw_number_total_digits == VALID_NUMBER_LENGTH
  end

  def raw_number_valid_extended_length_and_format?
    valid_extended_length = raw_number_total_digits == (VALID_NUMBER_LENGTH + 1)
    valid_extended_length && raw_number_start_with?(1)
  end

  def invalid_length?
    length = raw_number_total_digits
    length < 10 || length > 11
  end

  attr_accessor(:raw_phone_number_string)
end
