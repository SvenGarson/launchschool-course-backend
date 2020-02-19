class Integer
  def multiple_of(candidate)
    (self % candidate) == 0
  end
end

class Sieve
  COMPOSITE_MARKER = -1

  def initialize(prime_ceiling)
    self.prime_candidates = (2..prime_ceiling).to_a
  end

  def primes
    total_candidates = prime_candidates.size
    candidates = prime_candidates

    candidates.each_with_index do |base_number, base_index|
      next if base_number == COMPOSITE_MARKER

      (base_index + 1).upto(total_candidates - 1) do |candidate_index|
        candidate_number = candidates[candidate_index]

        next if candidate_number == COMPOSITE_MARKER

        if candidate_number.multiple_of(base_number)
          candidates[candidate_index] = COMPOSITE_MARKER
        end
      end
    end

    candidates.reject { |candidate| candidate == COMPOSITE_MARKER }
  end

  private

  attr_accessor(:prime_candidates)
end
