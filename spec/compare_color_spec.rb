require 'rspec'
require './lib/winning_combo'
require './lib/player_input'
require './lib/compare_color'

RSpec.describe 'CompareColor' do
  before do
    @answer = WinningCombo.new
    @player_input = PlayerInput.new("rgby")
    allow(@answer).to receive(:answer) {["R", "R", "B", "G"]}
  end

  it "exists" do
    compare_color = CompareColor.new(@player_input, @answer)

    expect(compare_color).to be_a(CompareColor)
  end

  it "Has things to compare" do
    compare_color = CompareColor.new(@player_input, @answer)

    expect(compare_color.players_answer).to eq (["R", "G", "B", "Y"])
    expect(compare_color.winning_answer).to eq (["R", "R", "B", "G"])
  end

  it "Can compare colors" do
    compare_color = CompareColor.new(@player_input, @answer)

    expect(compare_color.correct_colors).to eq(3)
  end

  it "can compare correct colors in correct positions" do
    compare_color = CompareColor.new(@player_input, @answer)
    # require 'pry'; binding.pry
    expect(compare_color.correct_positions).to eq(2)
  end

end
