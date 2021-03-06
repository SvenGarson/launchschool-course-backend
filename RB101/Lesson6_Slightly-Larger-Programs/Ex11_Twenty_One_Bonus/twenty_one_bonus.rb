# CONSTANTS
PROMPT = '=>'

MAX_SCORE = 5

WINNING_HAND_VALUE = 21
DEALER_TARGET_HAND_VALUE = 17

STATE_INIT = :state_init
STATE_STAY = :state_stay
STATE_BUST = :state_bust

GUI_COL_WIDTH = 22

SUITS = ['Hearts', 'Diamonds', 'Clubs', 'Spades']

BASE_CARDS = [
  { tag: 'Two',   value: 2 },
  { tag: 'Three', value: 3 },
  { tag: 'Four',  value: 4 },
  { tag: 'Five',  value: 5 },
  { tag: 'Six',   value: 6 },
  { tag: 'Seven', value: 7 },
  { tag: 'Eight', value: 8 },
  { tag: 'Nine',  value: 9 },
  { tag: 'Ten',   value: 10 },
  { tag: 'Jack',  value: 10 },
  { tag: 'Queen', value: 10 },
  { tag: 'King',  value: 10 },
  { tag: 'Ace',   value: 11 }
]

# METHODS
def prompt(msg)
  puts "#{PROMPT} #{msg}"
end

def deck_init
  deck = []
  SUITS.each do |suit|
    deck += BASE_CARDS.map do |card|
      new_card = card.dup
      new_card[:suit] = suit
      new_card
    end
  end
  deck
end

def deck_shuffle!(deck)
  3.times { deck.shuffle! }
end

def entity_init(starting_hand = nil)
  cards = []
  cards += starting_hand if starting_hand
  {
    cards: cards,
    value: 0,
    state: STATE_INIT,
    score: 0
  }
end

def entity_reset!(entity, reset_score=false)
  entity[:cards] = []
  entity[:value] = 0
  entity[:state] = STATE_INIT
  entity[:score] = 0 if reset_score
end

def score(entity)
  entity[:score]
end

def wins_point!(entity, points=1)
  entity[:score] += points
end

def cards(entity)
  entity[:cards]
end

def card_count(entity)
  cards(entity).size
end

def card(entity, index)
  cards(entity)[index]
end

def card_value(card)
  card[:value]
end

def card_suit(card)
  card[:suit]
end

def card_tag(card)
  card[:tag]
end

def card_ace?(card)
  card[:tag] == 'Ace'
end

def hand_value(entity)
  entity[:value]
end

def sum_non_ace_cards(cards)
  sum = 0
  cards.each do |card|
    sum += card_value(card) if !card_ace?(card)
  end
  sum
end

def aces(cards)
  cards.select { |card| card_ace?(card) }.size
end

def compute_hand_value(cards)
  sum_without_aces = sum_non_ace_cards(cards)
  aces = aces(cards)
  as_eleven = aces
  as_one = nil
  loop do
    as_one = aces - as_eleven
    test_sum = sum_without_aces + (as_eleven * 11) + (as_one * 1)
    break if as_eleven == 0 || test_sum <= WINNING_HAND_VALUE
    as_eleven -= 1
  end
  sum_without_aces + as_eleven * 11 + as_one * 1
end

def evaluate_hand!(entity)
  value = compute_hand_value(cards(entity))
  entity[:value] = value
end

def deal_card_to_and_evaluate!(entity, deck, how_many = 1)
  how_many.times do
    break if deck.empty?
    entity[:cards].push(deck.pop)
    evaluate_hand!(entity)
  end
end

def clear_screen
  system('cls') unless system('clear')
end

def card_description(card)
  if card
    card_tag(card) + ' of ' + card_suit(card)
  else
    ''
  end
end

def show_gui_divider_with(text_left='', text_right='', sep = '-')
  str_center_left = text_left.center(GUI_COL_WIDTH, sep)
  str_center_right = text_right.center(GUI_COL_WIDTH, sep)
  puts format("+%-s+%-s+", str_center_left, str_center_right)
end

def show_gui_players
  show_gui_divider_with
  show_gui_divider_with('Player', 'Dealer')
end

def show_gui_score(player, dealer)
  show_gui_divider_with("Wins #{score(player)}/#{MAX_SCORE}",
                        "Wins #{score(dealer)}/#{MAX_SCORE}")
  show_gui_divider_with
end

def show_gui_cards(player, dealer, reveal_dealer=false)
  most_cards = [card_count(player), card_count(dealer)].max

  most_cards.times do |index|
    card_descr_player = card_description(card(player, index))
    card_descr_dealer = card_description(card(dealer, index))

    if !reveal_dealer && index == (card_count(dealer) - 1)
      card_descr_dealer = '???'
    end

    show_gui_divider_with(card_descr_player, card_descr_dealer, ' ')
  end
end

def show_gui_values(player, dealer, reveal_dealer=false)
  show_gui_divider_with
  show_gui_divider_with('hand value', 'hand value')

  player_value = hand_value(player).to_s + " of #{WINNING_HAND_VALUE}"
  dealer_value = if reveal_dealer
                   (hand_value(dealer).to_s + " of #{WINNING_HAND_VALUE}")
                 else
                   '?'
                 end

  show_gui_divider_with(player_value, dealer_value)
  show_gui_divider_with
end

def show_gui(player, dealer, reveal_dealer = false)
  clear_screen
  show_gui_players
  show_gui_score(player, dealer)
  show_gui_cards(player, dealer, reveal_dealer)
  show_gui_values(player, dealer, reveal_dealer)
end

def prompt_player_choice
  choice = nil
  loop do
    prompt("Hit(h) or stay(s)?")
    choice = gets.chomp.downcase

    choice = if choice == 'hit' || choice == 'h'
               'hit'
             elsif choice == 'stay' || choice == 's'
               'stay'
             else
               prompt("Please enter hit, h, stay or s.")
             end

    break unless !choice
  end
  choice
end

def state!(entity, state)
  entity[:state] = state
end

def bust?(entity)
  hand_value(entity) > WINNING_HAND_VALUE
end

def state?(entity, state)
  state(entity) == state
end

def state(entity)
  entity[:state]
end

def player_hit(player, deck)
  prompt("Drawing a card...")
  sleep(1.0)
  deal_card_to_and_evaluate!(player, deck, 1)
end

def player_stay(player)
  state!(player, STATE_STAY)
end

def player_turn(player, dealer, deck)
  loop do
    choice = prompt_player_choice

    if choice == 'hit'
      player_hit(player, deck)
      show_gui(player, dealer)
    elsif choice == 'stay'.downcase
      player_stay(player)
    end

    state!(player, STATE_BUST) if bust?(player)

    break if state?(player, STATE_STAY) || state?(player, STATE_BUST)
  end
end

def dealer_hit(dealer, deck)
  prompt('Dealer is drawing a card...')
  sleep(2.0)
  deal_card_to_and_evaluate!(dealer, deck, 1)
end

def dealer_stay(dealer)
  prompt('Dealer stays.')
  sleep(2.0)
  state!(dealer, STATE_STAY)
end

def dealer_turn(player, dealer, deck)
  loop do
    prompt('Dealer is thinking...')
    sleep(2.0)

    if hand_value(dealer) < DEALER_TARGET_HAND_VALUE
      dealer_hit(dealer, deck)
      show_gui(player, dealer)
    else
      dealer_stay(dealer)
    end

    state!(dealer, STATE_BUST) if bust?(dealer)

    break if state?(dealer, STATE_STAY) || state?(dealer, STATE_BUST)
  end
end

def showdown_result(player, dealer)
  value_player = hand_value(player)
  value_dealer = hand_value(dealer)
  if value_player > value_dealer
    wins_point!(player)
    "Player wins round with #{value_player}/#{WINNING_HAND_VALUE}"
  elsif value_dealer > value_player
    wins_point!(dealer)
    "Dealer wins round with #{value_dealer}/#{WINNING_HAND_VALUE}"
  else
    "Tie! Both player and dealer #{value_player}/#{WINNING_HAND_VALUE}"
  end
end

def showdown?(player, dealer)
  state?(player, STATE_STAY) && state?(dealer, STATE_STAY)
end

def play_next_round?
  answer = nil
  loop do
    prompt("Play next round? (y or n)")
    answer = gets.chomp.downcase
    break if %w(yes y no n).include?(answer)
    prompt("Please enter yes, y, no or n.")
  end
  answer.start_with?('y')
end

def game_over?(player, dealer)
  score(player) >= MAX_SCORE || score(dealer) >= MAX_SCORE
end

def game_result(player, dealer)
  if score(player) > score(dealer)
    "Player wins the game!"
  elsif score(dealer) > score(player)
    "Dealer wins the game!"
  else
    "It's a tie, nobody wins the game!"
  end
end

# LOOP PERSISTENT GAME STATE
player = entity_init
dealer = entity_init

# GAME LOGIC
loop do
  deck = deck_init
  deck_shuffle!(deck)

  entity_reset!(player)
  entity_reset!(dealer)

  deal_card_to_and_evaluate!(player, deck, 2)
  deal_card_to_and_evaluate!(dealer, deck, 2)
  show_gui(player, dealer)
  end_round_message = nil

  loop do
    player_turn(player, dealer, deck)
    if bust?(player)
      end_round_message = "Player bust. Dealer wins round!"
      wins_point!(dealer)
      break
    end

    dealer_turn(player, dealer, deck)
    if bust?(dealer)
      end_round_message = "Dealer bust. Player wins round!"
      wins_point!(player)
      break
    end

    if showdown?(player, dealer)
      end_round_message = showdown_result(player, dealer)
      break
    end
  end

  show_gui(player, dealer, true)
  prompt(end_round_message)

  if game_over?(player, dealer)
    prompt(game_result(player, dealer))
    break
  end

  break unless play_next_round?
end

prompt("Thank you for playing Twenty-One!")
print("\n")
