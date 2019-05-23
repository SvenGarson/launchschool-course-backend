# CONSTANTS
PROMPT = '=>'

CARD_DESCR_MAXL = 22

SHUFFLES = 3

VALUE_WIN = 21
VALUE_DEALER_MIN = 17

CHOICE_HIT = 'Hit'
CHOICE_STAY = 'Stay'

KEY_TAG = :tag
KEY_VALUE = :value
KEY_SUIT = :suit

KEY_CARDS = :cards
KEY_SCORE = :score
KEY_STATE = :state

STATE_NONE = 0x01
STATE_STAY = 0x02
STATE_BUST = 0x04

SLEEP_TIME_PLAYER = 1.0
SLEEP_TIME_DEALER = 2.0

TAG_ACE = 'Ace'

SUITS = ['Hearts', 'Diamonds', 'Clubs', 'Spades']

BASE_CARDS = [
  {KEY_TAG => 'Two',    KEY_VALUE => 2},
  {KEY_TAG => 'Three',  KEY_VALUE => 3},
  {KEY_TAG => 'Four',   KEY_VALUE => 4},
  {KEY_TAG => 'Five',   KEY_VALUE => 5},
  {KEY_TAG => 'Six',    KEY_VALUE => 6},
  {KEY_TAG => 'Seven',  KEY_VALUE => 7},
  {KEY_TAG => 'Eight',  KEY_VALUE => 8},
  {KEY_TAG => 'Nine',   KEY_VALUE => 9},
  {KEY_TAG => 'Ten',    KEY_VALUE => 10},
  {KEY_TAG => 'Jack',   KEY_VALUE => 10},
  {KEY_TAG => 'Queen',  KEY_VALUE => 10},
  {KEY_TAG => 'King',   KEY_VALUE => 10},
  {KEY_TAG => TAG_ACE,  KEY_VALUE => 11}
]

# METHODS
def prompt(msg)
  puts "#{PROMPT} #{msg}"
end

def sorted_card_tags
  SUITS.sort_by { |suit| suit.length }
end

def sorted_card_suits
  tags = BASE_CARDS.map do |card|
           card[KEY_TAG]
         end
  tags.sort_by { |str| str.size}
end

def max_tag_length
  sorted_card_tags.last.size
end

def max_suit_length
  sorted_card_suits.last.size
end

def description_length
  max_tag_length + ' of '.size + max_suit_length + 2
end

def deck_init
  deck = []
  SUITS.each do |suit|
    deck += BASE_CARDS.map do |card|
      new_card = card.dup
      new_card[KEY_SUIT] = suit
      new_card
    end
  end
  deck
end

def deck_shuffle!(deck)
  SHUFFLES.times { deck.shuffle! }
end

def entity_init
  {
    KEY_CARDS => [],
    KEY_VALUE => 0,
    KEY_STATE => STATE_NONE
  }
end

def cards(entity)
  entity[KEY_CARDS]
end

def card_value(card)
  card[KEY_VALUE]
end

def card_suit(card)
  card[KEY_SUIT]
end

def card_tag(card)
  card[KEY_TAG]
end

def card_ace?(card)
  card[KEY_TAG] == TAG_ACE
end

def hand_value(entity)
  entity[KEY_VALUE]
end

def sum_cards_non_ace(cards)
  sum = 0
  cards.each do |card|
    sum += card_value(card) if !card_ace?(card)
  end
  sum
end

def aces(cards)
  cards.select { |card| card_ace?(card) }.size
end

def card_count(entity)
  cards(entity).size
end

def evaluate_hand!(entity)
  cards = cards(entity)
  sum_without_aces = sum_cards_non_ace(cards)
  aces = aces(cards)
  as_eleven = aces
  as_one = nil
  loop do
    as_one = aces - as_eleven
    test_sum = sum_without_aces + (as_eleven * 11) + (as_one * 1)
    break if as_eleven == 0 || test_sum <= VALUE_WIN
    as_eleven -= 1
  end
  entity[KEY_VALUE] = sum_without_aces + as_eleven * 11 + as_one * 1
end

def deal_card_to_and_evaluate!(entity, deck, how_many = 1)
  how_many.times do 
    break if deck.empty?
    entity[KEY_CARDS].push(deck.pop)
    evaluate_hand!(entity)
  end
end

def print_div_center(text_left, text_right, cell_width, sep = '-')
    str_center_left = text_left.center(cell_width, sep)
    str_center_right = text_right.center(cell_width, sep)
    puts format("+%-s+%-s+", str_center_left, str_center_right)
end

def card_description(card)
  if card
    card_tag(card) + ' of ' + card_suit(card)
  else
    ''
  end
end

def clear_screen
  system('cls') unless system('clear')
end

def show_cards(player, dealer, reveal_dealer = false)
  clear_screen
  cell_width = description_length

  # columns for player and dealer
  print_div_center('', '', cell_width, '-')
  print_div_center('Player', 'Dealer', cell_width)
  print_div_center('', '', cell_width, '-')

  # cards
  dealer_card_count = card_count(dealer)
  max_card_count = [card_count(player),dealer_card_count].max
  cards_player = cards(player)
  cards_dealer = cards(dealer)

  max_card_count.times do |index|
    card_player = cards_player[index]
    card_dealer = cards_dealer[index]

    card_descr_player = card_description(card_player)
    card_descr_dealer = card_description(card_dealer)

    is_last_dealer_card = (index == dealer_card_count-1)
    card_descr_dealer = '???' if is_last_dealer_card 

    print_div_center(card_descr_player, card_descr_dealer, cell_width, ' ')

  end

  print_div_center('', '', cell_width, '-')
  print_div_center('hand value', 'hand value', cell_width, '-')
  print_div_center(hand_value(player).to_s, hand_value(dealer).to_s, cell_width, '-')
  print_div_center('', '', cell_width, '-')
end

def prompt_choice
  choice = nil
  loop do
    prompt("#{CHOICE_HIT.capitalize} or #{CHOICE_STAY.downcase}?")
    choice = gets.chomp.downcase

    break if [CHOICE_HIT.downcase, CHOICE_STAY.downcase].include?(choice)
    prompt("Please enter #{CHOICE_HIT.downcase} or #{CHOICE_STAY.downcase}.")
  end
  choice
end

def set_state!(entity, state)
  entity[KEY_STATE] = state
end

def bust?(entity)
  hand_value(entity) > VALUE_WIN
end

def is_state?(entity, state)
  get_state(entity) == state
end

def get_state(entity)
  entity[KEY_STATE]
end

def player_turn(player, dealer, deck)
  loop do
    choice = prompt_choice

    if choice == CHOICE_HIT.downcase
      prompt("Drawing a card...")
      sleep(SLEEP_TIME_PLAYER)
      deal_card_to_and_evaluate!(player, deck, 1)
      show_cards(player, dealer)
    elsif choice == CHOICE_STAY.downcase
      set_state!(player, STATE_STAY)
    end

    set_state!(player, STATE_BUST) if bust?(player)

    break if is_state?(player, STATE_STAY) || is_state?(player, STATE_BUST)
  end
end

def dealer_turn(player, dealer, deck)
  loop do
  
    curr_value = hand_value(dealer)

    prompt('Dealer is thinking...')
    sleep(SLEEP_TIME_DEALER)

    if curr_value < VALUE_DEALER_MIN
      prompt('Dealer is drawing a card...')
      sleep(SLEEP_TIME_DEALER)
      deal_card_to_and_evaluate!(dealer, deck, 1)
      show_cards(player, dealer)
    else
      prompt('Dealer stays.')
      sleep(SLEEP_TIME_DEALER)
      set_state!(dealer, STATE_STAY)
    end

    set_state!(dealer, STATE_BUST) if bust?(dealer)

    break if is_state?(dealer, STATE_STAY) || is_state?(dealer, STATE_BUST)
  end
end

def showdown(player, dealer)
  value_player = hand_value(player)
  value_dealer = hand_value(dealer)
  if value_player > value_dealer
    prompt("Player wins with #{value_player}/21")
  elsif value_dealer > value_player
    prompt("Dealer wins with #{value_dealer}/21")
  else
    prompt("Tie with Player and Dealer #{value_player}/21")
  end
end

def play_again?
  prompt("Play again? (y or n)")
  answer = gets.chomp
  answer.start_with?('y')
end

# GAME LOGIC
loop do
  
  deck = deck_init
  deck_shuffle!(deck)

  player = entity_init
  dealer = entity_init
  
  deal_card_to_and_evaluate!(player, deck, 2)
  deal_card_to_and_evaluate!(dealer, deck, 2)
  
  show_cards(player, dealer)

  loop do
    player_turn(player, dealer, deck)
    if is_state?(player, STATE_BUST)
      prompt("Player bust. Dealer wins!")
      break
    end

    dealer_turn(player, dealer, deck)
    if is_state?(dealer, STATE_BUST)
      prompt("Dealer bust. Player wins!")
      break
    end

    if is_state?(player, STATE_STAY) && is_state?(dealer, STATE_STAY)
      showdown(player, dealer)
      break
    end

  end

  break unless play_again?

end

prompt("Thank you for playing Twenty-One!")