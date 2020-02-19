class Trinary
  BASE = 3
  MATCH_REGEX = Regexp.new("^[0-#{BASE - 1}]+$")

  def initialize(trinary_string)
    self.trinary_string = trinary_string
  end

  def to_decimal
    return 0 unless valid_trinary_string?(trinary_string)

    trinary_integers = trinary_string.chars.map(&:to_i)
    decimal_accum = 0

    trinary_integers.reverse.each_with_index do |trinary, trinary_index|
      base_multiplier = BASE**trinary_index
      decimal_accum += base_multiplier * trinary
    end

    decimal_accum
  end

  private

  def valid_trinary_string?(trinary_string)
    trinary_string.class == String && trinary_string.match?(MATCH_REGEX)
  end

  attr_accessor(:trinary_string)
end
