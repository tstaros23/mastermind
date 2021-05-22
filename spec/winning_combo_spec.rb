require 'rspec'
#rspec comes from the gems
require './lib/winning_combo'
#from (have to be in mastermind directory) mastermind, go to the lib folder and then go to the file winning_combo
#Don't need .rb at the end because Ruby knows what files it wants

RSpec.describe 'WinningCombo' do
  before do
    @answer = WinningCombo.new
    #this @answer is used only in this class but "before do" creates it once and is accessable throughout
    #the whole class
    allow(@answer).to receive(:answer) {["R", "R", "B", "G"]}
    #the winning combo class has method called answer. Answer is unpredictable because it is randomized.
    #because answer is random, we want it to be the same each time for testing purposes
    # we are going to mock the method answer and stub it with this value
  end
  it 'exists' do
    expect(@answer).to be_a(WinningCombo)
  end

  it 'has answer' do
    expect(@answer.answer).to eq(["R", "R", "B", "G"])
  end
end
