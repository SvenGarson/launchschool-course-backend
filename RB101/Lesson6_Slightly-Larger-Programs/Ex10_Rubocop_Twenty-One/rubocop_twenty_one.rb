# CONSTANTS
PROMPT = '=>'

CARD_DESCR_MAXL = 22
CARD_DESCR_SEP = ' of '
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

EXEC_TEST_RUN = false

TAG_ACE = 'Ace'

SUITS = ['Hearts', 'Diamonds', 'Clubs', 'Spades']

BASE_CARDS = [
  { KEY_TAG => 'Two',    KEY_VALUE => 2 },
  { KEY_TAG => 'Three',  KEY_VALUE => 3 },
  { KEY_TAG => 'Four',   KEY_VALUE => 4 },
  { KEY_TAG => 'Five',   KEY_VALUE => 5 },
  { KEY_TAG => 'Six',    KEY_VALUE => 6 },
  { KEY_TAG => 'Seven',  KEY_VALUE => 7 },
  { KEY_TAG => 'Eight',  KEY_VALUE => 8 },
  { KEY_TAG => 'Nine',   KEY_VALUE => 9 },
  { KEY_TAG => 'Ten',    KEY_VALUE => 10 },
  { KEY_TAG => 'Jack',   KEY_VALUE => 10 },
  { KEY_TAG => 'Queen',  KEY_VALUE => 10 },
  { KEY_TAG => 'King',   KEY_VALUE => 10 },
  { KEY_TAG => TAG_ACE,  KEY_VALUE => 11 }
]

# METHODS

def prompt(msg)
  puts "#{PROMPT} #{msg}"
end

def sorted_card_tags
  SUITS.sort_by(&:length)
end

def sorted_card_suits
  tags = BASE_CARDS.map do |card|
    card[KEY_TAG]
  end
  tags.sort_by(&:size)
end

def max_tag_length
  sorted_card_tags.last.size
end

def max_suit_length
  sorted_card_suits.last.size
end

def description_length
  max_tag_length + CARD_DESCR_SEP.size + max_suit_length + 2
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

def entity_init(starting_hand = nil)
  cards = []
  cards += starting_hand if starting_hand
  {
    KEY_CARDS => cards,
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

def compute_hand_value(cards)
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
  sum_without_aces + as_eleven * 11 + as_one * 1
end

def evaluate_hand!(entity)
  value = compute_hand_value(cards(entity))
  entity[KEY_VALUE] = value
  value
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
    card_tag(card) + CARD_DESCR_SEP + card_suit(card)
  else
    ''
  end
end

def clear_screen
  system('cls') unless system('clear')
end

# rubocop:disable Metrics/MethodLength, Metrics/AbcSize
def show_cards(player, dealer, reveal_dealer = false)
  clear_screen
  cell_width = description_length

  # columns for player and dealer
  print_div_center('', '', cell_width, '-')
  print_div_center('Player', 'Dealer', cell_width)
  print_div_center('', '', cell_width, '-')

  # cards
  dealer_card_count = card_count(dealer)
  max_card_count = [card_count(player), dealer_card_count].max
  cards_player = cards(player)
  cards_dealer = cards(dealer)

  max_card_count.times do |index|
    card_player = cards_player[index]
    card_dealer = cards_dealer[index]

    card_descr_player = card_description(card_player)
    card_descr_dealer = card_description(card_dealer)

    is_last_dealer_card = (index == dealer_card_count - 1)

    if is_last_dealer_card && !reveal_dealer
      card_descr_dealer = '???'
    end

    print_div_center(card_descr_player, card_descr_dealer, cell_width, ' ')
  end

  print_div_center('', '', cell_width, '-')
  print_div_center('hand value', 'hand value', cell_width, '-')

  hand_value_player = hand_value(player).to_s
  hand_value_dealer = reveal_dealer ? hand_value(dealer).to_s : '?'

  print_div_center(hand_value_player, hand_value_dealer, cell_width, '-')
  print_div_center('', '', cell_width, '-')
end
# rubocop:enable Metrics/MethodLength, Metrics/AbcSize

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

def state!(entity, state)
  entity[KEY_STATE] = state
end

def bust?(entity)
  hand_value(entity) > VALUE_WIN
end

def state?(entity, state)
  state(entity) == state
end

def state(entity)
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
      state!(player, STATE_STAY)
    end

    state!(player, STATE_BUST) if bust?(player)

    break if state?(player, STATE_STAY) || state?(player, STATE_BUST)
  end
end

def dealer_turn(player, dealer, deck)
  loop do
    prompt('Dealer is thinking...')
    sleep(SLEEP_TIME_DEALER)

    if hand_value(dealer) < VALUE_DEALER_MIN
      prompt('Dealer is drawing a card...')
      sleep(SLEEP_TIME_DEALER)
      deal_card_to_and_evaluate!(dealer, deck, 1)
      show_cards(player, dealer)
    else
      prompt('Dealer stays.')
      sleep(SLEEP_TIME_DEALER)
      state!(dealer, STATE_STAY)
    end

    state!(dealer, STATE_BUST) if bust?(dealer)

    break if state?(dealer, STATE_STAY) || state?(dealer, STATE_BUST)
  end
end

def showdown_result(player, dealer)
  value_player = hand_value(player)
  value_dealer = hand_value(dealer)
  if value_player > value_dealer
    "Player wins with #{value_player}/21"
  elsif value_dealer > value_player
    "Dealer wins with #{value_dealer}/21"
  else
    "Tie! Both player and dealer #{value_player}/21"
  end
end

def showdown?(player, dealer)
  state?(player, STATE_STAY) && state?(dealer, STATE_STAY)
end

def play_again?
  prompt("Play again? (y or n)")
  answer = gets.chomp
  answer.start_with?('y')
end

# rubocop:disable Style/SpaceInsideParens, Metrics/MethodLength, Metrics/AbcSize
# rubocop:disable Metrics/LineLength, Style/SpaceAfterComma, Style/VariableName
def test_run
  # extract base cards
  c2 = BASE_CARDS[0]
  c6 = BASE_CARDS[4]
  c9 = BASE_CARDS[7]
  cJ = BASE_CARDS[9]
  cK = BASE_CARDS[11]
  cA = BASE_CARDS[12]
  # test cases
  results = []
  results << (evaluate_hand!(entity_init                                    ) == 0 )
  results << (evaluate_hand!(entity_init([c2, c6, c9])                      ) == 17)
  results << (evaluate_hand!(entity_init([c2, c9, c6, c2, c2])              ) == 21)
  results << (evaluate_hand!(entity_init([cJ, cK])                          ) == 20)
  results << (evaluate_hand!(entity_init([cJ, cK, cA])                      ) == 21)
  results << (evaluate_hand!(entity_init([cJ, cK, c9])                      ) == 29)
  results << (evaluate_hand!(entity_init([cJ, c9, c6, c2])                  ) == 27)
  results << (evaluate_hand!(entity_init([cJ, c9, cA])                      ) == 20)
  results << (evaluate_hand!(entity_init([cA, cA, cA, cA])                  ) == 14)
  results << (evaluate_hand!(entity_init([cA,cA,cA,cA,cA,cA,cA,cA,cA,cA,cA])) == 21)
  # test result
  results.each_with_index do |res, index|
    puts "Test case (#{index}) -> #{res}"
  end
  success = results.all? { |test| test }
  result_str = success ? "SUCCESS" : 'FAILURE'
  puts format("Test is a %s", result_str)
end
# rubocop:enable Style/SpaceInsideParens, Metrics/MethodLength, Metrics/AbcSize
# rubocop:enable Metrics/LineLength, Style/SpaceAfterComma, Style/VariableName

# optional test run
if EXEC_TEST_RUN
  prompt "=== Executing test run ==="
  test_run
  exit!(true)
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
  end_game_message = nil

  loop do
    player_turn(player, dealer, deck)
    if bust?(player)
      end_game_message = "Player bust. Dealer wins!"
      break
    end

    dealer_turn(player, dealer, deck)
    if bust?(dealer)
      end_game_message = "Dealer bust. Player wins!"
      break
    end

    if showdown?(player, dealer)
      end_game_message = showdown_result(player, dealer)
      break
    end
  end

  show_cards(player, dealer, true)
  prompt(end_game_message)

  break unless play_again?
end

prompt("Thank you for playing Twenty-One!")
print("\n")
