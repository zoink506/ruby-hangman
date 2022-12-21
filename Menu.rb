require './Game.rb'

class Menu
  def initialize
    menu()
  end

  private
  def menu()
    print_menu()
    player_input = get_input()
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

  def get_input()
    input = gets.chomp()
    input_valid = validate_input?(input)
    input = get_input() if !input_valid
    return input
  end

  def validate_input?(input)
    # Returns true if input is between 1 and 2
    # Returns false if it is not
    return false if input.to_i == 0
    return true if num_between(input.to_i, 1, 2)
    false
  end

  def num_between(value, min, max)
    return true if value >= min && value <= max
    false
  end
end