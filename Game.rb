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
    guesses = 0
    mistakes = 0

    while @letters_chosen.length <= 7 # CHANGE THIS TO TRACK AMOUNT OF MISTAKES MADE AND IF WORD HASNT BEEN GUESSED YET
      #input_obj = PlayerInput.new
      round_display()
      chosen_character = round_input(@letters_chosen)

      @letters_chosen << chosen_character if !@letters_chosen.include?(chosen_character)

      show_feedback(@word, @letters_chosen)
      p @letters_chosen
    end
  end

  def check_word_complete(word, letters_chosen)

  end
end
