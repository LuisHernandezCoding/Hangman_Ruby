require_relative '../lib/logic'
require_relative '../lib/display'
require 'yaml'
require 'fileutils'

class Game
  attr_accessor :guesses, :guesses_left, :word, :display, :logic, :difficulty, :aniumation_state, :cheat

  def initialize(difficulty, language, cheat, word = nil)
    @logic = Logic.new(language)
    @word = word.nil? ? @logic.getting_word : word
    @display = Display.new(@word, cheat)
    @guesses = []
    @guesses_left = 11
    @difficulty = difficulty
    @aniumation_state = 0
    @cheat = cheat
  end

  def play(loaded: false)
    @guesses_left = 6 if @difficulty == 'medium' && !loaded
    @guesses_left = 3 if @difficulty == 'hard' && !loaded
    next_turn
    if @logic.check_win(@word, @guesses)
      @display.update(['You win!', 'Exiting Game'], @guesses, @guesses_left, @word, 4)
      FileUtils.rm_rf('./assets/save.yml')
    elsif !@logic.check_guesses(@guesses_left)
      @display.update(['Game Saved', 'Exiting Game'], @guesses, @guesses_left, @word, 4)
    else
      @display.update(["You lose!, The word was: #{@word}", 'Exiting Game...'], @guesses, @guesses_left, @word, 11)
      FileUtils.rm_rf('./assets/save.yml')
    end
    exit
  end

  def next_turn
    until @logic.check_guesses(@guesses_left) || @logic.check_win(@word, @guesses)
      @display.update(['Input a letter to guess'], @guesses, @guesses_left, @word, @aniumation_state)
      letter = @logic.ask_for_input(@guesses)
      save_game if letter == 'save' && !@guesses.empty?

      @guesses << letter
      check_letter(letter)
    end
  end

  def check_letter(letter)
    if @logic.check_letter(@word, letter)
      @display.update_values(@guesses)
    else
      @guesses_left -= 1
      @aniumation_state += 1 if @difficulty == 'easy'
      @aniumation_state += 2 if @difficulty == 'medium'
      @aniumation_state += 3 if @difficulty == 'hard'
    end
  end

  def save_game
    File.write('./assets/save.yml', YAML.dump(self))
    @display.update(['Game Saved', 'Exiting Game'], @guesses, @guesses_left, @word, 4)
    exit
  end

  def load_game(config)
    @logic = config['logic']
    @word = config['word']
    @display = config['display']
    @guesses = config['guesses']
    @guesses_left = config['guesses_left']
    @difficulty = config['difficulty']
    @aniumation_state = config['aniumation_state']
    @cheat = config['cheat']
    play(loaded: true)
  end
end
