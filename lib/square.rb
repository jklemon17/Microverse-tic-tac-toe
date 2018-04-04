# This is the square class.
class Square
  attr_accessor :state
  attr_reader :name

  def initialize(name, state = '_')
    @name = name
    @state = state
  end
end
