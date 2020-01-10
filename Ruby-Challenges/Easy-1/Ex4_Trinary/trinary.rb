class Trinary

  def initialize(trinary_string)
    @trinary_numbers = if valid_trinary_string?(trinary_string)
                         trinary_string.chars.map(&:to_i)
                    	 else
                         [0]
                       end
  end

  def to_decimal
    decimal_accum = 0
    trinary_numbers.reverse.each_with_index do |trinary, index|
      decimal_accum += trinary * (3 ** index)
    end
    decimal_accum
  end

  private

  def valid_trinary_string?(trinary_string)
    not (trinary_string =~ /[^0-2]/)
  end

  attr_reader :trinary_numbers

end