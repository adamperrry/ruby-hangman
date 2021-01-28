module Input
  def messages(str)
    {
      'option' => 'Please select an option (1-4): ',
      'word' => 'Enter a valid word (refer to 5desk.txt): ',
      'guess' => 'Enter a valid guess (Case Sensitive): ',
      'win' => 'Congratulations, you win! Redirecting...',
      'lose' => 'Sorry, you lose. Better luck next time! Redirecting...',
      'bye' => 'Thanks for stopping by! Goodbye.',
      'info' => 'Enter "save" to save game, or "exit" to exit game.',
      'file' => 'Enter a name for your new game file: ',
      'saved' => 'Your game file has been saved! Redirecting...',
      'load' => "Enter the number of the game you'd like to load: "
    }[str]
  end

  def get_int_between(message:, min:, max:, zero: true)
    loop do
      print message
      int = gets.chomp.to_i
      # if zero isn't allowed, force a re-enter:
      int = min - 1 if int.zero? && !zero
      return int if int.between?(min, max)

      puts "Number must be between #{min} & #{max}, inclusive."
      puts "Zero #{'not ' unless zero}included." if (min..max).include? 0
    end
  end

  def get_string(message:, allowed: [])
    loop do
      print message
      str = gets.chomp
      return str if allowed.empty? || allowed.include?(str)

      puts "Hmm... I don't think that's allowed. Try again!"
    end
  end

  def get_game_name(message:)
    allowed = [' ', '_', '-'] + ('a'..'z').to_a + ('A'..'Z').to_a + ('0'..'9').to_a
    loop do
      print message
      str = gets.chomp.strip
      return str if (str.split('') - allowed).empty?

      puts 'Your file name includes illegal characters. Try again!'
    end
  end

  def get_guess(message:, allowed:)
    loop do
      print message
      char = gets.chomp
      return char if %w[save exit].include?(char.downcase)

      char = char[0]
      return char if allowed.include?(char)

      puts 'Woops, not a valid guess. Try again!'
    end
  end
end
