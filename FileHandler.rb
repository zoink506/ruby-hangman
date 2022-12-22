require 'yaml'

module FileHandler
  def get_word
    desired_line = rand(0..9893)
    line_counter = 0
    random_word = ''

    reached_line = false
    IO.foreach('10000-words.txt') do |line| # does not slurp
      if line_counter >= desired_line
        if line.chomp.length >= 5 && line.chomp.length <= 12
          random_word = line.chomp
          break
        end
      end
      line_counter += 1
    end

    if random_word != ''
      random_word
    else
      'Capricious'
    end
  end

  def save_game(word, letters_correct, letters_mistakes)
    save_hash = { :word => word, :letters_correct => letters_correct, :letters_mistakes => letters_mistakes }
    #p save_hash
    savefile = File.open('savefile.yml', 'w')
    savefile.write(save_hash.to_yaml)
    savefile.close
  end

  def load_game_hash()
    savefile = File.open('savefile.yml', 'r')
    save_hash = YAML.load(savefile)
    savefile.close
    save_hash
  end
end
