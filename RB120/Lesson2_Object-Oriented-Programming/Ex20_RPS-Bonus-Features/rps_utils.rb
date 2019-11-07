class RPSTiming
  def self.wait_seconds(seconds)
    sleep(seconds)
  end
end

class RPSOutput
  @@typewriter_delay = 0.005

  def self.typewriter_delay=(new_delay)
    @@typewriter_delay = new_delay.abs
  end

  def self.print(str)
    Kernel.print str
  end

  def self.print_typewriter(str)
    str.each_char do |char|
      RPSOutput.print char
      RPSTiming.wait_seconds(@@typewriter_delay)
    end
  end

  def self.clear
    Kernel.system('clear') || Kernel.system('cls')
  end

  def self.error(str, err_self)
    RPSOutput.print "==> Error: '#{str}' in self: '#{err_self}'\n"
  end
end

class RPSInput
  def self.prompt_input_typewriter(prompt_msg)
    RPSOutput.print_typewriter(prompt_msg)
    gets.chomp
  end

  def self.prompt_any(prompt_msg)
    prompt_input_typewriter(prompt_msg)
  end

  def self.prompt_non_empty_string_typewriter(prompt_msg, invalid_msg)
    loop do
      inp = prompt_input_typewriter(prompt_msg)
      break(inp) unless inp.empty?
      RPSOutput.print_typewriter(invalid_msg)
    end
  end

  def self.prompt_empty_string_typewriter(prompt_msg, invalid_msg)
    loop do
      inp = prompt_input_typewriter(prompt_msg)
      break(inp) if inp.empty?
      RPSOutput.print_typewriter(invalid_msg)
    end
  end

  def self.prompt_positive_number_typewriter(prompt_msg, invalid_msg)
    loop do
      inp_str = prompt_input_typewriter(prompt_msg)
      inp_int = inp_str.to_i
      break(inp_int) if (inp_int.to_s) == inp_str && inp_int > 0
      RPSOutput.print_typewriter(invalid_msg)
    end
  end

  def self.prompt_listed_choice_typewriter(prompt_msg, invalid_msg, choices)
    loop do
      inp = prompt_input_typewriter(prompt_msg)
      break(inp) if choices.include?(inp)
      RPSOutput.print_typewriter(invalid_msg)
    end
  end

  def self.prompt_yes_no_yn_typewriter?(prompt_msg, invalid_msg)
    inp = nil
    loop do
      inp = prompt_input_typewriter(prompt_msg)
      break if %w(yes no y n).include? inp
      RPSOutput.print_typewriter(invalid_msg)
    end
    inp.start_with?('y') ? true : false
  end
end

class RPSStringGen
  # rubocop:disable Metrics/ParameterLists, Metrics/LineLength
  def self.format_inject(format, placeholder, replacements, widths, padding, padd_char)
    row = format.dup

    index_repl = 0
    until row.match?(placeholder) == false
      repl = replacements[index_repl]
      width = widths[index_repl]
      break if repl.nil? || width.nil?

      # shorten if string too long, and lengthen if too short
      repl = string_force_width(repl, width, padd_char)

      # add padding to string
      repl = string_padd_lead_and_trail(repl, padding, padd_char)

      row.sub!(placeholder, repl)

      index_repl += 1
    end
    row
  end
  # rubocop:enable Metrics/ParameterLists, Metrics/LineLength

  def self.string_padd_lead_and_trail(str, padding, padd_char)
    padding = (padd_char * padding)
    padding + str + padding
  end

  def self.string_force_width(str, width, padd_char)
    len = str.length
    if len > width
      str[0, width]
    elsif len < width
      str + (padd_char * (width - len))
    else
      str.dup
    end
  end
end
