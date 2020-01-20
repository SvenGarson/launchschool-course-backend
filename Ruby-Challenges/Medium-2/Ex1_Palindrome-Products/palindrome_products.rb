class Palindrome
  attr_reader(:value, :factors)
  
  def initialize(value, factors)
    @value = value
    @factors = factors
  end
end

class Palindromes

  def initialize(min_factor: 1, max_factor: )
    self.palindrome_range = (min_factor..max_factor)
    self.palindrome_map = Hash.new
  end

  def generate
    all_factor_combinations.each do |factors|
      product = factors.first * factors.last
   
      associate_factors_to_product(factors, product) if palindrome?(product)
    end

    remove_duplicate_factors
  end

  def largest
    largest_product = palindrome_map.keys.max
    Palindrome.new(largest_product, palindrome_map[largest_product])
  end

  def smallest
    smallest_product = palindrome_map.keys.min
    Palindrome.new(smallest_product, palindrome_map[smallest_product])
  end

  private

  def associate_factors_to_product(factors, product)
    palindrome_map[product] = Array.new unless palindrome_map.has_key?(product)
    palindrome_map[product] << factors
  end

  def remove_duplicate_factors
    palindrome_map.each do |_, factor_combinations|
      factor_combinations.uniq! { |factors_combo| factors_combo.sort }
    end
  end

  def palindrome?(number)
    number_string = number.to_s
    (number_string == number_string.reverse)
  end

  def all_factor_combinations
    range_array = palindrome_range.to_a
    range_array.product(range_array)
  end

  attr_accessor(:palindrome_range, :palindrome_map)

end