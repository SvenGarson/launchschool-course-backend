class Card
  include Comparable

  FACE_CARD_RANK_MAP = {
    'Jack' => 11,
    'Queen' => 12,
    'King' => 13,
    'Ace' => 14
  }

  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def <=>(other_card)
    rank_value <=> other_card.rank_value
  end

  def to_s
    "#{rank} of #{suit}"
  end

  protected

  def rank_value
    if FACE_CARD_RANK_MAP.include?(rank)
      FACE_CARD_RANK_MAP[rank]
    else
      rank
    end
  end
end

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    @cards = Array.new
  end

  def draw
    reset if @cards.empty?
    @cards.pop
  end

  private

  def reset
    SUITS.each do |suit|
      RANKS.each do |rank|
        @cards << Card.new(rank, suit)
      end
    end
    @cards.shuffle!
  end
  
end

deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
p drawn.count { |card| card.rank == 5 } == 4
p drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
p drawn != drawn2 # Almost always.