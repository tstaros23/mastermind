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
      start_game_flow
    elsif @statement.input == "I"
      instructions
    elsif @statement.input == "Q"
      quit_message
    else
      wrong_input
    end
  end

  private

  def start_game_flow
    system "clear"
    @winning_answer = WinningCombo.new
    @statement.print_to_terminal(@statement.game_flow)
    @statement.print_to_terminal(@statement.get_player_input)
    @player_answer = PlayerInput.new(@statement.input)
    @compare_color = CompareColor.new(@player_answer, @winning_answer)
    if @statement.input == "Q"
      quit_message
    elsif @compare_color.player_answer.length > 4 || @compare_color.player_answer.length < 4
      @statement.print_to_terminal(@statement.wrong_length)
      wrong_guess_game_flow
    elsif @compare_color.player_answer == @compare_color.winning_answer
       @statement.print_to_terminal(@statement.winning_message)
    elsif @compare_color.player_answer != @compare_color.winning_answer
      @statement.print_to_terminal(@statement.player_wrong_turn)
      wrong_guess_game_flow 
    end
  end

  def wrong_guess_game_flow
    @statement.print_to_terminal(@statement.get_player_input)
    @player_answer = PlayerInput.new(@statement.input)
    @compare_color = CompareColor.new(@player_answer, @winning_answer)
    if @statement.input == "Q"
      quit_message
    elsif @compare_color.player_answer.length > 4 || @compare_color.player_answer.length < 4
      @statement.print_to_terminal(@statement.wrong_length)
      wrong_guess_game_flow
    elsif @compare_color.player_answer == @compare_color.winning_answer
      @statement.print_to_terminal(@statement.winning_message)
    elsif @compare_color.player_answer != @compare_color.winning_answer
      @statement.print_to_terminal(@statement.player_wrong_turn)
      wrong_guess_game_flow
    end
  end

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
  #making the Statement class an instance variable within the Game class will let us use the methods 
  #that come with the Statement class that are outside of the global scope
  end

  def quit_message
    @statement.print_to_terminal(@statement.quit_message)
    sleep 3
    system "clear"
  end

  def wrong_input
    @statement.print_to_terminal(@statement.wrong_input)
    sleep 2
    main_menu_interaction
  end
end
