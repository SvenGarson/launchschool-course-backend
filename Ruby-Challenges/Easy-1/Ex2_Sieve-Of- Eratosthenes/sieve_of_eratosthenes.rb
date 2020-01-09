class Sieve

  def initialize(ceiling)
    @ceiling = ceiling
  end

  def primes
    potential_primes = (2..ceiling).to_a

    potential_primes.each_with_index do |current, i_current|
        next if current == -1

        (i_current + 1).upto(potential_primes.size - 1) do |i_potential|

          potential = potential_primes[i_potential]
          potential_primes[i_potential] = -1 if potential % current == 0

        end
    end
    
    potential_primes.select { |potential| potential != -1 }

  end

  private

  attr_reader :ceiling

end