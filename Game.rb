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
      @word = @file_handler.get_word.split('')
      #@word = ['t', 'a', 's', 't', 'e']
      @letters_correct = Array.new
      @letters_mistakes = Array.new
      #p @word
      play_game()
    end
  end

  private
  def play_game
    system("clear") || system("cls")
    puts "\nGAME STARTED!\nTo save your game, type 'save' at any time. To exit the game, type 'exit' at any time.\n\n"

    while !check_word_complete(@word, @letters_correct)
      round_display()
      show_feedback(@word, @letters_correct, @letters_mistakes)
      chosen_character = round_input(@letters_correct + @letters_mistakes) # player cannot type a character from the mistakes or correct list

      case chosen_character
      when 'exit'
        break
      when 'save'
        @file_handler.save_game(@word, @letters_correct, @letters_mistakes)
        puts "Game Saved.\n"
      else
        if @word.include?(chosen_character) 
          @letters_correct << chosen_character
        else
          @letters_mistakes << chosen_character
        end

        break if @letters_mistakes.length >= 7
      end
      
    end

    show_feedback(@word, @letters_correct, @letters_mistakes)
    if check_word_complete(@word, @letters_correct)
      puts "YOU WIN!"
    else
      puts "YOU LOSE!"
      puts "The word was: #{@word.join('')}"
    end


  end

  def check_word_complete(word, letters_chosen)
    # Check if the arrays are equal
    #p "letters_chosen: #{letters_chosen.uniq.sort}"
    #p "word: #{word.uniq.sort}"
    return true if letters_chosen.uniq.sort == word.uniq.sort
    false
  end
end
