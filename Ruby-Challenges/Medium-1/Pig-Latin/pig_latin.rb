class PigLatin
  def self.translate(english_words)
    words = english_words.split
    words.map! do |word|
      if vowel_word?(word)
        word + 'ay'
      else
        consonant_prefix = consonant_prefix(word)
        word[consonant_prefix.length..-1] + consonant_prefix + 'ay'
      end
    end

    words.join(' ')
  end

  def self.vowel_word?(word)
    word.match?(/^([IUEOA]|yt|xr)/i)
  end

  def self.consonant_prefix(word)
    word[/\A(qu|[^iueoa])*/i]
  end
end
