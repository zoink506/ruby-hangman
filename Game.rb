require './FileHandler.rb'
require './PlayerInput.rb'

class Game
  include FileHandler
  include PlayerInput
  def initialize(load_game, word = nil, letters_correct = nil, letters_mistakes = nil)
    if load_game
      # must load the game first
      @word = word
      @letters_correct = letters_correct
      @letters_mistakes = letters_mistakes
      play_game()
    else
      # create game from scratch
      @word = get_word().split('')
      @letters_correct = Array.new
      @letters_mistakes = Array.new
      play_game()
    end
  end

  private
  def play_game
    system("clear") || system("cls")
    puts "\n GAME STARTED!\n To save your game, type 'save' at any time. To exit the game, type 'exit' at any time.\n\n"
    show_feedback(@word, @letters_correct, @letters_mistakes)

    while !check_word_complete(@word, @letters_correct)
      round_display()
      chosen_character = round_input(@letters_correct + @letters_mistakes) # player cannot type a character from the mistakes or correct list

      case chosen_character
      when 'exit'
        break
      when 'save'
        save_game(@word, @letters_correct, @letters_mistakes)
        puts " Game Saved.\n\n"
      else
        if @word.include?(chosen_character) 
          @letters_correct << chosen_character
          show_feedback(@word, @letters_correct, @letters_mistakes)
        else
          @letters_mistakes << chosen_character
          show_feedback(@word, @letters_correct, @letters_mistakes)
        end

        break if @letters_mistakes.length >= 7
      end
      
    end

    puts "\n GAME OVER"
    # Only show the word if the game has been won or lost, not when exiting with 'exit' command
    puts " The word was: #{@word.join('')}" if check_word_complete(@word, @letters_correct) == true || @letters_mistakes.length >= 7


  end

  def check_word_complete(word, letters_chosen)
    # Check if the arrays are equal
    return true if letters_chosen.uniq.sort == word.uniq.sort
    false
  end
end
