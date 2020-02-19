class DNA
  def initialize(base_dna_string)
    self.base_dna_string = base_dna_string
  end

  def hamming_distance(other_dna_string)
    return 0 if any_dna_string_empty?(other_dna_string)

    normalized_dna = normalized_dna_strings(other_dna_string)
    normalized_base_dna = normalized_dna.first
    normalized_other_dna = normalized_dna.last

    per_char_difference_count(normalized_base_dna, normalized_other_dna)
  end

  private

  def per_char_difference_count(a, b)
    # assumes normalized strings
    differences = 0

    (0...a.length).each do |index|
      differences += 1 if a[index] != b[index]
    end

    differences
  end

  def normalized_dna_strings(other_dna_string)
    if dna_strings_same_length?(other_dna_string)
      [base_dna_string, other_dna_string]
    else
      shortest_length = [base_dna_string, other_dna_string].map(&:length).min

      [
        chop_string_to_length(base_dna_string, shortest_length),
        chop_string_to_length(other_dna_string, shortest_length)
      ]
    end
  end

  def chop_string_to_length(string, desired_length)
    if string.length > desired_length
      string[0, desired_length]
    else
      string
    end
  end

  def any_dna_string_empty?(other_dna_string)
    base_dna_string.empty? || other_dna_string.empty?
  end

  def dna_strings_same_length?(other_dna_string)
    base_dna_string.length == other_dna_string.length
  end

  attr_accessor(:base_dna_string)
end
