class Luhn
  attr_reader(:number)

  def initialize(number)
    self.number = number
  end

  def self.create(base_number)
    base_luhn = new(base_number)

    if base_luhn.valid?
      base_luhn.number
    elsif (base_luhn = new(base_number * 10)).valid?
      base_luhn.number
    else
      base_luhn = new(base_number * 10)
      to_next_luhn = 10 - base_luhn.remainder
      base_luhn.number + to_next_luhn
    end
  end

  def valid?
    remainder == 0
  end

  def remainder
    checksum % 10
  end

  def checksum
    addends.sum
  end

  def addends
    digits = number.digits

    digits.each_with_index do |digit, index|
      # double value of every second index, starting at index '1'
      next if index.even?

      product = digit * 2
      digits[index] = product > 9 ? product - 9 : product
    end

    digits.reverse
  end

  private

  attr_writer(:number)
end
