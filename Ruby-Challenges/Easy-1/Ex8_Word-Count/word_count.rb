class Phrase

  PHRASE_PATTERN = /\b[\w\d']+\b/

  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    extracted_word_lowercase = phrase.scan(PHRASE_PATTERN).map(&:downcase)
    count_map = Hash.new

    extracted_word_lowercase.each do |word|
      next if count_map.has_key?(word)
     
      count_map[word] = extracted_word_lowercase.count(word)
    end

    count_map
  end

  private 

  attr_accessor :phrase

end