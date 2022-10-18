require_relative '../lib/logic'
require_relative '../lib/display'

class Game
  def initialize
    @logic = Logic.new('spanish')
    @word = @logic.getting_word
    @display = Display.new(@word)
    @guesses = []
    @guesses_left = @word.length
  end

  def play
    until @logic.check_guesses(@guesses_left) || @logic.check_win(@word, @guesses)
      @display.update('Input a letter to guess', @guesses, @guesses_left, @word)
      letter = @logic.ask_for_input(@guesses)
      @guesses << letter
      if @logic.check_letter(@word, letter)
        @display.update_values(@guesses)
      else
        @guesses_left -= 1
      end
    end

    if @logic.check_win(@word, @guesses)
      @display.update('You win!', @guesses, @guesses_left, @word)
    else
      @display.update("You lose!, The word was: #{@word}", @guesses, @guesses_left, @word)
    end
  end
end
