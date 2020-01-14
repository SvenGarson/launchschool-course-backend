class Scrabble

  def initialize(scrabble_string)
    @scrabble_string = scrabble_string.nil? ? '' : scrabble_string
    @score_map = Hash.new(0)

    add_letter_scores(%w(A E I O U L N R S T), 1)
    add_letter_scores(%w(D G), 2)
    add_letter_scores(%w(B C M P), 3)
    add_letter_scores(%w(F H V W Y), 4)
    add_letter_scores(%w(K), 5)
    add_letter_scores(%w(J X), 8)
    add_letter_scores(%w(Q Z), 10)
  end

  def self.score(scrabble_string)
    Scrabble.new(scrabble_string).score
  end

  def score
    scrabble_string.chars.reduce(0) do |score, char|
      score + score_map[char]
    end
  end

  private

  def add_letter_scores(letters, score)
    letters.each do |letter|
      score_map[letter.downcase] = score
      score_map[letter.upcase] = score    
    end
  end

  attr_reader :scrabble_string, :score_map

end