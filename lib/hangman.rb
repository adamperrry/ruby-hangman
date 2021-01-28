require_relative 'display.rb'
require_relative 'input.rb'
require_relative 'game.rb'
require_relative 'game_runner.rb'
require 'date'
require 'yaml'

include Display
include Input
include GameRunner

# Script starts here!
loop do
  clear_screen
  puts title
  option = get_int_between(message: messages('option'), min: 1, max: 4)

  words = File.readlines('5desk.txt', chomp: true)

  case option
  when 1
    game = Game.new(word: generated_word(words))
  when 2
    game = Game.new(word: input_word(words))
  when 3
    game = load_game
    game_over = 'back' unless game
  when 4
    exit_game
  end

  game_over = do_turn(game) until game_over

  refresh(game: game, options: false)
  case game_over
  when 'winner'
    # refresh(game: game, options: false)
    puts messages('win')
    sleep 3
  when 'loser'
    # refresh(game: game, options: false)
    puts messages('lose')
    sleep 4
  when 'exit'
    exit_game
  when 'save'
    # refresh(game: game, options: false)
    save_game(game)
    sleep 2
  end
end
