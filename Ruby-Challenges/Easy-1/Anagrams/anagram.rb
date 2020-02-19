class Anagram
  def initialize(base_anagram)
    self.base_anagram = base_anagram
    self.base_chars_lowcase_sorted = base_anagram.downcase.chars.sort
  end

  def match(anagram_candidates)
    anagram_candidates.select do |anagram_candidate|
      base_anagram?(anagram_candidate)
    end
  end

  private

  def base_anagram?(candidate_anagram)
    candidate_chars_lowcase_sorted = candidate_anagram.downcase.chars.sort

    is_different_string = base_anagram.casecmp(candidate_anagram) != 0
    is_anagram = (base_chars_lowcase_sorted == candidate_chars_lowcase_sorted)

    is_different_string && is_anagram
  end

  attr_accessor(:base_anagram, :base_chars_lowcase_sorted)
end
