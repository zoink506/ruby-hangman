require './Game.rb'
require './PlayerInput.rb'

class Menu
  include PlayerInput
  def initialize
    menu()
  end

  private
  def menu()
    print_menu()
    player_input = menu_input()
    if player_input == '1' # Start a new game from scratch
      Game.new(false)
    elsif player_input == '2' # Start a new game, loading from a file
      Game.new(true)
    end
  end

  def print_menu
    puts "Welcome to Hangman"
    puts "To create a new game, type 1\nTo load a saved game, type 2"
  end
end