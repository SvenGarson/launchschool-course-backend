class Prime

  extend Math

  def self.nth(prime_index)
    raise ArgumentError if prime_index <= 0

    prime_count = 0
    candidate = 2

    loop do
      prime_count += 1 if prime?(candidate)

      break if prime_count == prime_index      

      candidate += 1
    end

    candidate
  end

  private

  def self.prime?(candidate)
    max_factor = sqrt(candidate).to_i
    factor = 2
    
    while factor <= max_factor
      return false if (candidate % factor) == 0
      factor += 1
    end

    true
  end

end