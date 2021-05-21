require 'rspec'
require './lib/player_input'

RSpec.describe 'PlayerInput' do
  before do
    @input = PlayerInput.new(gets.chomp)
    #@input is now universal and can be used in other tests in the same row
  end

  it 'exists' do
    expect(@input).to be_a(PlayerInput)
  end

  it 'has input inside PlayerInput class' do
    expect(@input.input).to eq(["R", "R", "R", "B"])
  end
# "BEFORE DO" executes code before other tests if they are in the same row
end
