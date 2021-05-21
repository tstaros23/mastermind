require 'pry'

class PlayerInput
  attr_reader :input

  def initialize(input)
    @input = input.upcase.split("")
  end

end
