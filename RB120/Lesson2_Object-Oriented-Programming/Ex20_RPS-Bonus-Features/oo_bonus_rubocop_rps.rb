=begin

  Messages
    - print_welcome
    - print_ready?
    - print_game_state(HISTORY)
    - print_winner_round(PLAYER_NAME)
    - print_tie
    - print_winner_game(PLAYER_NAME)
    - print_goodbye

  RPSGame
    - Rules
    - Human / Computer
    - History

  Rules
    - init with max score
    - print rules
    - determine_winner (human, computer) 
      - returns the winner or nil for tie
    - someone won (human, computer)

  Human/Computer
    - set name / set personality
    - select move
    - increment score
    - get score
    - reset score

  Personality
    - select move

  History
    - clear
    - add: player_move, computer_move, winner

  Move
    - type (symbol with choice)
    - compare against other move

  Input
    - prompt 'you ready?'
        - wait until empty line entered
    - prompt 'play another game'
        - return true or false

  # Features
  ----------
  - Fully validated input
  - checks made from single source 
  - avoided duplication of literals (strings, symbols)
  - input for choice can be:
    - first char (first 2 for spock)
    - extra abbrev 'sciss' and 'liz' for scissors and lizard
    - full length words
  - informative error messages
  - did not create class for every move, since my approach
    did not need that indirection

  # thoughts
  - overly complex
  - logger class ...
  - cool to get input until certain dynamic criteria met
  - would be nice to pipe all output through a class / funnel
  - properly implement percentage of Ai choices
  - hacks used responds to .... :)
  . player name length not limited
  - table side not adjusted for very large round numbers
    

=end

class RPSHistory
  
  class RPSHistoryEntry
    
    attr_reader :player_move, :computer_move, :winner_name

    def initialize(player_move, computer_move, winner_name)
      @player_move = player_move
      @computer_move = computer_move
      @winner_name = winner_name
    end
  end

  def initialize
    @history = Array.new
  end

  def add(player_move, computer_move, winner_name)
    @history << RPSHistoryEntry.new(player_move, computer_move, winner_name)
  end

  def clear
    @history.clear
  end

  def print(human, computer)
    @history.each_with_index do |entry, index|    
      puts "|  #{index+1}  |  #{entry.player_move.type}  |  #{entry.computer_move.type}  |  #{entry.winner_name}  |"
    end
    puts "|  #{human.name}(#{human.score})"
    puts "|  #{computer.name}(#{computer.score})"
  end

end

class RPSResult

  attr_reader :winner, :looser

  def initialize(winner, looser)
    @winner = winner
    @looser = looser
  end

  def print_computer_message
    if winner.is_ai?
      puts "#{winner.name} says: #{winner.winning_msg}"
    else
      puts "#{looser.name} says: #{looser.loosing_msg}"
    end
  end

end

class RPSRules
  CHOICE_ROCK  = :rock
  CHOICE_PAPER = :paper
  CHOICE_SCISS = :sciss
  CHOICE_LIZ   = :lizard
  CHOICE_SPOCK = :spock

  CHOICES = [CHOICE_ROCK, CHOICE_PAPER, CHOICE_SCISS, CHOICE_LIZ, CHOICE_SPOCK]

  CHOICE_MAP = {
    'r'  => CHOICE_ROCK,  'rock'     => CHOICE_ROCK,
    'p'  => CHOICE_PAPER, 'paper'    => CHOICE_PAPER,
    's'  => CHOICE_SCISS, 'scissors' => CHOICE_SCISS,
                          'sciss'    => CHOICE_SCISS,
    'l'  => CHOICE_LIZ,   'liz'      => CHOICE_LIZ, 
                          'lizard'   => CHOICE_LIZ,
    'sp' => CHOICE_SPOCK, 'spock'    => CHOICE_SPOCK
  }

  RULE_MAP = {
    CHOICE_ROCK => {
        CHOICE_ROCK  =>  0,
        CHOICE_PAPER => -1,
        CHOICE_SCISS =>  1,
        CHOICE_LIZ   =>  1,
        CHOICE_SPOCK => -1
      },
    CHOICE_PAPER => {
        CHOICE_ROCK  =>  1,
        CHOICE_PAPER =>  0,
        CHOICE_SCISS => -1,
        CHOICE_LIZ   => -1,
        CHOICE_SPOCK =>  1
      },
    CHOICE_SCISS => {
        CHOICE_ROCK  => -1,
        CHOICE_PAPER =>  1,
        CHOICE_SCISS =>  0,
        CHOICE_LIZ   =>  1,
        CHOICE_SPOCK =>  1
      },
    CHOICE_LIZ => {
        CHOICE_ROCK  => -1,
        CHOICE_PAPER =>  1,
        CHOICE_SCISS => -1,
        CHOICE_LIZ   =>  0,
        CHOICE_SPOCK =>  1
      },
    CHOICE_SPOCK => {
        CHOICE_ROCK  =>  1,
        CHOICE_PAPER => -1,
        CHOICE_SCISS =>  1,
        CHOICE_LIZ   => -1,
        CHOICE_SPOCK =>  0
      }
  }
 

  RULE_STR = ["\nEach round, the human player chooses his move, then the computer chooses his.\n",
              "The winner is granted 1 point and in case of a tie, nobody is granted a point.\n",
              "The game goes on until one of both players reaches the max score.\n",
              "\nYou may want to look out for the AI's tendencies. Good luck!\n\n"].join.freeze

  attr_reader :max_rounds

  def initialize(max_rounds)
    @max_rounds = max_rounds
  end

  def determine_winner(player_a, player_b)
    move_a = player_a.move
    move_b = player_b.move
    if move_a > move_b
      RPSResult.new(player_a, player_b)
    elsif move_a < move_b
      RPSResult.new(player_b, player_a)
    else
      nil
    end
  end

  def game_over?(player_a, player_b)
    player_a.score >= max_rounds || player_b.score >= max_rounds
  end

  def to_s
    RULE_STR
  end

  def self.valid_choice_str_anycase?(choice_str)
    CHOICE_MAP.key?(choice_str.downcase)
  end

  def self.readable_valid_choices
    choice_strarr = CHOICE_MAP.keys
    joined = choice_strarr.join(', ')
    par = joined.rpartition(', ')
    par[1] = ' or '
    par.join
  end
end

class RPSInput
  def self.prompt_for_non_empty_string(message)
    inp = nil
    loop do
      print message
      inp = gets.chomp
      break unless inp.empty?
      puts "Please enter something."
    end
    inp
  end

  def self.prompt_for_line(message)
    inp = nil
    loop do
      print message
      inp = gets.chomp
      break if inp.empty? or inp.length > 0
      puts "Invalid input. Try again."
    end
    inp
  end

  def self.prompt_for_valid_RPS_choice(message)
    choice = nil
    loop do
      print message
      choice = gets.chomp
      break if RPSRules.valid_choice_str_anycase?(choice)
      puts "Please chose amongst: #{RPSRules.readable_valid_choices}."
    end
    RPSRules::CHOICE_MAP[choice]
  end

  def self.prompt_for_positive_number(message)
    number = nil
    loop do
      print message
      number = gets.chomp
      number_int = number.to_i
      break if number_int.to_s == number && number_int > 0
      puts "Please enter a positive number."
    end
    number.to_i
  end

  def self.prompt_yes_or_no?(message)
    loop do
      answer = prompt_for_non_empty_string('Would you like to play one more game?(y or n)')
      answer.downcase!
      if %w(y yes).include?(answer)
        break true
      elsif %w(n no).include?(answer)
        break false
      end
      puts "Please enter yes, no, y or n."
    end
  end
end

class RPSMove
  include Comparable  

  attr_reader :type

  def initialize(type)
    @type = type
  end

  def <=>(other_move)
    RPSRules::RULE_MAP[type][other_move.type]
  end
end

class RPSPlayer
  
  private
  attr_writer :score, :move, :name, :is_ai
  public
  attr_reader :score, :move, :name, :is_ai

  def initialize(name, is_ai)
    self.score = 0
    self.move = nil
    self.name = name
    self.is_ai = is_ai
  end

  def grant_points(amount)
    self.score += amount
  end

  def reset_score
    self.score = 0
  end

  def is_ai?
    is_ai
  end    
end

class RPSPlayerAi < RPSPlayer

  attr_reader :winning_msg, :loosing_msg

  def initialize(name, winning_msg, loosing_msg)
    super(name, true)
    @winning_msg = winning_msg
    @loosing_msg = loosing_msg
  end

end

class PHuman < RPSPlayer
  def initialize
    name = RPSInput.prompt_for_non_empty_string('Choose your nickname: ')
    super(name, false)
  end

  def choose_move
    valid_choice_sym = RPSInput.prompt_for_valid_RPS_choice("Choose your move: ")
    self.move = RPSMove.new(valid_choice_sym)
  end
end

class PHal9000 < RPSPlayerAi

  def initialize
    super('HAL9000',
          "I'm sorry. I can't let you win.",
          "Well. After all. My manual does mention a \
           tendency towards choosing scissors.")
  end

  def choose_move
    type = case (1..4).to_a.sample
           when 1 then RPSRules::CHOICES.sample
           else        RPSRules::CHOICE_SCISS
           end
    self.move = RPSMove.new(type)
  end

end

class PHulk < RPSPlayerAi

  def initialize
    super('DemHulk66',
          "HAHAHAH! Puny earthling!",
          "Hulk SMASH!")
  end

  def choose_move
    self.move = RPSMove.new(RPSRules::CHOICE_ROCK)
  end
end

class POrder < RPSPlayerAi

  attr_reader :choices
  private :choices

  def initialize
    super('all-in-order',
          "Order prevails.",
          "I just want to go in order, and repeat!")
    @choices = RPSRules::CHOICES.dup
  end

  def choose_move
    self.move = RPSMove.new(choices.first)
    choices.rotate!
  end
end

class PRandom < RPSPlayerAi
  
  NAME_LIST = %w(NokNok Ron75 Bender WonByMistake 777-Gotcha).freeze

  def initialize
    super(NAME_LIST.sample, 'WoooHooo!', 'Noooooooo!')
  end

  def choose_move
    self.move = RPSMove.new(RPSRules::CHOICES.sample)
  end
  
end

class Utils

  PERSONALITIES = [PHal9000, PHulk, POrder, PRandom]  

  def self.clear_terminal
    system('cls') || system('clear')
  end

  def self.random_ai_personality
    PERSONALITIES.sample.new
  end
end

class RPSGame

  def initialize

  end

  def play
    puts "Welcome to RPS Lizard Spock!"
    human = PHuman.new
    
    rounds = RPSInput.prompt_for_positive_number('Enter max score: ')
    rules = RPSRules.new(rounds)
    puts rules

    RPSInput.prompt_for_line("#{human.name}, are you ready? (Enter to start)")
    Utils.clear_terminal

    result = nil
    history = RPSHistory.new

    # general loop
    loop do
      history.clear
      human.reset_score
      computer = Utils.random_ai_personality
      
      # per game until max score loop
      until rules.game_over?(human, computer)
        Utils.clear_terminal
        history.print(human, computer)
        human.choose_move
        computer.choose_move
      
        result = rules.determine_winner(human, computer)
        history.add(human.move, computer.move, result.nil? ? 'Tie' : result.winner.name)
        
        if result
          result.winner.grant_points(1)
          puts "#{result.winner.name} wins this round!"
        else
          puts "It's a tie!"
        end
            
      end
    
      puts "#{result.winner.name} wins this game!"
      result.print_computer_message

      # keep playing?
      break unless RPSInput.prompt_yes_or_no?('Play another game?')
    end

    puts "Thank you for playing RPS Lizard Spock!"
    
  end
end

# PROGRAM FLOW
RPSGame.new.play