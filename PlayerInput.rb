module PlayerInput
  public
  def round_input(letters_chosen)
    print ' '
    input = gets.chomp()
    input_valid = validate_round_input(input, letters_chosen)
    input = round_input(letters_chosen) if !input_valid
    return input
  end

  def round_display
    puts " Enter a letter: "
  end

  def menu_input
    print ' '
    input = gets.chomp()
    input_valid = validate_menu_input?(input)
    input = menu_input() if !input_valid
    return input
  end

  def show_feedback(word_array, letters_chosen, letters_mistakes)
    print ' '
    word_array.each do |char|
      if letters_chosen.include?(char)
        # show the letter
        print "#{char} "
      else
        # show an underscore_
        print "_ "
      end
    end

    print "      Mistakes: "
    letters_mistakes.each { |mistake| print "#{mistake} " }
    print "\n\n"

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

  def validate_round_input(input, letters_chosen)
    # check that input is between a-z/A-Z

    return true if input == 'save'
    return true if input == 'exit'
    if input.length == 1
      return true if (input.ord >= 97 && input.ord <= 122) && !letters_chosen.include?(input)
    end
    false
  end
end
