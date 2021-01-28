module GameRunner
  def generated_word(words)
    loop do
      word = words.sample
      return word if word.length.between?(5, 12)
    end
  end

  def input_word(words = [])
    loop do
      word = get_string(message: messages('word'), allowed: words)
      return word if word.length.between?(5, 12)

      puts 'Oops, your word should be between 5 and 12 characters!'
    end
  end

  def input_guess(game)
    get_guess(message: messages('guess'), allowed: game.allowed_guesses)
  end

  def refresh(game:, options: true)
    return unless game

    clear_screen
    puts messages('info') if options
    puts get_display(game.missed_guesses.length) + "\n" + game.to_s
  end

  def do_turn(game)
    refresh(game: game)
    guess = input_guess(game)
    if %w[save exit].include?(guess)
      game_over = guess
    else
      game.add_guess(guess)
      game_over = game.game_over?
    end
    game_over
  end

  def exit_game
    puts messages('bye')
    exit
  end

  def save_game(game)
    game_name = game.saved ? game.file_name : input_game_name
    game.file_name = game_name

    old_file_name = create_file_name(date: game.date_generated, name: game_name)
    game.saved = true
    new_file_name = create_file_name(date: game.date_generated, name: game_name)

    File.rename(old_file_name, new_file_name) if File.exist?(old_file_name)

    dump = YAML.dump(game)
    File.open(new_file_name, 'w') { |f| f.write(dump) }

    puts messages('saved')
  end

  def input_game_name
    get_game_name(message: messages('file'))
  end

  def create_file_name(date:, name:)
    date_str = date.to_s.gsub(':', '()')
    "saved/#{date_str}(SEP)#{name}.json"
  end

  # Dir.entries('saved').select{ |f| File.file? File.join('saved',f)}
  def parse_file_name(file_name:)
    file = file_name.gsub('(SEP)', '  ')
    file.gsub!('()', ':')
    arr = file.split('  ')
    { date: DateTime.strptime(arr[0]), name: arr[1].split('.')[0] }
  end

  def load_game
    clear_screen
    files = list_saved_games
    if files.empty?
      puts 'No files have been saved!'
      sleep 2
      return false
    end

    file_num = get_int_between(message: messages('load'), min: 1, max: files.length + 1) - 1
    return false if file_num == files.length

    YAML.load(File.read("saved/#{files[file_num]}"))
  end

  def list_saved_games
    puts create_row(['Game:', 'Last saved on:', 'Name:'])
    puts ''
    files = Dir.entries('saved').select { |f| File.file? File.join('saved', f) }.sort.reverse
    print_files(files: files) unless files.empty?
    files
  end

  def print_files(files:)
    files.each_with_index do |file, i|
      info = parse_file_name(file_name: file)
      name = info[:name]
      date = info[:date].strftime('%m/%d/%Y at %I:%M%p')
      puts create_row(["[#{i + 1}]", date, name])
    end
    puts "\n" + create_row(["[#{files.length + 1}]", 'Go Back', ''])
    puts ''
  end

  def create_row(arr)
    arr[0].ljust(9) + arr[1].ljust(27) + arr[2]
  end
end
