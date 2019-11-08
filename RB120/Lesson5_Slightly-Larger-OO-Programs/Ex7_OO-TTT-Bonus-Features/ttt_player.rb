class TTTPlayer

  private

  attr_writer :name, :marker, :score

  public

  attr_reader :name, :marker, :score

  def initialize
    reset_score
    choose_name
    choose_marker
  end

  def choose_name; end
  def choose_marker; end
  def choose_cell(board); end

  def reset_score
    self.score = 0
  end

  def increment_score
    self.score += 1
  end

end

class TTTPlayerHuman < TTTPlayer
  def choose_name
    self.name = TTTInput.prompt_non_empty_string(
                  "\nChoose your nickname: ",
                  "\nNickname cannot be empty."
                )
  end

  def choose_marker
    self.marker = TTTInput.prompt_single_character(
                    "\nChoose a single printing character as marker: ",
                    "\nChoose one character only.")
  end
  
  def choose_cell(board)
    
  end
end

class TTTPlayerComputer < TTTPlayer
  COMP_NAMES = %w(Kelvin NokNok User255 GabenHimself FunnyNoodle68).freeze
  COMP_MARKERS = %w(O X C).freeze

  private

  attr_accessor :forbidden_markers

  public

  def initialize(forbidden_markers)
    self.forbidden_markers = forbidden_markers
    super()
  end

  def choose_name
    self.name = COMP_NAMES.sample
  end

  def choose_marker
    self.marker = (COMP_MARKERS - forbidden_markers).first
  end
  
  def choose_cell(board)
    
  end
end