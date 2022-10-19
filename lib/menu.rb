require_relative 'game'
require_relative 'console_printer'
require_relative 'graphics'
require 'yaml'

class Menu
  include ConsolePrinter
  include Graphics

  def initialize
    @left_panel = getting_animation(4)
    @righ_panel = getting_logo
    @config = YAML.load_file('./assets/settings.yml')
  end

  def main
    @righ_panel = getting_logo + getting_menu_block('Main Menu', 'Start', 'Settings', 'Instructions', 'Exit')
    full_panel = @left_panel.map.with_index do |first, index|
      first.to_s + @righ_panel[index].to_s
    end
    system('clear') or system('cls')
    print_message(full_panel, 100, 'bg_black', 'bg_red', use_frame: true)
    print_input_field(100, 'bg_black')
    chose = gets.chomp.downcase
    chose = gets.chomp.downcase until chose.match(/[1-4]|cheat/)
    case chose
    when '1' then start
    when '2' then settings
    when '3' then instructions
    when '4' then exit
    when 'cheat'
      @config['GameSettings']['General']['Cheat'] = !@config['GameSettings']['General']['Cheat']
      File.write('./assets/settings.yml', @config.to_yaml)
      main
    end
  end

  def start
    difficulty = @config['GameSettings']['General']['Difficulty']
    language = @config['GameSettings']['General']['Language']
    cheat = @config['GameSettings']['General']['Cheat']
    Game.new(difficulty, language, cheat).play
  end

  def settings
    @righ_panel = getting_logo + getting_menu_block('Settings', 'Difficulty', 'Language', 'Main Menu', 'Exit')
    full_panel = @left_panel.map.with_index do |first, index|
      first.to_s + @righ_panel[index].to_s
    end
    system('clear') or system('cls')
    print_message(full_panel, 100, 'bg_black', 'bg_red', use_frame: true)
    print_input_field(100, 'bg_black')
    chose = gets.chomp.downcase
    chose = gets.chomp.downcase until chose.match(/[1-4]/)
    case chose
    when '1' then set_difficulty
    when '2' then set_language
    when '3' then main
    when '4' then exit
    end
  end

  def set_difficulty
    @righ_panel = getting_logo + getting_menu_block('Difficulty', 'Easy', 'Medium', 'Hard', 'Main Menu')
    full_panel = @left_panel.map.with_index do |first, index|
      first.to_s + @righ_panel[index].to_s
    end
    system('clear') or system('cls')
    print_message(full_panel, 100, 'bg_black', 'bg_red', use_frame: true)
    print_input_field(100, 'bg_black')
    chose = gets.chomp.downcase
    chose = gets.chomp.downcase until chose.match(/[1-4]/)
    case chose
    when '1' then @config['GameSettings']['General']['Difficulty'] = 'easy'
    when '2' then @config['GameSettings']['General']['Difficulty'] = 'medium'
    when '3' then @config['GameSettings']['General']['Difficulty'] = 'hard'
    when '4' then settings
    end
    File.write('./assets/settings.yml', @config.to_yaml)
    settings
  end

  def set_language
    @righ_panel = getting_logo + getting_menu_block('Language', 'English', 'Spanish', 'Main Menu', 'Exit')
    full_panel = @left_panel.map.with_index do |first, index|
      first.to_s + @righ_panel[index].to_s
    end
    system('clear') or system('cls')
    print_message(full_panel, 100, 'bg_black', 'bg_red', use_frame: true)
    print_input_field(100, 'bg_black')
    chose = gets.chomp.downcase
    chose = gets.chomp.downcase until chose.match(/[1-4]/)
    case chose
    when '1' then @config['GameSettings']['General']['Language'] = 'english'
    when '2' then @config['GameSettings']['General']['Language'] = 'spanish'
    when '3' then settings
    when '4' then exit
    end
    File.write('./assets/settings.yml', @config.to_yaml)
    settings
  end

  def instructions
    @righ_panel = getting_logo + getting_menu_block('Instructions', 'Main Menu', 'Exit', '', '')
    full_panel = @left_panel.map.with_index do |first, index|
      first.to_s + @righ_panel[index].to_s
    end
    system('clear') or system('cls')
    print_message(full_panel, 100, 'bg_black', 'bg_red', use_frame: true)
    print_instructions
    print_input_field(100, 'bg_black')
    chose = gets.chomp.downcase
    chose = gets.chomp.downcase until chose.match(/[1-2]/)
    case chose
    when '1' then main
    when '2' then exit
    end
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
