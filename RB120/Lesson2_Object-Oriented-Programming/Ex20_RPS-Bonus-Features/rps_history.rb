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

	def initialize
		@entry_list = Array.new
	end

	def add_entry(player_move_name, computer_move_name, winner_name)
		@entry_list << RPSHistoryEntry.new(player_move_name, computer_move_name, winner_name)
	end

	def clear
		@entry_list.clear
	end

=begin
 generalized method (format, item_array, length_array, padding)
	- give method:
		- for each index in item array:
			- stop if no more length
			- replacement = item[index]
			# resize replacement to be exactly the length
			- if replacement > length
				- but it to length from start
			- else if replacement < length
				- padd with spaced at end
			# padd the string
			- add padding based on parameter
			# replace number in string
		- return the resulting string
=end 

	def row_string_data(format, place_holder, replacements, widths, side_padding, padd_char)

		row = format.dup
		index_repl = 0
		until row.match?(place_holder) == false
			repl = replacements[index_repl]
			width = widths[index_repl]
			break if repl.nil? || width.nil?
			repl = repl.dup
			len = repl.length
			# shorten if string too long, and lengthen if too short
			if len > width
				repl = repl[0, width]
			elsif len < width
				repl = repl + (padd_char * (width - len))
			end
			# add padding to string
			padding = (padd_char * side_padding)
			repl.prepend padding
			repl << padding
			# replace key string with replacement string
			row.sub!(place_holder, repl) 
			# increment to fetch next replacement and width
			index_repl += 1
		end
		row
	end

	def print_table(player, computer, max_score)
		str_round = 'Round'
		str_move_human = "#{player.name} move"
		str_move_computer = "#{computer.name} move"
		str_winner = 'Winner'
		# compute strings
		repl_header = [str_round, str_move_human, str_move_computer, str_winner]
		# compute widths
		widths = [
								[str_round.length, @entry_list.size].max,
								[RPSMoveRules::MOVE_NAME_LENGTHS.max, str_move_human.length].max,
								[RPSMoveRules::MOVE_NAME_LENGTHS.max, str_move_computer.length].max,
								[str_winner.length, player.name.length, computer.name.length].max
						 ]
		# gen divider and header
		str_head = row_string_data("\n|#|#|#|#|", '#', repl_header, widths, TABLE_PADDING, ' ')
		str_div = row_string_data("\n+#+#+#+#+", '#', %w(- - - -), widths, TABLE_PADDING, '-')
		RPSOutput.print_typewriter str_div
		RPSOutput.print_typewriter str_head
		RPSOutput.print_typewriter str_div
		# gen and print entries
		@entry_list.each_with_index do |entry, i|
			repl_entry = [(i+1).to_s] + entry.to_a
			RPSOutput.print_typewriter("\n" + row_string_data("|#|#|#|#|", '#', repl_entry, widths, TABLE_PADDING, ' '))
		end
		RPSOutput.print_typewriter str_div
		# player scores based on table output
		table_inside_width = str_head.length - 2
		player_score_str = "\n#{player.name}: #{player.score} / #{max_score}\n#{computer.name}: #{computer.score} / #{max_score}".center(str_div.length)
		RPSOutput.print_typewriter player_score_str
	end
end