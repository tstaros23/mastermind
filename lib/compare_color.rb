require './lib/winning_combo'
require './lib/player_input'

class CompareColor
  attr_reader :players_answer, :winning_answer
  def initialize(players_answer, winning_answer)
    @players_answer = players_answer
    @winning_answer = winning_answer
  end

  def correct_colors
    correct_colors = 0

    @players_answer.each do |color|
      

    correct_colors
    #saves the amount of correct colors from the iteration in an integer

  end


end
