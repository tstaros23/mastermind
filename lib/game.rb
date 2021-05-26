require './lib/statement'
require './lib/player_input'
require './lib/compare_color_position'
require './lib/winning_combo'


class Game
  def initialize
    @statement = Statement.new
    @guesses = 0
  end
  #game.new makes Statement.new available in the game class

  def main_menu_interaction
    mastermind_intro
    if (@statement.input == "P") || (@statement.input == "PLAY")
      start_game_flow
    elsif (@statement.input == "I") || (@statement.input == "INSTRUCTIONS")
      instructions
    elsif (@statement.input == "Q") || (@statement.input == "QUIT")
      quit_message
    else
      wrong_input
    end
  end

  private #anything past here cannot be called by someone trying to access in terminal

  def game_player_input
    @statement.get_player_input
    @player_answer = PlayerInput.new(@statement.input)
    @compare_color = CompareColor.new(@player_answer, @winning_answer)
  end

  def start_game_flow #only runs once
    # method starts game logic for player, and executes essential processes like tracking
    # time, getting player input, generating the random winning answer(only once), and 
    # breaking down the different inputs into if/elsif statements
    system "clear"
    @start = Process.clock_gettime(Process::CLOCK_MONOTONIC) #<< we only want once
    @winning_answer = WinningCombo.new #<< we only want once
    @guesses += 1 #<< only want to run once for start game flow
    @statement.print_to_terminal(@statement.game_flow)
    game_player_input
    if (@statement.input == "Q") || (@statement.input == "QUIT")
      quit_message
    elsif (@statement.input == "C") || (@statement.input == "CHEAT")
      puts @compare_color.winning_answer.join("")
      wrong_guess_game_flow
    elsif @compare_color.player_answer.length > 4 || @compare_color.player_answer.length < 4
      @statement.print_to_terminal(@statement.wrong_length)
      wrong_guess_game_flow
    elsif @compare_color.player_answer == @compare_color.winning_answer
      winning_answer_flow
    elsif @compare_color.player_answer != @compare_color.winning_answer
      @statement.print_to_terminal(@statement.player_wrong_turn(@statement.input, @compare_color.correct_colors, @compare_color.correct_positions, @guesses))
      @guesses += 1
      wrong_guess_game_flow
    end
  end

  def wrong_guess_game_flow # runs as long as player guesses wrong(loops)
    game_player_input
    if (@statement.input == "Q") || (@statement.input == "QUIT")
      quit_message
    elsif (@statement.input == "C") || (@statement.input == "CHEAT")
      puts @compare_color.winning_answer.join("")
      wrong_guess_game_flow
    elsif @compare_color.player_answer.length > 4 || @compare_color.player_answer.length < 4
      @statement.print_to_terminal(@statement.wrong_length)
      wrong_guess_game_flow
    elsif @compare_color.player_answer == @compare_color.winning_answer
      winning_answer_flow
    elsif @compare_color.player_answer != @compare_color.winning_answer
      @statement.print_to_terminal(@statement.player_wrong_turn(@statement.input, @compare_color.correct_colors, @compare_color.correct_positions, @guesses))
      @guesses += 1
      wrong_guess_game_flow
    end
  end

  def instructions
    system "clear"
    @statement.print_to_terminal(@statement.instructions)
    @statement.get_player_input
    return main_menu_interaction if @statement.input != nil
  end

  def mastermind_intro
    system "clear"
    @statement.print_to_terminal(@statement.mastermind_art)
    @statement.print_to_terminal(@statement.main_menu)
    @statement.get_player_input
  #making the Statement class an instance variable within the Game class will let us use the methods 
  #that come with the Statement class that are outside of the global scope
  end

  def quit_message
    @statement.print_to_terminal(@statement.quit_message)
    sleep 3
    system "clear"
  end

  def winning_answer_flow
    system "clear"
    finish = Process.clock_gettime(Process::CLOCK_MONOTONIC)
    elapsed = finish - @start
    @statement.print_to_terminal(@statement.winning_message(@winning_answer.answer, @guesses, elapsed.round(1)))
    @statement.get_player_input
    @guesses = 0
    if (@statement.input == "P") || (@statement.input == "PLAY")
      main_menu_interaction
    elsif (@statement.input == "Q") || (@statement.input == "QUIT")
      quit_message
    end
  end

  def wrong_input
    @statement.print_to_terminal(@statement.wrong_input)
    sleep 2
    main_menu_interaction
  end
end
