# Game class is repsonsible for storing the game state and performing a few
# functions such as:
# - Receiving the next guess via a "add_guess" method
#   - Note that the actual input should be in the main script file, since there
#     should be an option to save the game instead of giving a next guess
# - checking if the game has been won or lost via a "game_over" method (checks length of )
# - getters for missed guesses, progress, date generated

# Initialized with a word and a number of guesses (default to 9)
# Initilize also sets the date generated field

# Not responsible for actually printing itself using the Display module, will
# leave that up to the main hangman.rb script

class Game
  attr_reader :word, :progress, :date_generated, :missed_guesses, :guess_limit, :saved
  attr_accessor :file_name
  
  def initialize(word:, guess_limit: 9)
    @word = word.split('')
    @progress = Array.new(word.length, '_')
    @guess_limit = guess_limit
    @date_generated = DateTime.now
    @missed_guesses = []
    @saved = false
    @file_name = ''
  end

  def game_over?
    return 'winner' unless progress.include?('_')

    if missed_guesses.length == 9
      @progress = word
      return 'loser'
    end

    false
  end

  def add_guess(guess)
    if word.include?(guess)
      word.each_with_index do |letter, i|
        progress[i] = letter if letter == guess
      end
    else
      missed_guesses << guess
    end
  end

  def allowed_guesses
    all = ('a'..'z').to_a + ('A'..'Z').to_a
    all - (progress + missed_guesses)
  end

  def saved=(saved)
    @date_generated = DateTime.now
    @saved = saved
  end

  def to_s
    hor = "\u2550"
    vert = "\u2551"
    top_left = "\u2554"
    top_right = "\u2557"
    bottom_left = "\u255a"
    bottom_right = "\u255d"

    # just show the current progress (in a box?)
    progress_str = progress.join(' ')
    top = top_left + hor * (progress_str.length + 2) + top_right
    middle = vert + ' ' + progress_str + ' ' + vert
    bottom = bottom_left + hor * (progress_str.length + 2) + bottom_right

    # then show "Missed guesses: x, x, x, x, x"
    missed_str = "Missed guesses: #{missed_guesses.join(', ')}"

    [top, middle, bottom, missed_str].join("\n") + "\n\n"
  end
end
