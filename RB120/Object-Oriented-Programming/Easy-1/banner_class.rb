class Banner

  ROWS = 3
  SIDE_PADDING = 1

  def initialize(message)
    @message = message
    @columns = message.length + 2 * SIDE_PADDING
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    '+' + ('-' * @columns) + '+'
  end

  def empty_line
    '|' + (' ' * @columns) + '|'
  end

  def message_line
    "| #{@message} |"
  end
end

banner = Banner.new('To boldly go were no one has gone before.')
puts banner

banner = Banner.new('')
puts banner