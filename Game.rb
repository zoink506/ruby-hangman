require './FileHandler.rb'
require './PlayerInput.rb'

class Game
  def initialize(load_game)
    file_handler = FileHandler.new
    if load_game
      # must load the game first
      puts "GAME LOADING"
    else
      # create game from scratch
      puts "GAME STARTING"
      p file_handler.get_word
    end
  end

end
