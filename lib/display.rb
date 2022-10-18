require_relative 'colors'
require_relative 'console_printer'

class Display
  include ConsolePrinter
  attr_reader :word, :word_values
  attr_accessor :show_instructions

  def initialize(word)
    @word = word
    @word_values = '_ ' * word.length
    @show_instructions = false
    @cheat = false
  end

  def update_values(guesses)
    @word_values = @word.chars.map do |char|
      guesses.include?(char) ? char : '_'
    end.join(' ')
  end

  def update( message, guesses, guesses_left, word)
    system('clear') or system('cls')
    print_message(['Hangman Game', 'By: @LuisHernandezCoding'], 100, 'bg_white', 'bg_black', use_symbol: true)
    print_message([message, "Guesses left: #{guesses_left}"], 100, 'bg_dark gray', 'bg_black')

    print_instructions if @show_instructions
    print_args = ["Guesses: #{guesses.join(', ')}", @word_values]
    print_args[2] = @cheat ? "CHEATING: #{word}" : nil
    print_message(print_args, 100, 'bg_black', 'bg_red', use_symbol: true)
  end

  def print_instructions
    instructions_text = []
    instructions_text[0] = 'Instructions'
    instructions_text[1] = 'The computer will choose a word at random'
    instructions_text[2] = 'You will have to guess the word by guessing one letter at a time'
    instructions_text[3] = 'If you guess a letter that is in the word it will show you where it is'
    instructions_text[4] = 'If you guess a letter that is not in the word, you will lose a guess'
    instructions_text[5] = 'You will have as many guesses depending on the difficulty'
    instructions_text[6] = 'If you guess the word before you run out of guesses, you win!'
    instructions_text[7] = 'If you run out of guesses before you guess the word, you lose!'
    instructions_text[8] = 'Good luck!'
    print_message(instructions_text, 100, 'bg_green')
  end
end
