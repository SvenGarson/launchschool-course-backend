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
		  self.print char
			RPSTiming.wait_seconds(@@typewriter_delay)
		end
	end	

  def self.clear
    Kernel.system('clear') || Kernel.system('cls')
  end

  def self.error(str, err_self)
    self.print "==> Error: '#{str}' in self: '#{err_self}'\n"
  end
end

class RPSInput

	private

	def self.prompt_input_typewriter(prompt_msg)
		RPSOutput.print_typewriter(prompt_msg)
		gets.chomp
	end

	public

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
			inp = prompt_input_typewriter(prompt_msg)
			inp_int  = inp.to_i
			break(inp_int) if (inp_int.to_s) == inp && inp_int > 0 
			RPSOutput.print_typewriter(invalid_msg)
		end
	end

	def self.prompt_listed_choice_typewriter(prompt_msg, invalid_msg, choices_strarr)
	  loop do
			inp = prompt_input_typewriter(prompt_msg)
			break(inp) if choices_strarr.include? inp
			choices_readable = choices_strarr[0..-2].join(', ') + ' or ' + choices_strarr[-1]
			RPSOutput.print_typewriter(invalid_msg + ' ' + choices_readable + '.')
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
