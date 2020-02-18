class Sieve
  COMPOSIT_MARKER = -1

  def initialize(prime_ceiling)
    self.prime_candidates = (2..prime_ceiling).to_a
  end

  def primes

  # 2 3 X 5 X 7 X X X
  #               ^

   # for every number in the list until next to last
    # skip X
    # reject numbers that are different numbers and multiples of that number
    prime_candidates.each do 
  end

  private

  attr_accessor(:prime_candidates)
end
