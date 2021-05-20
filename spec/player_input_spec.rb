require 'rspec'
require './lib/player_input'

RSpec.describe 'PlayerInput' do
  before do
    @player_input = gets.chomp
    @input = PlayerInput.new(@player_input)
  #   #@player_input is now universal and can be used in other tests in the same row
  end

  it 'exists' do
    expect(@input).to be_a(PlayerInput)
  end
# "BEFORE DO" executes code before other tests if they are in the same row




end
