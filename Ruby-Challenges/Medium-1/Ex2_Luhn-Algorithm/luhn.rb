class Luhn

  def initialize(candidate)
    @candidate = candidate
  end

  def addends
    candidate.digits.each_with_index.map do |number, index|
      if index.even?
        number
      else
        result = number * 2
        result >= 10 ? (result - 9) : result
      end
    end.reverse
  end

  def checksum
    addends.sum
  end

  def valid?
    checksum % 10 == 0
  end

  def self.create(candidate)
    luhn = Luhn.new(candidate * 10)
    if luhn.valid?
      luhn.candidate
    else
      luhn.candidate + (luhn.checksum * 9) % 10
    end
  end

  attr_reader :candidate

end