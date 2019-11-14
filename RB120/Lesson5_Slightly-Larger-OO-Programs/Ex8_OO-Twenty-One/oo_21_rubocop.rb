class Card
  FACE_CARD_NAMES = %w(Ace King Queen Jack)
  attr_reader :suit, :type, :value

  def initialize(suit, type, value)
    self.suit = suit
    self.type = type
    self.value = value
  end

  def ascii_art_lines(show_face: true)
    ascii_strarr = [
      ' _____ ',
      "|#   |".sub('#', design_card_type_abbrev),
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

  private

  attr_writer :suit, :type, :value

  def design_card_type_abbrev
    # if the string is a number from 2-10
    # take the 2 and expand
    case FACE_CARD_NAMES.include?(type)
    when true
      expand_str(type.chr, 2)
    else
      expand_str(value.to_s, 2)
    end
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
  SUITS = %w(Diamonds Clubs Spades Hearts).freeze
  CARDS = [
    %w(Ace 1), %w(Two 2), %w(Three 3), %w(Four 4), %w(Five 5),
    %w(Six 6), %w(Seven 7), %w(Eight 8), %w(Nine 9), %w(Ten 10),
    %w(Jack 10), %w(Queen 10), %w(King 10)
  ].freeze

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
    # shuffle between 4 and 29 times inclusively
    # there is no inherent logic to this range
    rand(4..29).times { |_| cards.shuffle! }
    self
  end

  def pop_card
    cards.pop
  end

  private

  attr_accessor :cards
end

class Participant
  include Comparable

  DEALER_MIN_HAND_VALUE = 17
  WINNING_HAND_VALUE = 21
  CHOICE_STAY = :stay
  CHOICE_HIT = :hit

  attr_reader :hand_value

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
        self.busted = true if hand_value > WINNING_HAND_VALUE
      end

      game.show_cards(reveal_dealer: game.reveal_dealer?)

      # participant is done when bust
      break if bust?
    end
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
        print ascii_line[row_index] + (' ' * padding)
      end
      print "\n"
    end
  end

  protected

  def take_card(card)
    cards << card
    compute_hand_value
  end

  private

  attr_writer :hand_value
  attr_accessor :cards, :busted

  def number_of_aces
    cards.select { |card| card.type == 'Ace' }.size
  end

  def hand_value_without_aces
    non_ace_cards = cards.reject { |card| card.type == 'Ace' }
    non_ace_cards.reduce(0) { |accum, card| accum + card.value }
  end

  def compute_hand_value
    aces = number_of_aces
    base_hand_value = hand_value_without_aces
    final_hand_value = base_hand_value

    aces.downto(0) do |max_score_aces|
      min_score_aces = aces - max_score_aces
      aces_value = (max_score_aces * 11) + min_score_aces
      final_hand_value = base_hand_value + aces_value
      break if final_hand_value <= WINNING_HAND_VALUE
    end
    self.hand_value = final_hand_value
  end
end

class Dealer < Participant
  def initialize
    super()
    self.deck = Deck.new
    deck.shuffle
  end

  def choose_until_stay_or_bust(game, dealer=self)
    super
  end

  def deal(receiver, card_count=1)
    card_count.times { |_| receiver.take_card(deck.pop_card) }
  end

  protected

  def choose_stay_or_hit
    prompt_dotted_wait("\nDealer is thinking ", 3)

    # hit until hand value at least 17
    if hand_value < DEALER_MIN_HAND_VALUE
      CHOICE_HIT
    else
      CHOICE_STAY
    end
  end

  private

  def prompt_dotted_wait(prompt_msg, wait_time_sec)
    print prompt_msg
    frac_wait_time = wait_time_sec.fdiv(3.0)
    3.times do |_|
      print '.'
      sleep frac_wait_time
    end
  end

  attr_accessor :deck
end

class Player < Participant
  def choose_stay_or_hit
    valid_choice_str = prompt_choice_hit_or_stay

    valid_choice_str.start_with?('h') ? CHOICE_HIT : CHOICE_STAY
  end

  private

  def prompt_choice_hit_or_stay
    loop do
      print "\nHit or stay? "
      choice = gets.chomp
      choice.downcase!
      break(choice) if %w(hit stay h s).include?(choice)
      print "\nChoose either hit(h) or stay(s)."
    end
  end
end

class Game21
  RULES_TEXT = \
    "  Rules" \
    "\n  -----" \
    "\n\n21 is about getting to a hand value as close to 21 as possible." \
    "\nYou play against the dealer. Each player can either hit/draw a" \
    "\ncard or stay, at which point the turn is over." \
    "\nThe player who's hand is worth > 21 is bust, and looses the game!" \
    "\nIn case nobody is bust, the player with the highest hand value wins." \
    "\n\n  Hand values" \
    "\n  -------------" \
    "\n\nCards 2 through 10 are worth their face value in points." \
    "\nCards King(K), Queen(Q) and Jack(J) are worth 10 points." \
    "\nAces are worth either 1 or 11, whichever brings you closest to 21.\n\n"

  def initialize
    self.player = Player.new
    self.dealer = Dealer.new
    self.game_over = false
    self.winner = nil
    self.reveal_dealer = false
  end

  def start
    display_welcome
    display_rules

    deal_initial_cards
    show_cards

    player.choose_until_stay_or_bust(self, dealer)

    reveal_the_dealer

    unless player.bust?
      dealer.choose_until_stay_or_bust(self)
    end

    show_cards(reveal_dealer: true)

    determine_winner
    display_winner

    display_goodbye
  end

  def reveal_dealer?
    reveal_dealer
  end

  def show_cards(reveal_dealer: false)
    clear

    # determine which score to show
    player_value_str = player.hand_value.to_s.ljust(2)
    dealer_value_str = reveal_dealer ? dealer.hand_value.to_s : "##"

    puts "\n+-------------------+" \
         "\n| Dealer cards (#{dealer_value_str}) | " \
         "\n+-------------------+"
    dealer.print_cards(show_all: reveal_dealer)

    puts "\n+-----------------+" \
         "\n| Your cards (#{player_value_str}) |" \
         "\n+-----------------+"
    player.print_cards
  end

  private

  attr_accessor :player, :dealer, :game_over, :winner, :reveal_dealer

  def display_welcome
    clear
    puts "\nWelcome to 21!"

    print "\n(Press enter to continue)"
    wait_for_any_input
  end

  def display_rules
    clear

    print RULES_TEXT

    example_ascii_lines = Deck.new.shuffle.pop_card.ascii_art_lines
    example_ascii_lines.each_with_index do |card_line, index|
      rindex = index + 1

      print "  #{card_line}"
      if rindex == 2
        print ' --> Card type (Ace, Jack, Ten(10), Two(2), ...)'
      elsif rindex == 5
        print ' --> Card suit (Diamonds, Hearts, Spades, Clubs)'
      end
      print "\n"
    end

    print "\n\n(Press enter to continue)"
    wait_for_any_input
  end

  def display_winner
    winner_msg = if winner == player
                   "\nYou win the game!"
                 elsif winner == dealer
                   "\nDealer wins the game!"
                 else
                   "\nIt's a tie!"
                 end

    puts winner_msg
    sleep 2
  end

  def display_goodbye
    puts "\nWe hope you enjoyed our take on 21 !\n\n"
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

  def reveal_the_dealer
    self.reveal_dealer = true
  end

  def clear
    system('clear') || system('cls')
  end

  def wait_for_any_input
    loop do
      gets.chomp
      break
    end
  end
end

# start the game
Game21.new.start
