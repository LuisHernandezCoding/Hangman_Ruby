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
    @cheat = true
  end

  def update_values(guesses)
    @word_values = @word.chars.map do |char|
      guesses.include?(char) ? char : '_'
    end.join(' ')
  end

  def update(message, guesses, guesses_left, word)
    system('clear') or system('cls')
    print_instructions if @show_instructions

    print_args = getting_animation
    print_args.push(@cheat ? "CHEATING: #{word}" : nil)
    print_args = print_args.map.with_index do |arg, index|
      case index
      when 0
        print_args[0] += '  _  _                '.center(30)
      when 1
        print_args[1] += ' | || |__ _ _ _  __ _ '.center(30)
      when 2
        print_args[2] += ' | __ / _` | \' \/ _` |'.center(30)
      when 3
        print_args[3] += ' |_||_\__,_|_||_\__, |'.center(30)
      when 4
        print_args[4] += ' |  \/  |__ _ _ |___/ '.center(30)
      when 5
        print_args[5] += ' | |\/| / _` | \' \    '.center(30)
      when 6
        print_args[6] += ' |_|  |_\__,_|_||_|   '.center(30)
      when 7
        print_args[7] += 'by: @LuisHernandezCoding'.center(30)
      when 9
        print_args[9] += 'Input a letter to guess'.center(30)
      when 11
        print_args[11] += 'Guesses left:'.center(30)
      when 12
        print_args[12] += guesses_left.to_s.center(30)
      when 14
        print_args[14] += 'Word:'.center(30)
      when 15
        print_args[15] += @word_values.center(30)
      when 17
        print_args[17] += 'Your Guesses:'.center(30)
      when 18
        print_args[18] += guesses.join(', ').center(30)
      else
        print_args[index] = (arg.to_s + (' ' * 30)) if arg
      end
    end
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

  def getting_animation(step = 0)
    animation_args = []
    case step
    when 0
      animation_args << '    ╔════════════()══════╗       '
      animation_args << '    ║ ╔══════════()══════╝       '
      animation_args << '    ║ ║  / /     ()              '
      animation_args << '    ║ ║ / /      () ,~~~.        '
      animation_args << '    ║ ║/ /       ()/  _  \\       '
      animation_args << '    ║ ║ /        ()G  °  _\\      '
      animation_args << '    ║ ║/         ()\````  /      '
      animation_args << '    ║ ║          () ```__/       '
      animation_args << '    ║ ║          /Y . . Y\\       '
      animation_args << '    ║ ║         // ║   ║ \\\\      '
      animation_args << '    ║ ║        //  ║ . ║  \\\\     '
      animation_args << '    ║ ║       \')   ║   ║   (`    '
      animation_args << '    ║ ║            ║║\'║║         '
      animation_args << '    ║ ║            ║║ ║║         '
      animation_args << '    ║ ║            ║║ ║║         '
      animation_args << '    ║ ║            ║║ ║║         '
      animation_args << '    ║ ║           / ║ ║ \\        '
      animation_args << '  """"""""""""""""║══════════║"""║/% '
      animation_args << '  """"║"║"""""""""║══════════║"║"║/   '
      animation_args << '    ║ ║                     ║ ║  '
      animation_args << '    : :                     : :  '
      animation_args << '    . .                     . .  '
    when 12
      animation_args << '    ╔════════════()══════╗       '
      animation_args << '    ║ ╔══════════()══════╝       '
      animation_args << '    ║ ║  / /     ()              '
      animation_args << '    ║ ║ / /      () ,~~~.        '
      animation_args << '    ║ ║/ /       ()/  _  \\       '
      animation_args << '    ║ ║ /        ()G  x  _\\      '
      animation_args << '    ║ ║/         ()\````/_/      '
      animation_args << '    ║ ║          () ```__/       '
      animation_args << '    ║ ║          /Y . . Y\\       '
      animation_args << '    ║ ║         // ║   ║ \\\\      '
      animation_args << '    ║ ║        //  ║ . ║  \\\\     '
      animation_args << '    ║ ║       \')   ║   ║   (`    '
      animation_args << '    ║ ║            ║║\'║║         '
      animation_args << '    ║ ║            ║║ ║║         '
      animation_args << '    ║ ║            ║║ ║║         '
      animation_args << '    ║ ║            ║║ ║║         '
      animation_args << '    ║ ║           / ║ ║ \\        '
      animation_args << '""""""""""""""""║_`-\' `-\' .║"""║  '
      animation_args << '""""║"║"""""""""\ \       \'║"║"║\ '
      animation_args << '    ║ ║          \ \        ║ ║\% '
      animation_args << '    : :           \ \       : :  '
      animation_args << '    . .            \'\'       . .  '
    end
    animation_args.each { |line| line.center(20) }
    animation_args
  end
end
