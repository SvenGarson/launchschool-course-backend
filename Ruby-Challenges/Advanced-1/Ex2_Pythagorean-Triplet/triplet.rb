class Triplet
  def initialize(a, b, c)
    sorted = [a, b, c].sort
    self.a = sorted.first
    self.b = sorted[1]
    self.c = sorted.last
  end

  def sum
    a + b + c
  end

  def product
    a * b * c
  end
  
  def pythagorean?
    (a**2 + b**2) == c**2
  end

  def self.where(min_factor: 1, max_factor: 1, sum: nil)
    triplet = nil
    pyth_triplets = Array.new

    min_factor.upto(max_factor) do |a|
      min_factor.upto(max_factor) do |b|
        min_factor.upto(max_factor) do |c|
        
          triplet = Triplet.new(a, b, c)

          # skip if sum does not match required sum
          if sum
            next unless triplet.sum == sum
          end

          if triplet.pythagorean? && !pyth_triplets.include?(triplet)
            pyth_triplets << triplet
          end
          
        end
      end
    end

    pyth_triplets
  end

  def ==(other_triplet)
    to_a == other_triplet.to_a
  end

  def to_s
    format("{%3d, %3d, %3d}", a, b, c)
  end

  protected

  def to_a
    [a, b, c]
  end

  attr_reader(:a, :b, :c)

  private

  attr_writer(:a, :b, :c)
end