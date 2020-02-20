class Phrase
  def initialize(phrase)
    self.phrase = phrase
  end

  def word_count
    words = split_phrase_words

    word_count_hash = Hash.new(0)

    words.each do |word|
      word_count_hash[word] += 1
    end

    word_count_hash
  end

  private

  def split_phrase_words
    phrase.downcase.scan(/[\w]+'*[\w]|\d/)
  end

  attr_accessor(:phrase)
end
