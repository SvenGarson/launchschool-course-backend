class PerfectNumber
  def self.classify(number)
    raise 'Perfect number cannot be negative!' if number < 0

    factor_sum = factor_sum(number)

    if factor_sum < number
      'deficient'
    elsif factor_sum > number
      'abundant'
    else
      'perfect'
    end
  end

  def self.factor_sum(number)
    factors(number).sum
  end

  def self.factors(number)
    (1..(number / 2)).select do |candidate_factor|
      (number % candidate_factor) == 0
    end
  end

  private_class_method(:factor_sum, :factors)
end
