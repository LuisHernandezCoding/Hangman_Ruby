require_relative 'colors'
require_relative 'console_printer'
require_relative 'graphics'

class Display
  include ConsolePrinter
  include Graphics
  attr_reader :word, :word_values
  attr_accessor :game_started, :cheat

  def initialize(word, cheat)
    @word = word
    @word_values = '_ ' * word.length
    @cheat = cheat
    @game_started = true
  end

  def update_values(guesses)
    @word_values = @word.chars.map do |char|
      guesses.include?(char) ? char : '_'
    end.join(' ')
  end

  def update(message, guesses, guesses_left, word, aniumation_state)
    system('clear') or system('cls')
    print_args = getting_animation(aniumation_state)
    print_args.push(@cheat ? "CHEATING: #{word}" : nil)

    righ_panel = game_block(message, guesses, guesses_left) if game_started
    print_args.map!.with_index do |first, index|
      first.to_s + righ_panel[index].to_s
    end
    print_message(print_args, 100, 'bg_black', 'bg_red', use_frame: true)
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
    second_block << message[0].center(40)
    second_block << message[1].center(40) if message.length > 1
    second_block << ' '.center(40)
    second_block << ' '.center(40)
    second_block << ' '.center(40)
    second_block << ' '.center(40)
    second_block
  end
end
