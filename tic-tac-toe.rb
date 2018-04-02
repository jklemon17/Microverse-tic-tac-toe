#This is our game file
class TicTacToe
  attr_accessor :turn, :player1, :player2, :current_grid 
  def initialize
    @turn = 0
    puts "Please enter Player 1's name:"
    @player1 = Player.new(gets.chomp, "X")
    puts "Please enter Player 2's name:"
    @player2 = Player.new(gets.chomp, "O")
    @current_grid = Grid.new
  end

  # def ask_next_player(marker)
  #   if marker = "X"
  #     ask player2
  #   else
  #     ask player1
  #   end
  # end

end

class Grid
    def initialize()
      @squares = {}
      ('a'..'c').each do |letter|
          (1..3).each do |number|
            name = letter.to_s + number.to_s
            @squares[name] = Square.new(name)
          end
      end
    end


  # def update_square(marker, target)
  #
  #   if @squares[target].state != "_"
  #     puts "That target is not blank, please pick a blank one"
  #     target = gets.chomp
  #     update_square(marker, target)
  #   else
  #       @squares[target].state = marker
  #   end
  #   display_grid
  # end



  def display_grid

    puts "#{@squares["a1"].state}|#{@squares["a2"].state}|#{@squares["a3"].state}\n"
    puts "#{@squares["b1"].state}|#{@squares["b2"].state}|#{@squares["b3"].state}\n"
    puts "#{@squares["c1"].state}|#{@squares["c2"].state}|#{@squares["c3"].state}"

  end


end

class Square

    # attr_reader :letter, :number
    attr_reader :name
    attr_accessor :state

    def initialize(name)
      # @letter = letter.to_s
      # @number = number.to_s
      # @name = @letter + @number
      @name = name
      @state = "_"
    end
end

class Player
  attr_accessor :name, :marker
  def initialize(name, marker)
    @name = name
    @marker = marker
  end
end




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


current_game.current_grid.display_grid





# update_square(marker, target)
#   target.state = marker


# check for win
# ask next player for target
# update square
# display grid
# check for win
