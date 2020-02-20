class Scrabble
  LETTER_SCORE_MAP = {
    %w(A E I O U L N R S T) =>  1,
    %w(D G)                 =>  2,
    %w(B C M P)             =>  3,
    %w(F H V W Y)           =>  4,
    %w(K)                   =>  5,
    %w(J X)                 =>  8,
    %w(Q Z)                 => 10
  }.freeze

  VALID_UPPERCASE_CHARACTERS = LETTER_SCORE_MAP.keys.flatten.join.freeze
  REGEX_VALID_CHARACTERS = Regexp.new("[#{VALID_UPPERCASE_CHARACTERS}]")

  def initialize(scrabble_string)
    self.sanitized_scrabble_string = sanitize(scrabble_string)
  end

  def score
    sanitized_scrabble_string.chars.reduce(0) do |score, scrabble_character|
      score + score_for_character(scrabble_character)
    end
  end

  def self.score(scrabble_string)
    new(scrabble_string).score
  end

  private

  def score_for_character(character)
    scoring = LETTER_SCORE_MAP.find { |letters, _| letters.include?(character) }
    scoring.last
  end

  def sanitize(scrabble_string)
    if scrabble_string.nil?
      ''
    else
      scrabble_string.upcase.scan(REGEX_VALID_CHARACTERS).join
    end
  end

  attr_accessor(:sanitized_scrabble_string)
end
