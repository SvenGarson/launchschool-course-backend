class RPSPlayer
  private

  attr_writer :name, :move, :score

  public

  attr_reader :name, :move, :score

  def initialize(name)
    self.name = name
    self.move = nil
    self.score = 0
  end

  def choose_move; end

  def increment_score
    self.score += 1
  end

  def zero_score
    self.score = 0
  end
end

class RPSPlayerHuman < RPSPlayer
  CHOICES_MOVES = RPSMoveRules::MOVE_STR_SELECTION
  CHOICE_PROMPT = "\n\nChoose amongst: Rock(r) Paper(p) Scissors(s) \
Lizard(l) Spock(sp): "
  INVALID_PROMPT = "\nNot a valid choice."

  def choose_move
    choice = RPSInput.prompt_listed_choice_typewriter(CHOICE_PROMPT,
                                                      INVALID_PROMPT,
                                                      CHOICES_MOVES)
    self.move = RPSMoveRules::STR_MOVECLASS_MAP[choice.downcase].new
  end
end

class RPSPlayerHal9000 < RPSPlayer
  def initialize
    super('Hal9000')
  end

  def choose_move
    random_range = (1..4).to_a
    random_number = random_range.sample
    choice_class = case random_number
                   when 2 then RPSMoveRules::MOVE_CLASS_SELECTION.sample
                   else
                     RPSMoveSciss
                   end

    self.move = choice_class.new
  end
end

class RPSPlayerRocks < RPSPlayer
  def initialize
    super('PlaysWithRocks')
  end

  def choose_move
    self.move = RPSMoveRock.new
  end
end

class RPSPlayerRandom < RPSPlayer
  NAME_LIST = [
    "JoeDaWin",
    "BoomBox88",
    "NokNok",
    "CrAzYwIdOw",
    "THATKid",
    "JesseTheMessy",
    "_Hal9k_"
  ]

  def initialize
    super(NAME_LIST.sample)
  end

  def choose_move
    self.move = RPSMoveRules::MOVE_CLASS_SELECTION.sample.new
  end
end
