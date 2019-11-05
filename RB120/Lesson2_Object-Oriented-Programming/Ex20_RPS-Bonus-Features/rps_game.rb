class RPSGame

	private
	attr_accessor :current_round, :winner_round, :winner_game, :winner, :history
	public
	attr_accessor :max_score, :player_human, :player_computer

	def initialize
		self.current_round = 0
		self.max_score = 0
		self.winner_round = false
		self.winner_game = false
		self.winner = nil
		self.history = RPSHistory.new
	end

	def tick
		
		human = player_human
		computer = player_computer

		# check for round winner
		if human.move > computer.move
			self.winner = human
		elsif human.move < computer.move
			self.winner = computer
		else
			self.winner = nil
		end

		# keeping score
		if winner
			winner.increment_score
			self.winner_round = true
		else
			self.winner_round = false
		end
		
		# check for game winner
		if winner_round && winner.score >= max_score
			self.winner_game = true
		else
			self.winner_game = false
		end

		# record to history
		history_winner_msg = (winner_round) ? winner.name : 'Tie'
		history.add_entry(human.move.to_s.capitalize,
											computer.move.to_s.capitalize,
											history_winner_msg)
		
		# round numbers for clean history output
		self.current_round = current_round + 1
	end

	def round_winner?
		winner_round
	end

	def game_winner?
		winner_game
	end

	def round_winner_msg
		round_winner? ? "#{winner.name} wins the round!" : "It's a tie!"
	end

	def game_winner_msg
		"#{winner.name} wins the game!"
	end

	def reset
		history.clear
		player_human.zero_score unless player_human.nil?
		player_computer.zero_score unless player_computer.nil?
		self.current_round = 0
	end

	def print_history
		history.print_table(player_human, player_computer, max_score)
	end

end