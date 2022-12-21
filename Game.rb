require './FileHandler.rb'
require './PlayerInput.rb'

class Game
  include PlayerInput
  def initialize(load_game)
    @file_handler = FileHandler.new
    if load_game
      # must load the game first
      puts "GAME LOADING"
    else
      # create game from scratch
      puts "GAME STARTING"
      @word = @file_handler.get_word.split('')
      @letters_chosen = Array.new
      p @word
      play_game()
    end
  end

  private
  def play_game
    #input_obj = PlayerInput.new
    round_display()
    chosen_character = round_input()
    p chosen_character
  end
end
