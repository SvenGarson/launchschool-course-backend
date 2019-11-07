class RPSMove
  include Comparable

  private

  attr_writer :type

  public

  attr_reader :type

  def initialize(type)
    self.type = type
  end

  def <=>(other_move)
    RPSMoveRules.rule_comparison_result(type,
                                        other_move.type)
  end

  def to_s
    type.to_s.capitalize
  end
end

class RPSMoveRock < RPSMove
  def initialize
    super(RPSMoveRules::ROCK)
  end
end

class RPSMovePaper < RPSMove
  def initialize
    super(RPSMoveRules::PAPER)
  end
end

class RPSMoveSciss < RPSMove
  def initialize
    super(RPSMoveRules::SCISS)
  end
end

class RPSMoveLizard < RPSMove
  def initialize
    super(RPSMoveRules::LIZARD)
  end
end

class RPSMoveSpock < RPSMove
  def initialize
    super(RPSMoveRules::SPOCK)
  end
end

class RPSMoveRules
  ROCK = :rock
  PAPER = :paper
  SCISS = :scissors
  LIZARD = :lizard
  SPOCK = :spock

  STR_MOVECLASS_MAP = {
    'rock' => RPSMoveRock,
    'r' => RPSMoveRock,
    'paper' => RPSMovePaper,
    'p' => RPSMovePaper,
    'scissors' => RPSMoveSciss,
    's' => RPSMoveSciss,
    'lizard' => RPSMoveLizard,
    'l' => RPSMoveLizard,
    'spock' => RPSMoveSpock,
    'sp' => RPSMoveSpock
  }

  MOVE_STR_SELECTION = STR_MOVECLASS_MAP.keys +
                       STR_MOVECLASS_MAP.keys.map(&:capitalize)
  MOVE_CLASS_SELECTION = STR_MOVECLASS_MAP.values.uniq.freeze
  MOVE_NAME_LENGTHS = MOVE_CLASS_SELECTION.map do |move_cls|
    move_cls.new.to_s.length
  end.freeze
  MOVE_MAX_NAME_LENGTH = MOVE_NAME_LENGTHS.max

  @@rule_map = Hash.new

  # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
  def self.init
    add_rule(ROCK, ROCK, 0)
    add_rule(ROCK, PAPER, -1)
    add_rule(ROCK, SCISS, 1)
    add_rule(ROCK, LIZARD, 1)
    add_rule(ROCK, SPOCK, -1)

    add_rule(PAPER, ROCK, 1)
    add_rule(PAPER, PAPER, 0)
    add_rule(PAPER, SCISS, -1)
    add_rule(PAPER, LIZARD, -1)
    add_rule(PAPER, SPOCK, 1)

    add_rule(SCISS, ROCK, -1)
    add_rule(SCISS, PAPER, 1)
    add_rule(SCISS, SCISS, 0)
    add_rule(SCISS, LIZARD, 1)
    add_rule(SCISS, SPOCK, -1)

    add_rule(LIZARD, ROCK, -1)
    add_rule(LIZARD, PAPER, 1)
    add_rule(LIZARD, SCISS, -1)
    add_rule(LIZARD, LIZARD, 0)
    add_rule(LIZARD, SPOCK, 1)

    add_rule(SPOCK, ROCK, 1)
    add_rule(SPOCK, PAPER, -1)
    add_rule(SPOCK, SCISS, 1)
    add_rule(SPOCK, LIZARD, -1)
    add_rule(SPOCK, SPOCK, 0)
  end
  # rubocop:enable Metrics/AbcSize, Metrics/MethodLength

  def self.add_rule(move_type_a, move_type_b, result)
    rules = @@rule_map
    if rules
      unless rules.key?(move_type_a)
        rules[move_type_a] = Hash.new
      end
      rules[move_type_a][move_type_b] = result
    else
      RPSOutput.error('Rulemap is not initialized', self)
    end
  end

  def self.rule_comparison_result(move_type_a, move_type_b)
    rules = @@rule_map
    if rules.key?(move_type_a) && rules[move_type_a].key?(move_type_b)
      rules[move_type_a][move_type_b]
    else
      err_msg = "No rule found for move comparison between \
#{move_type_a} and #{move_type_b}"
      RPSOutput.error(err_msg, self)
      RPSOutput.error("Returning comparison result '0'", self)
      0
    end
  end
end
