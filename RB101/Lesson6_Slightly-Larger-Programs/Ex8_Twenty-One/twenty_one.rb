PROMPT = '=>'

SYM_TAG = :tag
SYM_VALUE = :value
SYM_SUIT = :suit

SYM_CARDS = :cards
SYM_SCORE = :score

CHOICE_HIT = 'hit'
CHOICE_STAY = 'stay'

TAG_ACE = 'Ace'

def prompt(msg)
  puts "#{PROMPT} #{msg}"
end

BASE_CARDS = [
  {SYM_TAG => 'Two',    SYM_VALUE => 2},
  {SYM_TAG => 'Three',  SYM_VALUE => 3},
  {SYM_TAG => 'Four',   SYM_VALUE => 4},
  {SYM_TAG => 'Five',   SYM_VALUE => 5},
  {SYM_TAG => 'Six',    SYM_VALUE => 6},
  {SYM_TAG => 'Seven',  SYM_VALUE => 7},
  {SYM_TAG => 'Eight',  SYM_VALUE => 8},
  {SYM_TAG => 'Nine',   SYM_VALUE => 9},
  {SYM_TAG => 'Ten',    SYM_VALUE => 10},
  {SYM_TAG => 'Jack',   SYM_VALUE => 10},
  {SYM_TAG => 'Queen',  SYM_VALUE => 10},
  {SYM_TAG => 'King',   SYM_VALUE => 10},
  {SYM_TAG => TAG_ACE,  SYM_VALUE => 11}
]

CARD_COMBO_MAXL = 22

SUITS = ['Hearts', 'Diamonds', 'Clubs', 'Spades']

def deck_init
  deck = []
  SUITS.each do |suit|
    deck += BASE_CARDS.map do |card|
      new_card = card.dup
      new_card[SYM_SUIT] = suit
      new_card
    end
  end
  deck
end

def deck_shuffle!(deck)
  deck.shuffle!
end

def entity_init
  {
    SYM_CARDS => [],
    SYM_VALUE => 0
  }
end

def deal_card_to!(entity, deck, how_many = 1)
  how_many.times do 
    break if deck.empty?
    entity[SYM_CARDS].push(deck.pop)
  end
end

def max_card_count(e_player, e_dealer)
  [e_player[SYM_CARDS].size, e_dealer[SYM_CARDS].size].max
end

def card_description_centered(card)
  "#{card[SYM_TAG]} of #{card[SYM_SUIT]}".center(CARD_COMBO_MAXL, ' ')
end

def ace_count(cards)
  cards.select { |card| card[SYM_TAG] == TAG_ACE}.size
end

def sum_non_ace(cards)
  sum = 0
  cards.each do |card|
    sum += card[SYM_VALUE] if cards[SYM_TAG] != TAG_ACE
  end
  sum
end

def hand_value(entity)
  cards = entity[SYM_CARDS]
  aces_count = ace_count(cards)
  sum_non_ace = sum_non_ace(cards)
  i_rnd_up = ((-21.0 + sum_non_ace + 11.0 * aces) / 10.0).ceil
  sum + (ace_count - i_rnd_up) * 11.0 + i_rnd_up
end

def show_cards(e_player, e_dealer)
  player_str = "Player".center(CARD_COMBO_MAXL, '-')
  dealer_str = "Dealer".center(CARD_COMBO_MAXL, '-')
  hand_value_str = "hand value".center(CARD_COMBO_MAXL, '-')
  div_hori = '-'*CARD_COMBO_MAXL
  div_hori_empty = ' '*CARD_COMBO_MAXL
  max_card_count = max_card_count(e_player, e_dealer)
  hand_value_player = hand_value(e_player)
  hand_value_dealer = hand_value(e_dealer)

  puts format("+%s+%s+", div_hori, div_hori)
  puts format("+%s+%s+", player_str, dealer_str)
  puts format("+%s+%s+", div_hori, div_hori)
  max_card_count.times do |index|
    card_player = e_player[SYM_CARDS][index]
    card_dealer = e_dealer[SYM_CARDS][index]
    if card_player
      print format("+%s", card_description_centered(card_player))
    else
      print format("+%s", div_hori_empty)
    end
    if card_dealer
      puts format("+%s+", card_description_centered(card_dealer))
    else
      puts format("+%s+", div_hori_empty)
    end
  end
  puts format("+%s+%s+", div_hori, div_hori)
  puts format("+%s+%s+", hand_value_str, hand_value_str)
  puts format("+%s+%s+", div_hori, div_hori)

end

# init and shuffle fresh deck
deck = deck_init
deck_shuffle!(deck)

# create player and dealer entities
e_player = entity_init
e_dealer = entity_init

# deal cards to player, then dealer
deal_card_to!(e_player, deck, 5)
deal_card_to!(e_dealer, deck, 4)

# player turn
# prompt: hit or stay?
show_cards(e_player, e_dealer)
# hit:
#   - pop 1 card from deck
#   - re-compute player hand score
#   - render cards
#   - bust or stay -> set state
#   - ask again


=begin
  card = {
    value: some_value,
    descr: 'some_string',
    suit: 'some_string'
  }

  base_cards = [
    {value:  2, descr: 'Two'},
    {value: 10, descr: 'Ten'},
    {value: 10, descr: 'Queen'}
  ]

  deck = []
  deck += base_cards.map { |card| card[:suit] = 'some_suit'; card}

=end

# check player state bust?

# dealer turn
# prompt: hit or stay?
# hit:
#   - pop 1 card from deck
#   - re-compute dealer hand score
#   - render cards
#   - bust? -> set state
#   - if score >= 17 stay

# check player and dealer states
# both stay -> showdown
# anyone bust? -> opponent wins
# 
    


