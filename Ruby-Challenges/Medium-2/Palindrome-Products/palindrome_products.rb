class Palindrome
  def initialize(product, factors)
    self.product = product
    self.factors = factors
  end

  private

  attr_accessor(:product, :factors)
end

class Palindromes

end

p Palindrome.new(15, [3, 5])