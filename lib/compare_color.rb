require './lib/winning_combo'
require './lib/player_input'

class CompareColor
  attr_reader :player_answer, :winning_answer,
              :correct_colors, :correct_positions
  def initialize(player_answer, winning_answer)
    @player_answer = player_answer.input
    @winning_answer = winning_answer.answer
    @correct_colors = 0
    @correct_positions = 0
    correct_colors_positions
  end

  def correct_colors_positions
    @player_answer.each_with_index do |color, index|
      if @winning_answer.include? color
        @correct_colors += 1
        # if the position is correct, add to second count
        if @winning_answer[index] == @player_answer[index]
          @correct_positions += 1
        end
      end
    end
  end
end
