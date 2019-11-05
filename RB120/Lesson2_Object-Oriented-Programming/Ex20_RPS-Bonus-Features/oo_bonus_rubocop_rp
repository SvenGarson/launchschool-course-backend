require_relative 'rps_utils.rb'
require_relative 'rps_display.rb'
require_relative 'rps_moves.rb'
require_relative 'rps_player.rb'
require_relative 'rps_history.rb'
require_relative 'rps_game.rb'

# init engine
RPSMoveRules.init
# init base game
game = RPSGame.new
# init display chain
dm = DisplayManager.new(game)
dm.register_and_set_active(DisplayWelcome.new)
dm.register(DisplayRules.new)
dm.register(DisplayScore.new)
dm.register(DisplayReady.new)
dm.register(DisplayGame.new)
dm.register(DisplayRoundResult.new)
dm.register(DisplayGoodbye.new)
# run game through display manager
until dm.done?
	dm.update
end

