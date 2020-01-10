class Anagram
  def initialize(reference_anagram)
    self.reference_anagram = reference_anagram
  end

  def match(potential_anagrams)
    reference_lowcase = reference_anagram.downcase

    potential_anagrams.select do |potential|
      potential_lowcase = potential.downcase

      not_identical = (potential_lowcase != reference_lowcase)
      is_anagram = identical_characters?(potential_lowcase, reference_lowcase)

      not_identical && is_anagram
    end
  end

  private

  def identical_characters?(string_a, string_b)
    string_a.chars.sort == string_b.chars.sort
  end

  attr_accessor :reference_anagram
end