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
      @display.update(@guesses, @guesses_left, @word)
      letter = @logic.ask_for_input(@guesses)
      @guesses << letter
      if @logic.check_letter(@word, letter)
        @display.update_values(@guesses)
      else
        @guesses_left -= 1
      end
    end

    system('clear') or system('cls')
    puts @display.word_values

    if @logic.check_win(@word, @guesses)
      puts 'You win!'
    else
      puts 'You lose!'
      puts "The word was: #{@word}"
    end
  end
end
