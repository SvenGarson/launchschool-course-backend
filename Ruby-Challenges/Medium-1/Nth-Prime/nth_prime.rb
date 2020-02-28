class Prime
  def self.nth(n)
    raise ArgumentError, "Nth must be larger than 0." unless n > 0

    count = 0
    prime_candidates do |prime_candidate|
      # skip non-primes
      next unless prime?(prime_candidate)

      count += 1
      return prime_candidate if count == n
    end
  end

  def self.prime?(number)
    return false if number < 2

    (2..(number / 2)).each do |candidate_divisor|
      return false if (number % candidate_divisor) == 0
    end

    true
  end

  def self.prime_candidates
    to_next_candidate = 1
    current_candidate = 2

    loop do
      yield(current_candidate)

      current_candidate += to_next_candidate
      to_next_candidate = 2
    end
  end
end
