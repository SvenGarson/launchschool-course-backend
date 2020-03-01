class Palindrome
  attr_reader(:value, :factors)

  def initialize(value, factors)
    self.value = value
    self.factors = factors
  end

  private

  attr_writer(:value, :factors)
end

class Palindromes
  def initialize(min_factor: 1, max_factor:)
    self.factors_range = (min_factor..max_factor)
    self.palindromes = nil
  end

  def generate
    self.palindromes = all_palindromes.sort_by(&:value)
  end

  def smallest
    palindromes.first
  end

  def largest
    palindromes.last
  end

  private

  def number_palindromic?(number)
    num_string = number.to_s
    num_string == num_string.reverse
  end

  def each_palindromic_combination
    factors_range.each do |factor_a|
      factors_range.each do |factor_b|
        product = factor_a * factor_b

        next unless number_palindromic?(product)

        yield(factor_a, factor_b, product)
      end
    end
  end

  def all_palindromes
    combinations_hash = Hash.new

    # relate factors to the corresponding product
    each_palindromic_combination do |factor_a, factor_b, product|
      unless combinations_hash.key?(product)
        combinations_hash[product] = Array.new
      end

      combinations_hash[product] << [factor_a, factor_b].sort
    end

    # create list of palindromes
    combinations_hash.to_a.map do |product, factors|
      Palindrome.new(product, factors.uniq)
    end
  end

  attr_accessor(:factors_range, :palindromes)
end
