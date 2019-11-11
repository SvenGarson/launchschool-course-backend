class TTTInput
  CHOICES_YES_NO = %w(yes no y n).freeze

  def self.prompt_non_empty_string(prompt_msg, invalid_msg = '')
    loop do
      print prompt_msg
      inp = gets.chomp
      break(inp) unless inp.empty?
      print invalid_msg
    end
  end

  def self.prompt_single_character(prompt_msg, invalid_msg = '', forbidden)
    loop do
      choice = prompt_non_empty_string(prompt_msg,
                                       "\nPlease enter a single character.")
      break(choice) if choice.length == 1 && forbidden.include?(choice) == false
      print invalid_msg
    end
  end

  def self.prompt_options(prompt_msg, invalid_msg = '', options)
    loop do
      choice = prompt_non_empty_string(prompt_msg,
                                       'Please enter something.')
      break(choice) if options.include?(choice)
      print invalid_msg
    end
  end

  def self.prompt_positive_number(prompt_msg, invalid_msg='')
    loop do
      print prompt_msg
      choice = gets.chomp
      choice_int = choice.to_i
      break(choice_int) if (choice_int.to_s) == choice && choice_int > 0
      print invalid_msg
    end
  end

  def self.prompt_yes_no?(prompt_msg, invalid_msg='')
    option_str = TTTStringGen.joinor(CHOICES_YES_NO, ', ', 'or')
    choice = nil
    loop do
      print prompt_msg
      choice = gets.chomp.downcase
      break if CHOICES_YES_NO.include?(choice)
      print "#{invalid_msg}#{option_str}"
    end
    choice.start_with? 'y'
  end
end

class TTTStringGen
  def self.joinor(list, div=', ', end_div='or')
    case list.length
    when 0, 1
      list.join
    when 2
      list.join(" #{end_div} ")
    else
      list[0..-2].join(div) + "#{div}#{end_div} #{list[-1]}"
    end
  end

  def self.expand_to_length(base, other)
    longest = [base, other].sort_by(&:length).last
    base + (' ' * (longest.length - base.length))
  end
end

class TTTOutput
  def self.clear
    system('clear') || system('cls')
  end

  def self.think_and_wait(name, think_str, wait_seconds)
    print "\n(#{name}) #{think_str}: "
    3.times do |_|
      print '.'
      sleep wait_seconds
    end
  end
end
