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
    @config = {}
  end

  def main
    system('clear') or system('cls')
    load_config
    @righ_panel += getting_menu_block('Main Menu', 'Start', 'Settings', 'Instructions', 'Exit')
    full_panel = @left_panel.map.with_index do |first, index|
      first.to_s + @righ_panel[index].to_s
    end
    print_message(full_panel, 100, 'bg_black', 'bg_red', use_frame: true)
    print_input_field(100, 'bg_black')
    chose = gets.chomp.downcase
    chose = gets.chomp.downcase until chose.match(/[1-4]|cheat/)
    case chose
    when '1' then start
    when '2' then settings
    when '3' then instructions
    when '4' then exit
    when 'cheat' then start(cheat: true)
    end
  end

  def load_config
    @config = YAML.load_file('./assets/settings.yml')
  end

  def start(cheat: false)
    Game.new.play
  end
end
