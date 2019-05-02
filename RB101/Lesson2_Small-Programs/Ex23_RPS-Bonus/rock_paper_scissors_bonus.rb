# constants used by methods
CMD_CLEAR_WINDOWS = 'cls'
CMD_CLEAR_UNIX = 'clear'
PROMPT_PREFIX = '=> '
TIME_COMPUTER_SLEEP_SEC = 1.0
# constants to represent option strings
OPT_ROCK  = 'rock'
OPT_PAPER = 'paper'
OPT_SCISS = 'scissors'
OPT_LIZ   = 'lizard'
OPT_SPOCK = 'spock'
# constants to represent options abbreviation
OPT_ABBR_ROCK  =  'r'
OPT_ABBR_PAPER =  'p'
OPT_ABBR_SCISS =  's'
OPT_ABBR_LIZ   =  'l'
OPT_ABBR_SPOCK =  'sp'
# constants to represent hash lookup key's
# using strings for now
KEY_WINS_OVER = 'wins_over'
KEY_ABBR = 'abbrev'
KEY_VERB = 'verb'
# constants for game logic
SCORE_MAX = 5
# constant to represent valid choices
VALID_CHOICES = {
  OPT_ABBR_ROCK   => OPT_ROCK,
  OPT_ABBR_PAPER  => OPT_PAPER,
  OPT_ABBR_SCISS  => OPT_SCISS,
  OPT_ABBR_LIZ    => OPT_LIZ,
  OPT_ABBR_SPOCK  => OPT_SPOCK
}
# constant to represent ruleset as hash
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
    OPT_PAPER => 'cuts',
    OPT_LIZ => 'decapitates'
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
  # this method calls the windows clear system command first
  # then if the system cmd fails, either false or nil is returned
  # upon which the unix clear system command is called
  # this needs no further gems and works for windows and linux-mint
  # OSX and other linux distro's have not been not tested
  if system(CMD_CLEAR_WINDOWS) # cmd      clear windows
  else system(CMD_CLEAR_UNIX)  # terminal clear unix
  end
end

def choice_valid?(choice)
  VALID_CHOICES.flatten.include?(choice)
end

def full_from_abbrev(choice)
  # if choice is a key for valid hash, it's an
  # abbreviation and returns the full length choice
  if VALID_CHOICES.key?(choice)
    VALID_CHOICES[choice]
  else
    choice
  end
end

def valid_player_choice
  # cache valid result
  valid_choice = nil
  # loop until player enters valid choice
  loop do
    prompt("Enter your choice: ", false)
    choice = gets.chomp.downcase
    # exit loop if choice valid
    # otherwhise print error message and  valid options
    if choice_valid?(choice)
      # make sure valid choice is not an abbrevation
      valid_choice = full_from_abbrev(choice)
      break
    else
      prompt("'#{choice}' is not a valid choice!")
      prompt('r) Rock      p)Paper')
      prompt('s) Scissors  l)Lizard')
      prompt('sp)Spock')
    end
  end
  # return cached valid choice
  valid_choice
end

def valid_computer_choice
  # feedback that computer is choosing
  prompt("Computer is thinking ...")
  # wait for dramatic effect
  sleep(TIME_COMPUTER_SLEEP_SEC)
  # choose from valid full length choices
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

# game state
score_player = 0
score_computer = 0

# loop while nobody has 5 points
while score_player < SCORE_MAX && score_computer < SCORE_MAX

  # clear and print gui to get started
  clear_prompt
  print_gui(score_player, score_computer)

  # get valid player and computer choices
  choice_player = valid_player_choice
  choice_computer = valid_computer_choice

  # cache results for feedback each round
  msg_verb = nil
  msg_winner = nil

  # same choice ?
  if choice_player == choice_computer
    msg_verb = "It's a tie!"
    msg_winner = 'Both win 1 point!'
    score_player += 1
    score_computer += 1
  elsif wins_over?(choice_player, choice_computer)
    msg_verb = verb_sentence(choice_player, choice_computer)
    msg_winner = 'Player wins 1 point!'
    score_player += 1
  elsif wins_over?(choice_computer, choice_player)
    msg_verb = verb_sentence(choice_computer, choice_player)
    msg_winner = 'Computer wins 1 point!'
    score_computer += 1
  end

  # clear and update GUI
  clear_prompt
  print_gui(score_player, score_computer, choice_player, choice_computer)

  # print verb and winner message
  prompt(msg_verb)
  prompt(msg_winner)

  # hit enter for next round if nobody has 5 points already
  if score_player >= SCORE_MAX || score_computer >= SCORE_MAX
    next
  else
    prompt("Hit 'Enter' for next round.")
    gets
  end

end

# announce the winner
if score_player > score_computer
  prompt("Player is the winner with #{score_player} points!")
elsif score_computer > score_player
  prompt("Computer is the winner with #{score_computer} points!")
else
  prompt("It's a tie! Play again to see who's the luckiest!")
end

# separate from next input
print "\n"
