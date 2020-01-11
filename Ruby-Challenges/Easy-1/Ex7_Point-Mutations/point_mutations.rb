class DNA

  INVALID_DISTANCE = 0

  def initialize(reference_dna)
    self.reference_dna = reference_dna
  end

  def hamming_distance(test_dna)
    return INVALID_DISTANCE if (reference_dna.empty? or test_dna.empty?)

    shortest_dna_length = [reference_dna.length, test_dna.length].min

    reference_string = reference_dna[0, shortest_dna_length]
    test_string = test_dna[0, shortest_dna_length]

    hamming_distance_for(reference_string, test_string)
  end

  private

  def hamming_distance_for(dna_a, dna_b)
    distance = 0
    dna_a.chars.zip(dna_b.chars) do |combination|
      distance += (combination.first == combination.last) ? 0 : 1
    end
    distance
  end

  attr_accessor :reference_dna

end