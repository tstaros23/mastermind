require './lib/statement'
require './lib/player_input'
require './lib/compare_color'
require './lib/winning_combo'


class Game
  def initialize
    @statement = Statement.new
    @guesses = 0
  end
  #game.new makes Statement.new available in the game class
  def main_menu_interaction
    mastermind_intro
    if @statement.input == "P"
    elsif @statement.input == "I"
      instructions
    elsif @statement.input == "Q"
    else
      wrong_input
    end
  end

  private

  def instructions
    system "clear"
    @statement.print_to_terminal(@statement.instructions)
    @statement.print_to_terminal(@statement.get_player_input)
    return main_menu_interaction if @statement.input != nil
  end

  def mastermind_intro
    system "clear"
    @statement.print_to_terminal(@statement.mastermind_art)
    @statement.print_to_terminal(@statement.main_menu)
    @statement.print_to_terminal(@statement.get_player_input)
  #making the Statement class an instance variable within the Game class will let us use the methods that come with the Statement class that are outside of the global scope
  end

  def wrong_input
    @statement.print_to_terminal(@statement.wrong_input)
    sleep 2
    main_menu_interaction
  end
end
