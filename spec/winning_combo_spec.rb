require 'rspec'
require './lib/winning_combo'

RSpec.describe 'WinningCombo' do
  before do
    @answer = WinningCombo.new
    allow(@answer).to receive(:answer) {["R", "R", "B", "G"]}
  end
  it 'exists' do
    expect(@answer).to be_a(WinningCombo)
  end

  it 'has answer' do
    expect(@answer.answer).to eq(["R", "R", "B", "G"])
  end
end
