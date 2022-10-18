require_relative 'colors'

class Display
  attr_reader :word, :word_values

  def initialize(word)
    @word = word
    @word_values = '_ ' * word.length
  end

  def update_values(guesses)
    @word_values = @word.chars.map do |char|
      guesses.include?(char) ? char : '_'
    end.join(' ')
  end

  def update(guesses, guesses_left, word)
    system('clear') or system('cls')
    puts word
    puts word_values
    puts "You have #{guesses_left} guesses left."
    puts 'Guess a letter:'
  end
end
