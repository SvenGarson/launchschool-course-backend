class Octal
  BASE = 8
  MATCH_OCTAL_REGEX = Regexp.new("^[0-#{BASE - 1}]+$")

  def initialize(octal_string)
    self.octal_string = octal_string
  end

  def to_decimal
    return 0 unless valid_octal_string?(octal_string)

    octal_integers = octal_string.chars.map(&:to_i)
    decimal_accum = 0

    octal_integers.reverse.each_with_index do |octal, octal_index|
      base_multiplier = BASE**octal_index
      decimal_accum += base_multiplier * octal
    end

    decimal_accum
  end

  private

  def valid_octal_string?(octal_string)
    octal_string.class == String && octal_string.match?(MATCH_OCTAL_REGEX)
  end

  attr_accessor(:octal_string)
end
