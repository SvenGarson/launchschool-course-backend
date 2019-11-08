class TTTInput
  def self.prompt_non_empty_string(prompt_msg, invalid_msg='')
    loop do
      print prompt_msg
      inp = gets.chomp
      break(inp) unless inp.empty?
      print invalid_msg
    end
  end
  def self.prompt_single_character(prompt_msg, invalid_msg='')
    loop do
      choice = prompt_non_empty_string(prompt_msg,
                                       "\nPlease enter a single character.")
      break(choice) if choice.length == 1
      print invalid_msg
    end
  end
end