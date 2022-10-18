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

  def update(message, guesses, guesses_left, word, aniumation_state)
    system('clear') or system('cls')
    print_instructions if @show_instructions

    print_args = getting_animation(aniumation_state)
    print_args.push(@cheat ? "CHEATING: #{word}" : nil)
    print_args = print_args.map.with_index do |arg, index|
      case index
      when 0
        print_args[0] += '  _  _                '.center(40)
      when 1
        print_args[1] += ' | || |__ _ _ _  __ _ '.center(40)
      when 2
        print_args[2] += ' | __ / _` | \' \/ _` |'.center(40)
      when 3
        print_args[3] += ' |_||_\__,_|_||_\__, |'.center(40)
      when 4
        print_args[4] += ' |  \/  |__ _ _ |___/ '.center(40)
      when 5
        print_args[5] += ' | |\/| / _` | \' \    '.center(40)
      when 6
        print_args[6] += ' |_|  |_\__,_|_||_|   '.center(40)
      when 7
        print_args[7] += 'by: @LuisHernandezCoding'.center(40)
      when 9
        print_args[9] += 'Input a letter to guess'.center(40)
      when 11
        print_args[11] += 'Guesses left:'.center(40)
      when 12
        print_args[12] += guesses_left.to_s.center(40)
      when 14
        print_args[14] += 'Word:'.center(40)
      when 15
        print_args[15] += @word_values.center(40)
      when 17
        print_args[17] += 'Your Guesses:'.center(40)
      when 18
        print_args[18] += guesses[0..5].join(' ').center(40)
      when 19
        print_args[19] += guesses[6..11].join(' ').center(40) if guesses.length > 6
        print_args[index] = (arg.to_s + (' ' * 40)) if arg
      when 21
        print_args[21] += message.center(40)
      else
        print_args[index] = (arg.to_s + (' ' * 40)) if arg
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

  def getting_animation(step = 10)
    animation_args = []
    case step
    when 0
      animation_args << '  ╔════════════()══════╗       '
      animation_args << '  ║ ╔══════════()══════╝       '
      animation_args << '  ║ ║  / /                     '
      animation_args << '  ║ ║ / /                      '
      animation_args << '  ║ ║/ /                       '
      animation_args << '  ║ ║ /                        '
      animation_args << '  ║ ║/                         '
      animation_args << '  ║ ║                          '
      animation_args << '  ║ ║                          '
      animation_args << '  ║ ║                          '
      animation_args << '  ║ ║                          '
      animation_args << '  ║ ║                          '
      animation_args << '  ║ ║                          '
      animation_args << '  ║ ║                          '
      animation_args << '  ║ ║                          '
      animation_args << '  ║ ║                          '
      animation_args << '  ║ ║                          '
      animation_args << '""""""""""""║═════════════║"""║/8'
      animation_args << '"""║"║""""""║═════════════║"║"║/ '
      animation_args << '  ║ ║                     ║ ║  '
      animation_args << '  ║ ║                     ║ ║  '
      animation_args << '  ║ ║                     ║ ║  '
      animation_args << '  ║ ║                     ║ ║  '
    when 1
      animation_args << '  ╔════════════()══════╗       '
      animation_args << '  ║ ╔══════════()══════╝       '
      animation_args << '  ║ ║  / /                     '
      animation_args << '  ║ ║ / /                      '
      animation_args << '  ║ ║/ /                       '
      animation_args << '  ║ ║ /                        '
      animation_args << '  ║ ║/                         '
      animation_args << '  ║ ║                          '
      animation_args << '  ║ ║                          '
      animation_args << '  ║ ║                          '
      animation_args << '  ║ ║                          '
      animation_args << '  ║ ║                          '
      animation_args << '  ║ ║                          '
      animation_args << '  ║ ║               ,~~~.      '
      animation_args << '  ║ ║             _/ _ _ \\_    '
      animation_args << '  ║ ║             \| °.° |/    '
      animation_args << '  ║ ║               \ - /      '
      animation_args << '""""""""""""║═════════════║"""║/8'
      animation_args << '"""║"║""""""║═════════════║"║"║/ '
      animation_args << '  ║ ║                     ║ ║  '
      animation_args << '  ║ ║                     ║ ║  '
      animation_args << '  ║ ║                     ║ ║  '
      animation_args << '  ║ ║                     ║ ║  '
    when 2
      animation_args << '  ╔════════════()══════╗       '
      animation_args << '  ║ ╔══════════()══════╝       '
      animation_args << '  ║ ║  / /                     '
      animation_args << '  ║ ║ / /                      '
      animation_args << '  ║ ║/ /                       '
      animation_args << '  ║ ║ /                        '
      animation_args << '  ║ ║/                         '
      animation_args << '  ║ ║                          '
      animation_args << '  ║ ║                          '
      animation_args << '  ║ ║               ,~~~.      '
      animation_args << '  ║ ║             _/ _ _ \_    '
      animation_args << '  ║ ║             \| °.° |/    '
      animation_args << '  ║ ║               \ - /      '
      animation_args << '  ║ ║             ___/ \___    '
      animation_args << '  ║ ║            //Y . . Y\\\\   '
      animation_args << '  ║ ║           // ║     ║ \\\\  '
      animation_args << '  ║ ║          //  ║  .  ║  \\\\ '
      animation_args << '""""""""""""║═════════════║"""║/8'
      animation_args << '"""║"║""""""║═════════════║"║"║/ '
      animation_args << '  ║ ║                     ║ ║  '
      animation_args << '  ║ ║                     ║ ║  '
      animation_args << '  ║ ║                     ║ ║  '
      animation_args << '  ║ ║                     ║ ║  '
    when 3
      animation_args << '  ╔════════════()══════╗       '
      animation_args << '  ║ ╔══════════()══════╝       '
      animation_args << '  ║ ║  / /                     '
      animation_args << '  ║ ║ / /                      '
      animation_args << '  ║ ║/ /                       '
      animation_args << '  ║ ║ /                        '
      animation_args << '  ║ ║/              ,~~~.      '
      animation_args << '  ║ ║             _/ _ _ \\_    '
      animation_args << '  ║ ║             \| °.° |/    '
      animation_args << '  ║ ║               \ - /      '
      animation_args << '  ║ ║             ___/ \___    '
      animation_args << '  ║ ║            //Y . . Y\\\\   '
      animation_args << '  ║ ║           // ║     ║ \\\\  '
      animation_args << '  ║ ║          //  ║  .  ║  \\\\ '
      animation_args << '  ║ ║         (~)  ║═════║  (~)'
      animation_args << '  ║ ║         "¨¨  ║║═══║║  ¨¨"'
      animation_args << '  ║ ║              ║║   ║║     '
      animation_args << '""""""""""""║═════════════║"""║/8'
      animation_args << '"""║"║""""""║═════════════║"║"║/ '
      animation_args << '  ║ ║                     ║ ║  '
      animation_args << '  ║ ║                     ║ ║  '
      animation_args << '  ║ ║                     ║ ║  '
      animation_args << '  ║ ║                     ║ ║  '
    when 4
      animation_args << '  ╔════════════()══════╗       '
      animation_args << '  ║ ╔══════════()══════╝       '
      animation_args << '  ║ ║  / /                     '
      animation_args << '  ║ ║ / /           ,~~~.      '
      animation_args << '  ║ ║/ /          _/ _ _ \_    '
      animation_args << '  ║ ║ /           \| °.° |/    '
      animation_args << '  ║ ║/              \ - /      '
      animation_args << '  ║ ║             ___/ \___    '
      animation_args << '  ║ ║            //Y . . Y\\\\   '
      animation_args << '  ║ ║           // ║     ║ \\\\  '
      animation_args << '  ║ ║          //  ║  .  ║  \\\\ '
      animation_args << '  ║ ║         (~)  ║═════║  (~)'
      animation_args << '  ║ ║         "¨¨  ║║═══║║  ¨¨"'
      animation_args << '  ║ ║              ║║   ║║     '
      animation_args << '  ║ ║              ║║   ║║     '
      animation_args << '  ║ ║              ║║   ║║     '
      animation_args << '  ║ ║             / ║   ║ \\    '
      animation_args << '""""""""""""║═════════════║"""║/8'
      animation_args << '"""║"║""""""║═════════════║"║"║/ '
      animation_args << '  ║ ║                     ║ ║  '
      animation_args << '  ║ ║                     ║ ║  '
      animation_args << '  ║ ║                     ║ ║  '
      animation_args << '  ║ ║                     ║ ║  '
    when 5
      animation_args << '  ╔════════════()══════╗       '
      animation_args << '  ║ ╔══════════()══════╝       '
      animation_args << '  ║ ║  / /     ()              '
      animation_args << '  ║ ║ / /      ()   ,~~~.      '
      animation_args << '  ║ ║/ /       ()  / _ _ \     '
      animation_args << '  ║ ║ /           /_ °   0     '
      animation_args << '  ║ ║/            \  ´´´´/     '
      animation_args << '  ║ ║              \__´´´\     '
      animation_args << '  ║ ║            //Y . . Y\\\\   '
      animation_args << '  ║ ║           // ║     ║ \\\\  '
      animation_args << '  ║ ║          //  ║  .  ║  \\\\ '
      animation_args << '  ║ ║         (~)  ║═════║  (~)'
      animation_args << '  ║ ║         "¨¨  ║║═══║║  ¨¨"'
      animation_args << '  ║ ║              ║║   ║║     '
      animation_args << '  ║ ║              ║║   ║║     '
      animation_args << '  ║ ║              ║║   ║║     '
      animation_args << '  ║ ║             / ║   ║ \\    '
      animation_args << '""""""""""""║═════════════║"""║/8'
      animation_args << '"""║"║""""""║═════════════║"║"║/ '
      animation_args << '  ║ ║                     ║ ║  '
      animation_args << '  ║ ║                     ║ ║  '
      animation_args << '  ║ ║                     ║ ║  '
      animation_args << '  ║ ║                     ║ ║  '
    when 6
      animation_args << '  ╔════════════()══════╗       '
      animation_args << '  ║ ╔══════════()══════╝       '
      animation_args << '  ║ ║  / /     ()              '
      animation_args << '  ║ ║ / /      ()   ,~~~.      '
      animation_args << '  ║ ║/ /       ()  / _ _ \     '
      animation_args << '  ║ ║ /        () /_ °   0     '
      animation_args << '  ║ ║/         () \  ´´´´/     '
      animation_args << '  ║ ║          ()  \__´´´\     '
      animation_args << '  ║ ║            //Y . . Y\\\\   '
      animation_args << '  ║ ║           // ║     ║ \\\\  '
      animation_args << '  ║ ║          //  ║  .  ║  \\\\ '
      animation_args << '  ║ ║         (~)  ║═════║  (~)'
      animation_args << '  ║ ║         "¨¨  ║║═══║║  ¨¨"'
      animation_args << '  ║ ║              ║║   ║║     '
      animation_args << '  ║ ║              ║║   ║║     '
      animation_args << '  ║ ║              ║║   ║║     '
      animation_args << '  ║ ║             / ║   ║ \\    '
      animation_args << '""""""""""""║═════════════║"""║/8'
      animation_args << '"""║"║""""""║═════════════║"║"║/ '
      animation_args << '  ║ ║                     ║ ║  '
      animation_args << '  ║ ║                     ║ ║  '
      animation_args << '  ║ ║                     ║ ║  '
      animation_args << '  ║ ║                     ║ ║  '
    when 7
      animation_args << '  ╔════════════()══════╗       '
      animation_args << '  ║ ╔══════════()══════╝       '
      animation_args << '  ║ ║  / /     ()              '
      animation_args << '  ║ ║ / /      ()   ,~~~.      '
      animation_args << '  ║ ║/ /       ()  / _ _ \     '
      animation_args << '  ║ ║ /        () /_ °   0     '
      animation_args << '  ║ ║/         () \  ´´´´/     '
      animation_args << '  ║ ║         ()() \__´´´\     '
      animation_args << '  ║ ║        ()  //Y . . Y\\\\   '
      animation_args << '  ║ ║         ()// ║     ║ \\\\  '
      animation_args << '  ║ ║          //  ║  .  ║  \\\\ '
      animation_args << '  ║ ║         (~)  ║═════║  (~)'
      animation_args << '  ║ ║         "¨¨  ║║═══║║  ¨¨"'
      animation_args << '  ║ ║              ║║   ║║     '
      animation_args << '  ║ ║              ║║   ║║     '
      animation_args << '  ║ ║              ║║   ║║     '
      animation_args << '  ║ ║             / ║   ║ \\    '
      animation_args << '""""""""""""║═════════════║"""║/8'
      animation_args << '"""║"║""""""║═════════════║"║"║/ '
      animation_args << '  ║ ║                     ║ ║  '
      animation_args << '  ║ ║                     ║ ║  '
      animation_args << '  ║ ║                     ║ ║  '
      animation_args << '  ║ ║                     ║ ║  '
    when 8
      animation_args << '  ╔════════════()══════╗       '
      animation_args << '  ║ ╔══════════()══════╝       '
      animation_args << '  ║ ║  / /     ()              '
      animation_args << '  ║ ║ / /      () ,~~~.        '
      animation_args << '  ║ ║/ /       ()/  _  \\       '
      animation_args << '  ║ ║ /        ()0  °  _\\      '
      animation_args << '  ║ ║/         ()\````  /      '
      animation_args << '  ║ ║          ()/```__/       '
      animation_args << '  ║ ║          /Y . . Y\\\\      '
      animation_args << '  ║ ║         // ║   ║ \\\\      '
      animation_args << '  ║ ║        //  ║ . ║  \\\\     '
      animation_args << '  ║ ║       (~)  ║═══║  (~)    '
      animation_args << '  ║ ║       "¨¨  ║║═║║  ¨¨"    '
      animation_args << '  ║ ║            ║║ ║║         '
      animation_args << '  ║ ║            ║║ ║║         '
      animation_args << '  ║ ║            ║║ ║║         '
      animation_args << '  ║ ║           / ║ ║ \\        '
      animation_args << '""""""""""""║═════════════║"""║/8'
      animation_args << '"""║"║""""""║═════════════║"║"║/ '
      animation_args << '  ║ ║                     ║ ║  '
      animation_args << '  ║ ║                     ║ ║  '
      animation_args << '  ║ ║                     ║ ║  '
      animation_args << '  ║ ║                     ║ ║  '
    when 9
      animation_args << '  ╔════════════()══════╗       '
      animation_args << '  ║ ╔══════════()══════╝       '
      animation_args << '  ║ ║  / /     ()              '
      animation_args << '  ║ ║ / /      () ,~~~.        '
      animation_args << '  ║ ║/ /       ()/  _  \\       '
      animation_args << '  ║ ║ /        ()0  °  _\\      '
      animation_args << '  ║ ║/         ()\````  /      '
      animation_args << '  ║ ║          ()OOOOOO/       '
      animation_args << '  ║ ║          /Y . . Y\\\\      '
      animation_args << '  ║ ║         // ║   ║ \\\\      '
      animation_args << '  ║ ║        //  ║ . ║  \\\\     '
      animation_args << '  ║ ║       (~)  ║═══║  (~)    '
      animation_args << '  ║ ║       "¨¨  ║║═║║  ¨¨"    '
      animation_args << '  ║ ║            ║║ ║║         '
      animation_args << '  ║ ║            ║║ ║║         '
      animation_args << '  ║ ║            ║║ ║║         '
      animation_args << '  ║ ║           / ║ ║ \\        '
      animation_args << '""""""""""""║═════════════║"""║/8'
      animation_args << '"""║"║""""""║═════════════║"║"║/ '
      animation_args << '  ║ ║                     ║ ║  '
      animation_args << '  ║ ║                     ║ ║  '
      animation_args << '  ║ ║                     ║ ║  '
      animation_args << '  ║ ║                     ║ ║  '
    when 10
      animation_args << '  ╔════════════║)══════╗       '
      animation_args << '  ║ ╔══════════(║══════╝       '
      animation_args << '  ║ ║  / /     ║)              '
      animation_args << '  ║ ║ / /      (║ ,~~~.        '
      animation_args << '  ║ ║/ /       ║)/  _  \\       '
      animation_args << '  ║ ║ /        (║0  °  _\\      '
      animation_args << '  ║ ║/         ║)\````  /      '
      animation_args << '  ║ ║           (0000000       '
      animation_args << '  ║ ║          /Y . . Y\\\\      '
      animation_args << '  ║ ║         // ║   ║ \\\\      '
      animation_args << '  ║ ║        //  ║ . ║  \\\\     '
      animation_args << '  ║ ║       (~)  ║═══║  (~)    '
      animation_args << '  ║ ║       "¨¨  ║║═║║  ¨¨"    '
      animation_args << '  ║ ║            ║║ ║║         '
      animation_args << '  ║ ║            ║║ ║║         '
      animation_args << '  ║ ║            ║║ ║║         '
      animation_args << '  ║ ║           / ║ ║ \\        '
      animation_args << '""""""""""""║═════════════║"""║/8'
      animation_args << '"""║"║""""""║═════════════║"║"║/ '
      animation_args << '  ║ ║                     ║ ║  '
      animation_args << '  ║ ║                     ║ ║  '
      animation_args << '  ║ ║                     ║ ║  '
      animation_args << '  ║ ║                     ║ ║  '
    when 11
      animation_args << '  ╔════════════║║══════╗       '
      animation_args << '  ║ ╔══════════║║══════╝       '
      animation_args << '  ║ ║  / /     ║║              '
      animation_args << '  ║ ║ / /      ║║              '
      animation_args << '  ║ ║/ /       ║║ ,~~~.        '
      animation_args << '  ║ ║ /        ║║/  _  \\       '
      animation_args << '  ║ ║/         ║║0  x  _\\      '
      animation_args << '  ║ ║          ║║\````/_/      '
      animation_args << '  ║ ║           ║║║║║║║║       '
      animation_args << '  ║ ║          /Y . . Y\\\\      '
      animation_args << '  ║ ║         // ║   ║ \\\\      '
      animation_args << '  ║ ║        //  ║ . ║  \\\\     '
      animation_args << '  ║ ║       (~)  ║═══║  (~)    '
      animation_args << '  ║ ║       "¨¨  ║║═║║  ¨¨"    '
      animation_args << '  ║ ║            ║║ ║║         '
      animation_args << '  ║ ║            ║║ ║║         '
      animation_args << '  ║ ║            ║║ ║║         '
      animation_args << '"""""""""""║_   / ║ ║ \\ .║"""║  '
      animation_args << '""║"║""""""\ \  `-\' `-\' \'║"║"║\ '
      animation_args << '  ║ ║       \ \           ║ ║ \8'
      animation_args << '  ║ ║        \ \          ║ ║  '
      animation_args << '  ║ ║         \ \         ║ ║  '
      animation_args << '  ║_║          \'\'         ║_║  '
    end
    animation_args.each_with_index do |arg, index|
      animation_args[index] = arg.center(34)
    end
  end
end
