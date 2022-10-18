require_relative '../lib/logic'
require_relative '../lib/display'

class Game
  def initialize
    @logic = Logic.new
    p @word = @logic.get_word
    @display = Display.new(@word)
    @guesses = []
    @guesses_left = @word.length
  end

  def play
    until @logic.check_guesses(@guesses_left) || @logic.check_win(@word, @guesses)
      puts @display.word_display
      puts "You have #{@guesses_left} guesses left."
      puts 'Guess a letter:'
      letter = gets.chomp.downcase
      letter = gets.chomp.downcase until @logic.check_if_valid(letter, @guesses)
      @guesses << letter
      @display.update_display(letter, @guesses) if @logic.check_letter(@word, letter)
      @guesses_left -= 1 unless @logic.check_letter(@word, letter)
    end
    puts @display.word_display
    if @logic.check_win(@word, @guesses)
      puts 'You win!'
    else
      puts 'You lose!'
    end
  end
end
