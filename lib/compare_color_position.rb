require './lib/winning_combo'
require './lib/player_input'

class CompareColor
  attr_reader :player_answer, :winning_answer,
              :correct_colors, :correct_positions
  def initialize(player_answer, winning_answer)
    @player_answer = player_answer.input
    @winning_answer = winning_answer.answer
    correct_color
    correct_position
  end

  def correct_color
    @correct_colors = 0
    local_winning_answer = @winning_answer.dup
    @player_answer.each do |color|
      if local_winning_answer.include? color
        @correct_colors += 1
        local_winning_answer.delete_at(local_winning_answer.index(color))
      end
    end
    @correct_colors
  end

  def correct_position
    @correct_positions = 0
    @player_answer.each_with_index do |color, index|
      if @winning_answer.include? color
        if @winning_answer[index] == @player_answer[index]
          @correct_positions += 1
        end
      end
    end
    @correct_positions
  end

end