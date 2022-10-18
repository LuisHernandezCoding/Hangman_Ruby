require_relative '../lib/logic'
require_relative '../lib/display'

class Game
  def initialize(difficulty = 'easy')
    @logic = Logic.new('spanish')
    @word = @logic.getting_word
    @display = Display.new(@word)
    @guesses = []
    @guesses_left = 11
    @difficulty = difficulty
    @aniumation_state = 0
  end

  def play
    @guesses_left = 11 if @difficulty == 'easy'
    @guesses_left = 6 if @difficulty == 'medium'
    @guesses_left = 3 if @difficulty == 'hard'
    until @logic.check_guesses(@guesses_left) || @logic.check_win(@word, @guesses)
      @display.update('Input a letter to guess', @guesses, @guesses_left, @word, @aniumation_state)
      letter = @logic.ask_for_input(@guesses)
      @guesses << letter
      if @logic.check_letter(@word, letter)
        @display.update_values(@guesses)
      else
        @guesses_left -= 1
        @aniumation_state += 1 if @difficulty == 'easy'
        @aniumation_state += 2 if @difficulty == 'medium'
        @aniumation_state += 3 if @difficulty == 'hard'
      end
    end

    if @logic.check_win(@word, @guesses)
      @display.update('You win!', @guesses, @guesses_left, @word, 4)
    else
      @display.update("You lose!, The word was: #{@word}", @guesses, @guesses_left, @word, 11)
    end
  end
end
