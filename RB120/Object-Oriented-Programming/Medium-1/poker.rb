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

# Include Card and Deck classes from the last two exercises.

class PokerHand
  def initialize(deck)
    self.deck = deck
    self.hand = Array.new
    5.times { |_| hand << deck.draw }
  end

  def print
    hand.each { |card| puts card }
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  private

  attr_accessor :deck, :hand

  def same_suit?
    suits = hand.map { |card| card.suit }
    suits.uniq.size == 1
  end

  def successive?
    sorted = hand.sort
    0.upto(sorted.size - 2) do |base_index|
      current_rank = sorted[base_index].rank_value
      next_rank = sorted[base_index + 1].rank_value
      return false if next_rank != (current_rank + 1)
    end
    true
  end

  def individual_card_counts
    count_hash = Hash.new(0)
    hand.each do |card|
      count_hash[card.rank] += 1
    end
    count_hash.values
  end

  def count_occurs_times?(object_to_count, count_number)
    individual_card_counts.count(object_to_count) == count_number
  end

  def contains_ace?
    hand.any? { |card| card.rank == 'Ace' }
  end

  def royal_flush?
    contains_ace? && same_suit? && successive?
  end

  def straight_flush?
    same_suit? && successive?
  end

  def four_of_a_kind?
    count_occurs_times?(4, 1)
  end

  def full_house?
    count_occurs_times?(2, 1) && count_occurs_times?(3, 1)
  end

  def flush?
    same_suit?
  end

  def straight?
    successive?
  end

  def three_of_a_kind?
    count_occurs_times?(3, 1)
  end

  def two_pair?
    count_occurs_times?(2, 2)
  end

  def pair?
    count_occurs_times?(2, 1)
  end 
end

hand = PokerHand.new(Deck.new)
hand.print
puts hand.evaluate

# Danger danger danger: monkey
# patching for testing purposes.
class Array
  alias_method :draw, :pop
end

# Test that we can identify each PokerHand type.
hand = PokerHand.new([
  Card.new(10,      'Hearts'),
  Card.new('Ace',   'Hearts'),
  Card.new('Queen', 'Hearts'),
  Card.new('King',  'Hearts'),
  Card.new('Jack',  'Hearts')
])
puts hand.evaluate == 'Royal flush'

hand = PokerHand.new([
  Card.new(8,       'Clubs'),
  Card.new(9,       'Clubs'),
  Card.new('Queen', 'Clubs'),
  Card.new(10,      'Clubs'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight flush'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Four of a kind'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Full house'

hand = PokerHand.new([
  Card.new(10, 'Hearts'),
  Card.new('Ace', 'Hearts'),
  Card.new(2, 'Hearts'),
  Card.new('King', 'Hearts'),
  Card.new(3, 'Hearts')
])
puts hand.evaluate == 'Flush'

hand = PokerHand.new([
  Card.new(8,      'Clubs'),
  Card.new(9,      'Diamonds'),
  Card.new(10,     'Clubs'),
  Card.new(7,      'Hearts'),
  Card.new('Jack', 'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new('Queen', 'Clubs'),
  Card.new('King',  'Diamonds'),
  Card.new(10,      'Clubs'),
  Card.new('Ace',   'Hearts'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(6, 'Diamonds')
])
puts hand.evaluate == 'Three of a kind'

hand = PokerHand.new([
  Card.new(9, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(8, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Two pair'

hand = PokerHand.new([
  Card.new(2, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(9, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Pair'

hand = PokerHand.new([
  Card.new(2,      'Hearts'),
  Card.new('King', 'Clubs'),
  Card.new(5,      'Diamonds'),
  Card.new(9,      'Spades'),
  Card.new(3,      'Diamonds')
])
puts hand.evaluate == 'High card'