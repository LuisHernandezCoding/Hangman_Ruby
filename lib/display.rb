require_relative 'colors'

TITLE = 'Hangman Game'.bold.center(55)
CREDITS = 'By: @LuisHernandezCoding'.bold.center(55)

MARGIN = ' ' * 4
SIDE = ' ' * 13
SIDE_LINE = ' ' * 12

FULL_LINE = MARGIN + (' ' * 72)
FRAME = ('+' * 50).bg_black.bold
BLINK = '++'.bg_black.bold

class Display
  attr_reader :word, :word_values
  attr_accessor :show_instructions

  def initialize(word)
    @word = word
    @word_values = '_ ' * word.length
    @show_instructions = true
  end

  def update_values(guesses)
    @word_values = @word.chars.map do |char|
      guesses.include?(char) ? char : '_'
    end.join(' ')
  end

  def update(guesses, guesses_left, word)
    system('clear') or system('cls')
    print_header
    print_instructions if @show_instructions
    puts word
    puts word_values
    puts "You have #{guesses_left} guesses left."
    puts 'Guess a letter:'
  end

  def print_header
    puts
    puts MARGIN + (' ' * 72).bg_blue
    puts MARGIN + (' ' * 11).bg_blue + FRAME + (' ' * 11).bg_blue
    puts MARGIN + (' ' * 11).bg_blue + + BLINK + TITLE + BLINK + (' ' * 11).bg_blue
    puts MARGIN + (' ' * 11).bg_blue + BLINK + CREDITS + BLINK + (' ' * 11).bg_blue
    puts MARGIN + (' ' * 11).bg_blue + FRAME + (' ' * 11).bg_blue
    puts MARGIN + ('_' * 72).bg_blue.bold
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
    puts MARGIN + (' ' * 72).bg_green
    puts MARGIN + instructions_text[0].center(72).bg_green.bold
    puts MARGIN + (MARGIN + ('_' * 64) + MARGIN).bg_green
    puts MARGIN + (' ' * 72).bg_green
    instructions_text[1..8].each do |text|
      puts MARGIN + text.center(72).bg_green
    end
    puts MARGIN + ('_' * 72).bg_green.bold
  end
end
