class RPSHistoryEntry
  private

  attr_writer :player_move_name, :computer_move_name, :winner_name

  public

  attr_reader :player_move_name, :computer_move_name, :winner_name

  def initialize(player_move_name, computer_move_name, winner_name)
    self.player_move_name = player_move_name
    self.computer_move_name = computer_move_name
    self.winner_name = winner_name
  end

  def to_a
    [player_move_name, computer_move_name, winner_name]
  end
end

class RPSHistory
  TABLE_PADDING = 2

  private

  attr_reader :entry_list

  public

  def initialize
    @entry_list = Array.new
  end

  def add_entry(player_move_name, computer_move_name, winner_name)
    @entry_list << RPSHistoryEntry.new(player_move_name,
                                       computer_move_name,
                                       winner_name)
  end

  def clear
    @entry_list.clear
  end

  # rubocop:disable Metrics/ParameterLists, Metrics/LineLength
  def compute_column_widths_for(player, computer, str_round, str_mhuman, str_mcomp, str_winner)
    [
      [str_round.length, @entry_list.size].max,
      [RPSMoveRules::MOVE_NAME_LENGTHS.max, str_mhuman.length].max,
      [RPSMoveRules::MOVE_NAME_LENGTHS.max, str_mcomp.length].max,
      [str_winner.length, player.name.length, computer.name.length].max
    ]
  end
  # rubocop:enable Metrics/ParameterLists, Metrics/LineLength

  def print_table(human, computer)
    # precompute table size
    str_round = 'Round'
    str_move_human = "#{human.name} move"
    str_move_comp = "#{computer.name} move"
    str_winner = 'Winner'
    widths = compute_column_widths_for(human, computer, str_round,
                                       str_move_human, str_move_comp,
                                       str_winner)

    print_divider(widths)
    print_header(widths, [str_round, str_move_human, str_move_comp, str_winner])
    print_divider(widths)

    print_entries(widths)

    print_divider(widths)
  end

  private

  def print_entries(widths)
    @entry_list.each_with_index do |entry, i|
      repl_entry = [(i + 1).to_s] + entry.to_a
      row_str = RPSStringGen.format_inject("\n" + "|#|#|#|#|", '#', repl_entry,
                                           widths, TABLE_PADDING, ' ')
      RPSOutput.print_typewriter(row_str)
    end
  end

  def print_divider(widths)
    str_div = RPSStringGen.format_inject("\n" + "+#+#+#+#+",
                                         '#',
                                         %w(- - - -),
                                         widths,
                                         TABLE_PADDING,
                                         '-')
    RPSOutput.print_typewriter(str_div)
  end

  def print_header(widths, repl_header)
    str_head = RPSStringGen.format_inject("\n" + "|#|#|#|#|",
                                          '#',
                                          repl_header,
                                          widths,
                                          TABLE_PADDING,
                                          ' ')
    RPSOutput.print_typewriter(str_head)
  end
end
