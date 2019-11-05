class Display
  
  def init(game); end
  def update(game); end
  def dealloc(game); end
end

class DisplayManager

  private
  attr_accessor :game, :display_map, :current_display, :needs_init, :done
  public

		def initialize(game)
		self.game = game
    self.display_map = Hash.new
    self.current_display = nil
    self.needs_init = true
		self.done = false
		end

  def register(display)
    display_map[display.class] = display
  end

  def register_and_set_active(display)
    register(display)
    self.current_display = display
  end

  def update
    curr = current_display
    if curr
      curr.init(game) if needs_init
      self.needs_init = false
      result = curr.update(game)
			# if returns nil, display manager is done
			# and external loop should stop updating
			if result.nil?
				self.done = true
			else
      	switch_to(result) if result != curr.class
			end
    else
      RPSOutput.error('Current display is nil or false', self)
    end
  end

  def switch_to(new_display_class)
    # error if displaymap does not contain that clas and instance
    if display_map.key?(new_display_class)
      current_display.dealloc(game)
      self.current_display = display_map[new_display_class]
      self.needs_init = true
    else
      RPSOutput.error("No display instance for '#{new_display_class}' in display_map", self)
    end
  end
	
	def done?
		done
	end
end

class DisplayWelcome < Display
    
	def init(game)
		RPSOutput.clear
		RPSOutput.typewriter_delay = 0.005
	end

  def update(game)
    RPSOutput.print_typewriter("Welcome to Rock, Paper, Scissors, Lizard & Spock!\n")
		RPSTiming.wait_seconds(1.0)
		choice_name = RPSInput.prompt_non_empty_string_typewriter("\nChoose a nickname: ",
																									 "\nNothing is not a suitable nickname.")
		game.player_human = RPSPlayerHuman.new(choice_name)

		DisplayRules
	end
end

class DisplayRules < Display

	RULE_STR = ["\nFirst, you choose the winning score you and the computer will play to.",
							"\nThen both you and the computer will choose their move.",
							"\nEvery round, the winner is granted one point. In case of a tie, nobody",
							"\nwill score.",
							"\n\nThe first player to reach the winning score, wins the game. Easy."].join.freeze
	
	TIP_STR = "Your opponent's name could give you a hint about her/his tendencies!"

	def init(game)
		RPSOutput.clear
		RPSOutput.typewriter_delay = 0.005
	end

	def update(game)
		RPSOutput.print_typewriter("\nHello #{game.player_human.name}, these are the rules.")
		RPSOutput.print_typewriter("\n" + RULE_STR)
		RPSOutput.print_typewriter("\n\nPro-tip: ")
		RPSTiming.wait_seconds(1.25)
		RPSOutput.print_typewriter(TIP_STR)
		RPSTiming.wait_seconds(1)
		RPSInput.prompt_any("\n(Hit enter to continue)")
		
		DisplayScore
	end
end

class DisplayScore < Display
	
	def init(game)
		RPSOutput.clear
		game.reset
		RPSOutput.typewriter_delay = 0.005
	end

	def update(game)
		choice_win_score = RPSInput.prompt_positive_number_typewriter("\nEnter desired winning score: ",
																																	"\nPlease enter a positive winning score.")
		game.max_score = choice_win_score

		DisplayReady
	end
end

class DisplayReady < Display
	
	def init(game)
		RPSOutput.clear
		RPSOutput.typewriter_delay = 0.005
	end

	def update(game)
		RPSOutput.print_typewriter("\nAlright #{game.player_human.name}, first player to reach")
		RPSOutput.print_typewriter("\na score of #{game.max_score} wins.")
		
		# choose random opponent
		ai_class_list = [RPSPlayerHal9000, RPSPlayerRocks, RPSPlayerRandom]
		game.player_computer = ai_class_list.sample.new
		
		RPSOutput.print_typewriter("\nYour opponent is #{game.player_computer.name}.")
		RPSTiming.wait_seconds(2)
		RPSOutput.print_typewriter("\n\nGame starts whenever you are ready!")
		RPSInput.prompt_any("\n(Hit enter to continue)")

		DisplayGame
	end
end

class DisplayGame < Display
	
	def init(game)
		RPSOutput.clear
	end

	def update(game)
		RPSOutput.typewriter_delay = 0.0005
		game.print_history
		RPSOutput.typewriter_delay = 0.005
		
		# player turn
		game.player_human.choose_move
		
		# computer turn
		RPSOutput.print_typewriter("\n#{game.player_computer.name}, choose your move: ")
		RPSTiming.wait_seconds(1)
		game.player_computer.choose_move
		RPSOutput.print_typewriter(game.player_computer.move.to_s)
		RPSTiming.wait_seconds(1)		

		# run game logic
		game.tick

		DisplayRoundResult
	end
end

class DisplayRoundResult < Display
	
	def update(game)		
		# output round winner
		RPSOutput.print_typewriter("\n\n#{game.round_winner_msg}")

		# if a player reached the winning score, go to game over screen
		# if not, keep ticking the game
		if game.game_winner?
			RPSTiming.wait_seconds(1)
			RPSOutput.print_typewriter("\n\n#{game.game_winner_msg}")
			play_another = RPSInput.prompt_yes_no_yn_typewriter?("\n\nDo you want to play another game? (y/n): ",
																													 "\nPlease enter y, n, yes or no.")
			(play_another) ? DisplayScore : DisplayGoodbye
		else
			RPSInput.prompt_any("\n(Hit enter to continue)")
			DisplayGame
		end
	end
end

class DisplayGoodbye < Display
	
	def init(game)
		RPSOutput.clear
	end

	def update(game)
		RPSOutput.print_typewriter("<3 Thank you for playing Rock, Paper, Scissors, Lizard & Spock <3\n")

		nil
	end
end

