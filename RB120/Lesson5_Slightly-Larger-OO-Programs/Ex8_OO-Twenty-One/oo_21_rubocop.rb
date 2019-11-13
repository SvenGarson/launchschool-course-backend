class GameConst
  WINNING_HAND_VALUE = 21
  DEALER_MIN_HAND_VALUE = 17
end

class Card
  
  attr_accessor :suit, :type, :value

  def initialize(suit, type, value)
    self.suit = suit
    self.type = type
    self.value = value
  end

  def ascii_art_lines(show_face: true)

    # determine what string to use for card type
    face_card_names = %w(Ace King Queen Jack)
    show_type_str = case face_card_names.include?(type)
                  when true
                    expand_str(type.chr, 2)
                  else
                    expand_str(value.to_s, 2)
                  end

    ascii_strarr = [
      ' _____ ',
      "|#   |".sub('#', show_type_str),
      '|     |',
      '|     |',
      '|____#|'.sub('#', suit.chr)
    ]

    unless show_face
      ascii_strarr.map! do |ascii_line|
        ascii_line.gsub(/[^_ |]/, '#')
      end
    end

    ascii_strarr
  end

  def to_s
    "#{type} of #{suit}"
  end

  def expand_str(str, desired_length)
    if str.length < desired_length
      str.ljust(desired_length)
    else
      str
    end
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
    self
  end

  def pop_card
    cards.pop
  end
end

class Participant
  include Comparable

  CHOICE_STAY = :stay
  CHOICE_HIT = :hit

  attr_accessor :cards, :busted, :hand_value

  def initialize
    self.cards = Array.new
    self.busted = false
    self.hand_value = 0
  end

  def choose_until_stay_or_bust(game, dealer)
    loop do
      choice = choose_stay_or_hit

      # participant is done when stays
      break if choice == CHOICE_STAY

      if choice == CHOICE_HIT
        dealer.deal(self)
        self.busted = true if hand_value > GameConst::WINNING_HAND_VALUE
      end

      game.show_cards

      # participant is done when bust
      break if bust?
    end
  end

  # to be overriden by dealer and player
  def choose_stay_or_hit; end

  def compute_hand_value
    ace_count = cards.select { |card| card.type == 'Ace' }.size
    non_aces = cards.reject { |card| card.type == 'Ace' }
    base_score = non_aces.reduce(0) { |accum, card| accum + card.value }
    ace_rest = GameConst::WINNING_HAND_VALUE - base_score
    final_score = base_score
    ace_count.downto(0) do |full_aces|
      test_score = (full_aces * 11) + (ace_count - full_aces)
      final_score = base_score + test_score
      break if final_score <= GameConst::WINNING_HAND_VALUE
    end
    self.hand_value = final_score
  end

  def take_card(card)
    cards << card
    compute_hand_value
  end
  
  def bust?
    busted
  end

  def <=>(other)
    hand_value <=> other.hand_value
  end

  def print_cards(show_all: true, padding: 2)
    return if cards.empty?
    
    show_card_faces = :true
    cards_ascii_lines = cards.map do |card|
      lines = card.ascii_art_lines(show_face: show_card_faces)
      show_card_faces = false unless show_all
      lines
    end

    # to print cards horizontally we need to print cards row by row
    rows_to_print = cards_ascii_lines.first.length
      rows_to_print.times do |row_index|
        cards_ascii_lines.each do |ascii_line|
        print "#{ascii_line[row_index]}" + (' ' * padding)
      end
      print "\n"
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

  def choose_until_stay_or_bust(game, dealer=self)
    super
  end

  def choose_stay_or_hit
    Utils.prompt_dotted_wait("\nDealer is thinking ", 3)

    # hit until hand value at least 17
    if hand_value < GameConst::DEALER_MIN_HAND_VALUE
      CHOICE_HIT
    else
      CHOICE_STAY
    end
  end

  def deal(receiver, card_count=1)
    card_count.times { |_| receiver.take_card(deck.pop_card) }
  end
end

class Player < Participant

  def choose_stay_or_hit
    # prompt for choice
    valid_choice_str = Utils.prompt_choice_hit_or_stay
    
    # return choice as option
    valid_choice_str.start_with?('h') ? CHOICE_HIT : CHOICE_STAY
  end
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
   
    player.choose_until_stay_or_bust(self, dealer)

    unless player.bust?
      dealer.choose_until_stay_or_bust(self)
    end

    show_cards(reveal_dealer: true)

    determine_winner
    display_winner
    
    display_goodbye
  end

  def display_winner
    winner_msg = if winner == player
                   "\nPlayer wins the game!"
                 elsif winner == dealer
                   "\nDealer wins the game!"
                 else
                   "\nIt's a tie!"
                 end
    
    puts winner_msg

    print "\n(Press enter to stop the game)"
    Utils.wait_for_any_input
  end

  def determine_winner
    # winner set to nil in case of tie
    self.winner = if player.bust?
                    dealer
                  elsif dealer.bust?
                    player
                  elsif player < dealer
                    dealer
                  elsif dealer < player
                    player
                  end
  end

  def deal_initial_cards
    dealer.deal(player, 2)
    dealer.deal(dealer, 2)
  end

  def show_cards(reveal_dealer: false)
    Utils.clear

    # first of the dealer cards
    puts "\n+--------------+"
    puts "| Dealer cards | #{dealer.hand_value}"
    puts "+--------------+"
    dealer.print_cards(show_all: reveal_dealer)

    # all the player cards
    puts "\n+--------------+"
    puts "| Player cards | #{player.hand_value}"
    puts "+--------------+"
    player.print_cards
  end

  def display_goodbye
    puts "\nWe hope you enjoyed our take on 21 !\n\n"
  end

  def display_rules
    Utils.clear
    puts "Rules"
    puts "-----"
    puts "21 is about getting to a hand value as close to 21 as possible."
    puts "You play against the dealer. Each player can either hit/draw a"
    puts "card or stay, at which point the turn is over."
    puts "The player who's hand is worth > 21 is bust, and looses the game!"
    puts "\nIn case nobody is bust, the player with the highest hand value wins."
    puts "\nHand values"
    puts "-------------"
    puts "\nCards 2 through 10 are worth their face value in points."
    puts "Cards King(K), Queen(Q) and Jack(J) are worth 10 points."
    puts "Aces are worth either 1 or 11, whichever brings you closest to 21.\n"

    example_ascii_lines = Deck.new.shuffle.pop_card.ascii_art_lines
    example_ascii_lines.each_with_index do |card_line, index|
      rindex = index + 1

      print card_line
      if rindex == 2
        print ' --> Card type (Ace, Jack, Ten(10), Two(2), ...)'
      elsif rindex == 5
        print ' --> Card suit (Diamonds, Hearts, Spades, ...)'
      end
      print "\n"
    end
    
    print "\n\n(Press enter to continue)"
    Utils.wait_for_any_input
  end

  def display_welcome
    Utils.clear
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

  def self.prompt_dotted_wait(prompt_msg, wait_time_sec)
    print prompt_msg
    frac_wait_time = wait_time_sec.fdiv(3.0)
    3.times do |_|
      print '.'
      sleep frac_wait_time
    end
  end

  def self.prompt_choice_hit_or_stay
    loop do
      print "\nHit or stay? "
      choice = gets.chomp
      choice.downcase!
      break(choice) if %w(hit stay h s).include?(choice)
      print "\nChoose either hit(h) or stay(s)."
    end
  end
end

# start the game
Game21.new.start
