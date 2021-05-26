require './lib/player_input'
require './lib/compare_color_position'
require './lib/winning_combo'
require './lib/game'

class Statement
  attr_reader :input

  def initialize
    @input = ''
  end

  def game_flow
    "I have generated a beginner sequence with four elements made up of: (r)ed, \n" +
    "(g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game. \n" +
    "What's your guess? \n"
  end

  def get_player_input
    @input = gets.chomp.upcase
  end

  def instructions
    "\n" +
    "\n" +
    "The game starts off with a computer generated answer that's a secret to you, the player. \n" +
    "The answer is made up of a random combination of (r)ed, (g)reen, (b)lue, and (y)ellow. \n" +
    "The player, again you, needs to guess the correct position of all colors of the answer. \n" +
    "\n" +
    "To return to main menu, push any key."
  end

  def main_menu
    "Welcome to MASTERMIND\n" +
    "\n" +
    "Would you like to (p)lay, read the (i)nstructions, or (q)uit?" +
    "\n"
  end

  def mastermind_art
    " _______ _______ _______ _______ _______ ______ _______ _______ _______ _____  \n" +
    "|   |   |   _   |     __|_     _|    ___|   __ \\   |   |_     _|    |  |     \\ \n" +
    "|       |       |__     | |   | |    ___|      <       |_|   |_|       |  --  |\n" +
    "|__|_|__|___|___|_______| |___| |_______|___|__|__|_|__|_______|__|____|_____/ \n" +
    "\n" +
    "\n" +
    "\n" +
    "\n"
  end

  def player_wrong_turn(player_answer, correct_colors, correct_positions, guesses)
    "\n" +
    "#{player_answer} has #{correct_colors} of the correct elements with #{correct_positions} in the correct positions. \n" +
    "You've taken #{guesses} guess(es)"
  end

  def print_to_terminal(statement)
    puts statement
  end

  def quit_message
    "\n" +
    "\n" +
    "Sick bro! You'll be back! ;D"
  end

  def winning_message(winning_answer, guesses, time)
    "Congratulations! You guessed the sequence '#{winning_answer.join("")}' in #{guesses} guesses over #{time} \n" +
    "\n" +
    "Do you want to (p)lay again or (q)uit?"
  end

  def wrong_input
    "\n" +
    "Your input is not recognised... try again!" +
    "\n" +
    "\n"
  end

  def wrong_length
    "\n" +
    "Your answer is the wrong length \n"
  end
end
