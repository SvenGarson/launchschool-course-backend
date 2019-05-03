CMD_CLEAR_WINDOWS = 'cls'
CMD_CLEAR_UNIX = 'clear'
PROMPT_PREFIX = '=> '
TIME_COMPUTER_SLEEP_SEC = 1.0

OPT_ROCK  = 'rock'
OPT_PAPER = 'paper'
OPT_SCISS = 'scissors'
OPT_LIZ   = 'lizard'
OPT_SPOCK = 'spock'

OPT_ABBR_ROCK  =  'r'
OPT_ABBR_PAPER =  'p'
OPT_ABBR_SCISS =  's'
OPT_ABBR_LIZ   =  'l'
OPT_ABBR_SPOCK =  'sp'

KEY_WINS_OVER = 'wins_over'
KEY_ABBR = 'abbrev'
KEY_VERB = 'verb'

MAX_SCORE = 5

VALID_CHOICES = {
  OPT_ABBR_ROCK   => OPT_ROCK,
  OPT_ABBR_PAPER  => OPT_PAPER,
  OPT_ABBR_SCISS  => OPT_SCISS,
  OPT_ABBR_LIZ    => OPT_LIZ,
  OPT_ABBR_SPOCK  => OPT_SPOCK
}

RULESET = {

  OPT_ROCK => {
    OPT_LIZ => 'crushes',
    OPT_SCISS => 'crushes'
  },
  OPT_PAPER => {
    OPT_ROCK => 'covers',
    OPT_SPOCK => 'disproves'
  },
  OPT_SCISS => {
    OPT_PAPER => 'cut',
    OPT_LIZ => 'decapitate'
  },
  OPT_LIZ => {
    OPT_PAPER => 'eats',
    OPT_SPOCK => 'poisons'
  },
  OPT_SPOCK => {
    OPT_SCISS => 'smashes',
    OPT_ROCK => 'vaporizes'
  }
}

# method definitions
def print_gui(score_play=0, score_comp=0, choice_play='', choice_comp='')
  puts        "+------- Rock/Paper/Scissors/Lizard/Spock ------+"
  puts        "+-----------------------------------------------+"
  puts        "+----- Player score ---+--- Computer score -----+"
  puts format("+----- %-12d ---+--- %-14d -----+",
              score_play, score_comp)
  puts        "+----------------------+------------------------+"
  puts        "+---- Player choice ---+--- Computer choice ----+"
  puts format("+---- %-13s ---+--- %-15s ----+",
              choice_play.capitalize,
              choice_comp.capitalize)
  puts        "+-----------------------------------------------+"
end

def prompt(message, newline = true)
  if newline
    puts PROMPT_PREFIX + message
  else
    print PROMPT_PREFIX + message
  end
end

def clear_prompt
  if system(CMD_CLEAR_WINDOWS)
  else system(CMD_CLEAR_UNIX)
  end
end

def choice_valid?(choice)
  VALID_CHOICES.flatten.include?(choice)
end

def full_from_abbrev(choice)
  if VALID_CHOICES.key?(choice)
    VALID_CHOICES[choice]
  else
    choice
  end
end

def print_valid_choices
  prompt('r) Rock      p)Paper')
  prompt('s) Scissors  l)Lizard')
  prompt('sp)Spock')
end

def retrieve_valid_player_choice
  valid_choice = nil

  loop do
    prompt("Enter your choice: ", false)
    choice = gets.chomp.downcase

    if choice_valid?(choice)
      valid_choice = full_from_abbrev(choice)
      break
    else
      # limit amount of printed characters for invalid choice
      prompt(format("'%.16s' is not a valid choice!", choice))
      print_valid_choices
    end
  end

  valid_choice
end

def retrieve_computer_choice
  prompt("Computer is thinking ...")

  sleep(TIME_COMPUTER_SLEEP_SEC)

  VALID_CHOICES.values.sample
end

def wins_over?(winner, looser)
  RULESET.key?(winner) && RULESET[winner].key?(looser)
end

def wins_over_verb(winner, looser)
  RULESET[winner][looser]
end

def verb_sentence(winner, looser)
  winner.capitalize + ' ' + wins_over_verb(winner, looser) + ' ' + looser
end

def match_ended?(score_player, score_computer)
  score_player >= MAX_SCORE || score_computer >= MAX_SCORE
end

def print_welcome_and_wait
  clear_prompt
  prompt("First player who reaches #{MAX_SCORE} points wins!")
  prompt("Press 'Enter' to start the game ...")
  gets
end

def print_winner(score_player, score_computer)
  if score_player > score_computer
    prompt("Player is the winner with #{score_player} points!")
  elsif score_computer > score_player
    prompt("Computer is the winner with #{score_computer} points!")
  else
    prompt("It's a tie! Play again to see who's the luckiest!")
  end
  print "\n"
end

def round_tie?(choice_player, choice_computer)
  choice_player == choice_computer
end

def compute_points(choice_player, choice_computer)
  # points [player, computer]
  if round_tie?(choice_player, choice_computer)
    [1, 1]
  elsif wins_over?(choice_player, choice_computer)
    [1, 0]
  else
    [0, 1]
  end
end

def print_round_result(choice_player, choice_computer, points)
  # base output on compute_points method to rely on
  # one source of game logic

  msg_verb = nil
  msg_winner = nil

  if points.sum == 2
    msg_verb = "It's a tie!"
    msg_winner = 'Both win 1 point!'
  elsif points[0] == 1
    msg_verb = verb_sentence(choice_player, choice_computer)
    msg_winner = 'Player wins 1 point!'
  else
    msg_verb = verb_sentence(choice_computer, choice_player)
    msg_winner = 'Computer wins 1 point!'
  end

  prompt(msg_verb)
  prompt(msg_winner)
end

def prompt_next_round(score_player, score_computer)
  unless match_ended?(score_player, score_computer)
    prompt("Press 'Enter' for next round.")
    gets
  end
end

# game state
score_player = 0
score_computer = 0

# start
print_welcome_and_wait

until match_ended?(score_player, score_computer)

  clear_prompt
  print_gui(score_player, score_computer)

  choice_player =   retrieve_valid_player_choice
  choice_computer = retrieve_computer_choice

  points = compute_points(choice_player, choice_computer)

  score_player +=   points[0]
  score_computer += points[1]

  clear_prompt
  print_gui(score_player, score_computer, choice_player, choice_computer)

  print_round_result(choice_player, choice_computer, points)

  prompt_next_round(score_player, score_computer)

end

# end
print_winner(score_player, score_computer)
