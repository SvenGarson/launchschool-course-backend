class Integer
  ROMAN_NUMERAL_VALUES = [
    1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1
  ].freeze
  ROMAN_NUMERAL_STRINGS = %w(M CM D CD C XC L XL X IX V IV I).freeze

  def to_roman
    if self < 0
      raise ArgumentError, 'Cannot create roman numeral from negative numbers!'
    end

    number = self
    roman_string = ''

    until number == 0
      max_value_index = ROMAN_NUMERAL_VALUES.index { |value| value <= number }

      largest_value = ROMAN_NUMERAL_VALUES[max_value_index]
      roman_literal = ROMAN_NUMERAL_STRINGS[max_value_index]

      occurences, remainder = number.divmod(largest_value)
      roman_string << (roman_literal * occurences)

      number = remainder
    end

    roman_string
  end
end
