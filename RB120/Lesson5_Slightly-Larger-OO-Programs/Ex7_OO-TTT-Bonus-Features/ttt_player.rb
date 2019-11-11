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
      "\nChoose a single printing character as marker(not space!): ",
      "\nChoose one character only, and no space!.",
      [' ']
    )
  end

  def choose_cell(board)
    free_cells_i = board.unmarked_cells
    free_cells_readable = TTTStringGen.joinor(free_cells_i)
    cell_choice = nil
    loop do
      cell_choice = TTTInput.prompt_positive_number(
        "\nChoose #{free_cells_readable}: ",
        "\nPlease enter a positive cell number."
      )
      break if free_cells_i.include?(cell_choice)
      puts "\n#{cell_choice} is not a valid cell."
    end
    board[cell_choice] = marker
  end
end

class TTTPlayerComputer < TTTPlayer
  COMP_NAMES = %w(Kelvin NokNok User255 GabenHimself FunnyNoodle68).freeze
  THINK_SENTENCES = [
    'What about', 'Hmmm, let me think', 'Ummmm',
    "I think I'm going with"
  ]
  COMP_MARKERS = %w(O X C).freeze

  private

  attr_accessor :forbidden_marker

  public

  def initialize(forbidden_marker)
    self.forbidden_marker = forbidden_marker
    super()
  end

  def choose_name
    self.name = COMP_NAMES.sample
  end

  def choose_marker
    self.marker = (COMP_MARKERS - [forbidden_marker]).first
  end

  def choose_cell(board)
    if board.more_than_one_unmarked?
      TTTOutput.think_and_wait(name, THINK_SENTENCES.sample, 0.6)
    end

    choice = if board.winning_cell_for?(marker)
               board.winning_cell_number_for(marker)
             elsif board.defense_cell_for?(marker)
               board.defense_cell_number_for(marker)
             elsif board.center_free?
               5
             else
               board.unmarked_cells.sample
             end

    board[choice] = marker
  end
end
