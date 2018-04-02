#This is our game file
class TicTacToe
  attr_accessor :turn, :player1, :player2, :squares
  def initialize
    @turn = "X"
    puts "Please enter Player 1's name:"
    @player1 = Player.new(gets.chomp, "X")
    puts "Please enter Player 2's name:"
    @player2 = Player.new(gets.chomp, "O")
    # build the grid
    @squares = {}
    ('a'..'c').each do |letter|
        (1..3).each do |number|
          name = letter.to_s + number.to_s
          @squares[name] = Square.new(name)
        end
    end
  end

  def ask_player
    puts "#{@turn == "X" ? @player1.name : @player2.name}, choose a square: (a1 to c3)"
    gets.chomp

    # if marker = "X"
    #   ask player2
    # else
    #   ask player1
    # end
  end

  def update_square(marker, target)
  #
  #   if @squares[target].state != "_"
  #     puts "That target is not blank, please pick a blank one"
  #     target = gets.chomp
  #     update_square(marker, target)
  #   else
        @squares[target].state = marker
  #   end
    #display_grid
    # ask_player
  end

  def display_grid

    puts "#{@squares["a1"].state}|#{@squares["a2"].state}|#{@squares["a3"].state}\n"
    puts "#{@squares["b1"].state}|#{@squares["b2"].state}|#{@squares["b3"].state}\n"
    puts "#{@squares["c1"].state}|#{@squares["c2"].state}|#{@squares["c3"].state}"

  end

  def change_turn
    @turn = @turn == "X" ? "O" : "X"
  end

  def game_over
    false
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

current_game.display_grid

until current_game.game_over
  target_square = current_game.ask_player()
  current_game.update_square(current_game.turn, target_square)
  current_game.display_grid
  current_game.change_turn
end


# update_square(marker, target)
#   target.state = marker


# check for win
# ask next player for target
# update square
# display grid
# check for win
