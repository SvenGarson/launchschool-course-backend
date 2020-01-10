class Octal

  def initialize(octal_string)
    @octal_numbers = if valid_octal_string?(octal_string)
                      octal_string.chars.map(&:to_i)
                    else
                      [0]
                    end
  end

  def to_decimal
    decimal_accum = 0
    octal_numbers.reverse.each_with_index do |octal, index|
      decimal_accum += octal * (8 ** index)
    end
    decimal_accum
  end

  private

  def valid_octal_string?(octal_string)
    not (octal_string =~ /[^0-7]/)
  end

  attr_reader :octal_numbers

end