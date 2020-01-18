class PhoneNumber

  VALID_PHONE_NUMBER_LENGTH = 10
  EXTENDED_PHONE_NUMBER_LENGTH = 11
  EXTENDED_PHONE_NUMBER_PREFIX = '1'

  def initialize(number_string)
    self.validated_number_string = validate_number(number_string)
  end

  def number
    validated_number_string
  end

  def area_code
    validated_number_string[0, 3]
  end

  def to_s
    middle_number_string = validated_number_string[3, 3]
    end_number_string = validated_number_string[6, 4]
    "(#{area_code}) " + middle_number_string + "-" + end_number_string
  end

  private

  def validate_number(number_string)
    digit_string = number_string.gsub(/\D/, '')
    letter_string = number_string.gsub(/[^a-z]/i, '')
  
    digit_count = digit_string.length
    letter_count = letter_string.length

    if digit_count == VALID_PHONE_NUMBER_LENGTH && letter_string.empty?
      digit_string
    elsif digit_count == EXTENDED_PHONE_NUMBER_LENGTH && digit_string[0] == EXTENDED_PHONE_NUMBER_PREFIX
      digit_string[1..-1]
    else
      '0' * VALID_PHONE_NUMBER_LENGTH
    end
  end

  attr_accessor(:validated_number_string)

end