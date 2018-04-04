# This is the player class.
class Player
  attr_accessor :name
  attr_reader :marker

  def initialize(name, marker)
    @name = name
    @marker = marker
  end
end
