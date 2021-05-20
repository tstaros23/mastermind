require 'pry'

class WinningCombo
  attr_reader :answer
  def initialize
    @answer = winning_combo
  end

  def winning_combo
    starting_colors = ["R", "G", "B", "Y"]

    winning_combo = []

    4.times do
      winning_combo << starting_colors.shuffle[0]
    end

    winning_combo
  end
end
