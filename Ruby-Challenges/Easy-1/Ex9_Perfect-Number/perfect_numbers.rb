class PerfectNumber
  CLASS_PERFECT = 'perfect'
  CLASS_DEFICIENT = 'deficient'
  CLASS_ABUNDANT = 'abundant'

  def self.classify(number)
    raise RuntimeError if number <= 0

    divisors = all_positive_divisors(number)
    divisor_sum = divisors.sum

    # divisor sum equals 1 when number is prime
    if divisor_sum < number
      CLASS_DEFICIENT
    elsif divisor_sum == number
      CLASS_PERFECT
    else
      CLASS_ABUNDANT
    end
  end

  private

  def self.all_positive_divisors(number)
    (1..(number/2)).select { |candidate| number % candidate == 0 }
  end

end