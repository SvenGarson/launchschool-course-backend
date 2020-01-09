=begin

inp:
  - octal number string

out:
  - decimal as integer conversion from input

req:
  - convert myself, do not use conversion methods
  - treat string as value (octal 0) if invalid,
    i.e any string that contains non-digit characters?

== EXPLORE ==

  inp: octal number as string
  out: decimal from ino converted to base 10

  - octal strings that contain chars are invalid

== ALGO ==

  - override argument to 0 if arg string contains a non-digit
  - octal_numbers = octal string to int array
  - invert octal numbers array
  - acdecimal_accum = 0
  - for every number at index:
    - acdecimal_accum += number * 8^index
  - return acdecimal_accum

=end

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