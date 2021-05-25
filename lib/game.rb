require 'rspec'
require './lib/statement'


class Game
  def initialize
    @statement = Statement.new
  end
  #game.new makes Statement.new available in the game class
  def main_menu_interaction
    @statement.print_to_terminal(@statement.main_menu)
  #making the Statement class an instance variable within the Game class will let us use the methods that come with the Statement class that are outside of the global scope
  end
end
