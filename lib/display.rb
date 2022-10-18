class Display
  attr_reader :word, :word_display
  def initialize(word)
    @word = word
    @word_display = " _ " * word.length
  end

  def update_display(letter, guesses)
    @word_display = @word.split('').map do |char|
      guesses.include?(char) ? char : '_'
    end.join(' ')
  end
end