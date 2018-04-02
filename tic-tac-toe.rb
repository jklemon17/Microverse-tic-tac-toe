#This is our game file
class TicTacToe
  attr_accessor :turn, :player1, :player2
  def initialize
    @turn = 0
    puts "Please enter Player 1's name:"
    @player1 = Player.new(gets.chomp, "X")
    puts "Please enter Player 2's name:"
    @player2 = Player.new(gets.chomp, "O")
  end

end

class Grid

end

class Square

end

class Player
  attr_accessor :name, :marker
  def initialize(name, marker)
    @name = name
    @marker = marker
  end
end

# def
# end
#
# def
#
# end

#
# until TicTacToe.game_over
#
# end
#    1 2 3
# a  o|x|o
# b  x|_|x
# c  o|_|x

current_game = TicTacToe.new

puts "Player 1's name is: #{current_game.player1.name}. They are using the #{current_game.player1.marker}"
puts "Player 2's name is: #{current_game.player2.name}. They are using the #{current_game.player2.marker}"
