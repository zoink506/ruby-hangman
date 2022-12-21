module PlayerInput
  public
  def round_input
    input = gets.chomp()
    input_valid = validate_round_input(input)
    input = round_input() if !input_valid
    return input
  end

  def round_display
    puts 'Type a single letter to choose: '
  end

  def menu_input
    input = gets.chomp()
    input_valid = validate_menu_input?(input)
    input = menu_input() if !input_valid
    return input
  end

  private
  def validate_menu_input?(input)
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

  def validate_round_input(input)
    # check that input is between a-z/A-Z
    if input.length == 1
      return true if (input.ord >= 65 && input.ord <= 90) || (input.ord >= 97 && input.ord <= 122)
    end
    false
  end
end
