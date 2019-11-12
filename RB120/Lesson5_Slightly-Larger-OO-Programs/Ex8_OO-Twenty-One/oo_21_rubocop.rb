class Card
  
  attr_accessor :suit, :type, :value

  def initialize(suit, type, value)
    self.suit = suit
    self.type = type
    self.value = value
  end

  def to_s
    "#{type} of #{suit}"
  end
end

class Deck
  SUITS = %w(Diamonds Clubs Spades Hearts)
  CARDS = [
    %w(Ace 1), %w(Two 2), %w(Three 3), %w(Four 4), %w(Five 5),
    %w(Six 6), %w(Seven 7), %w(Eight 8), %w(Nine 9), %w(Ten 10),
    %w(Jack 10), %w(Queen 10), %w(King 10)
  ].freeze
  
  attr_accessor :cards

  def initialize
    # build deck from cards and suits
    self.cards = Array.new
    SUITS.each do |suit|
      CARDS.each do |card|
        cards << Card.new(suit, card.first, card.last.to_i)
      end
    end
  end

  def shuffle
    3.times { |_| cards.shuffle! }
  end

  def pop_card
    cards.pop
  end
end

class Participant

  attr_accessor :cards, :busted, :hand_value

  def initialize
    self.cards = Array.new
    self.busted = false
    self.hand_value = 0
  end

  def hit(dealer)
    dealer.deal(self)
  end

  def take_card(card)
    cards << card
  end

  def print_cards(show_all: true)
    cards.each_with_index do |card, index|
      c_index = index + 1
      if show_all
        puts "#{c_index}) " + card.to_s
      else
        if c_index > 1
          puts "#{c_index}) " + "################"
        else
          puts "#{c_index}) " + card.to_s
        end
      end
    end
  end
end

class Dealer < Participant
  
  attr_accessor :deck
  
  def initialize
    super()
    self.deck = Deck.new
    deck.shuffle
  end

  def deal(receiver, card_count=1)
    card_count.times { |_| receiver.take_card(deck.pop_card) }
  end
end

class Player < Participant


end

class Game21

  attr_accessor :player, :dealer, :game_over, :winner

  def initialize
    self.player = Player.new
    self.dealer = Dealer.new
    self.game_over = false
    self.winner = nil
  end

  def start
    display_welcome
    display_rules
    
    deal_initial_cards
    show_cards

    
    player.turn
    # player busted?

    dealer.turn
    # dealer busted?

    #determine_winner

    #display_winner
    
    display_goodbye
  end

  def game_over?
    false
  end

  def deal_initial_cards
    dealer.deal(player, 2)
    dealer.deal(dealer, 2)
  end

  def clear
    Utils.clear
  end

  def show_cards
    # first of the dealers cards
    puts "Dealer cards"
    puts "------------"
    dealer.print_cards(show_all: false)
    # both of the player cards
    puts "\nPlayer cards"
    puts "------------"
    player.print_cards
  end

  def display_goodbye
    clear

    puts "\nThank you for playing 21!\n\n"
  end

  def display_rules
    clear
    puts "Rules"
    puts "-----"
    puts "21 is about getting to a hand value as close to 21 as possible."
    puts "You play against the dealer. Each player can either hit/draw a"
    puts "card or stay, at which point the turn is over."
    puts "The player who's hand is worth > 21 is bust, and looses the game!"
    puts "\nIn case nobody is bust, the player with the highest hand value wins."
    puts "\nHand values"
    puts "-------------"
    puts "Cards 2 through 10 are worth their face value in points."
    puts "Cards King(K), Queen(Q) and Jack(J) are worth 10 points."
    puts "Aces are worth either 1 or 11, whichever brings you closest to 21."
    
    print "\n(Press enter to continue)"
    Utils.wait_for_any_input
  end

  def display_welcome
    clear
    puts "\nWelcome to 21!"

    print "\n(Press enter to continue)"
    Utils.wait_for_any_input
  end
end

class Utils
  def self.clear
    system('clear') || system('cls')
  end

  def self.wait_for_any_input
    loop do
      input = gets.chomp
      break
    end
  end
end

# start the game
Game21.new.start
