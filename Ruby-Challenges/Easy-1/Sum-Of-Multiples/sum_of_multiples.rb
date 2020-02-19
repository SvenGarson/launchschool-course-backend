class SumOfMultiples
  def initialize(*base_multiples)
    self.base_multiples = base_multiples
  end

  def to(ceiling)
    self.class.to(base_multiples, ceiling)
  end

  def self.to(base_multiples = [3, 5], ceiling)
    multiples_found = (1...ceiling).to_a.select do |candidate|
      base_multiples.any? { |base_multiple| candidate % base_multiple == 0 }
    end

    multiples_found.sum
  end

  private

  attr_accessor(:base_multiples)
end
