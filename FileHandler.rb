class FileHandler
  def get_word
    desired_line = rand(0..9893)
    line_counter = 0
    random_word = ''

    reached_line = false
    IO.foreach('10000-words.txt') do |line|
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

  def read_word_array(save_file)
    
  end
end