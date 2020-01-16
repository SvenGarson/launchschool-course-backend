class PigLatin

  VOWELS_W_EXCEPTIONS_PATTERN = /\A(yt|xr|[iueoa])+/i
  CONSONANTS_W_EXCEPTIONS_PATTERN = /\A(qu|[^iueoa])+/i

  def self.translate(english)
    english_words = english.split(' ')
    english_words.map! do |word|
      english_to_pig_latin(word)
    end
    english_words.join(' ')
  end

  private

  def self.english_to_pig_latin(english)
    if starts_with_vowels(english)
      english + 'ay'
    else
      consonants = starts_with_consonants(english)
      consonant_count = consonants.length
      english[consonant_count..-1] + consonants + 'ay'
    end
  end

  def self.starts_with_vowels(string)
    string[VOWELS_W_EXCEPTIONS_PATTERN]
  end

  def self.starts_with_consonants(string)
    string[CONSONANTS_W_EXCEPTIONS_PATTERN]
  end

end

PigLatin.translate('')