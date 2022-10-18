require_relative 'colors'
require_relative 'console_printer'
require_relative 'graphics'

class Display
  include ConsolePrinter
  include Graphics
  attr_reader :word, :word_values
  attr_accessor :show_instructions, :game_started, :cheat

  def initialize(word)
    @word = word
    @word_values = '_ ' * word.length
    @show_instructions = false
    @cheat = false
    @game_started = true
  end

  def update_values(guesses)
    @word_values = @word.chars.map do |char|
      guesses.include?(char) ? char : '_'
    end.join(' ')
  end

  def update(message, guesses, guesses_left, word, aniumation_state)
    system('clear') or system('cls')
    print_instructions if @show_instructions
    print_args = getting_animation(aniumation_state)
    print_args.push(@cheat ? "CHEATING: #{word}" : nil)

    righ_panel = game_block(message, guesses, guesses_left) if game_started
    print_args = process_board(print_args, righ_panel)

    print_message(print_args, 100, 'bg_black', 'bg_red', use_frame: true)
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

  def game_block(message, guesses, guesses_left)
    second_block = getting_logo
    second_block << ' '.center(40)
    second_block << 'Input a letter to guess'.center(40)
    second_block << ' '.center(40)
    second_block << 'Guesses left:'.center(40)
    second_block << guesses_left.to_s.center(40)
    second_block << ' '.center(40)
    second_block << 'Word:'.center(40)
    second_block << @word_values.center(40)
    second_block << ' '.center(40)
    second_block << 'Your Guesses:'.center(40)
    second_block << guesses[0..7].join(' ').center(40)
    second_block << guesses[8..15].join(' ').center(40) if guesses.length > 8
    second_block << ' '.center(40)
    second_block << message.center(40)
    second_block << ' '.center(40)
    second_block << ' '.center(40)
    second_block
  end

  def process_board(print_args, second)
    print_args.map.with_index do |first, index|
      first.to_s + second[index].to_s
    end
  end
end
