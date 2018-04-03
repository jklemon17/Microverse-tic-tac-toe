#This is our game file
class TicTacToe
  attr_accessor :turn, :player1, :player2, :squares
  def initialize (player1, player2)
    @turn = "X"
    # puts "Please enter Player 1's name:"
    # @player1 = Player.new(gets.chomp, "X")
    # puts "Please enter Player 2's name:"
    # @player2 = Player.new(gets.chomp, "O")

    @player1 = player1
    @player2 = player2

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

    # if player wants to quit
    # use .downcase to account for "Q" and "q".  [0] is to check only the first letter, to account for if user types the whole word "Quit"
    return if target.downcase[0] == "q"

    # check if valid input
    if @squares.keys.include?(target) == false
      puts "That is not a valid square,\n
      target must be made of a letter from a to c, followed by a number from 1 to 3.\n
      Example 'b2'.\n
      Please enter a target square:"
      update_square(marker, gets.strip.chomp)

    # check if blank:
    elsif @squares[target].state != "_"
      puts "That target is not blank, please pick a blank one"
      update_square(marker, gets.chomp)
    else
      @squares[target].state = marker
    end

  end

  def display_grid

    puts "\n"
    puts "  1 2 3"
    puts "a #{@squares["a1"].state}|#{@squares["a2"].state}|#{@squares["a3"].state}\n"
    puts "b #{@squares["b1"].state}|#{@squares["b2"].state}|#{@squares["b3"].state}\n"
    puts "c #{@squares["c1"].state}|#{@squares["c2"].state}|#{@squares["c3"].state}"

  end

  def change_turn
    @turn = @turn == "X" ? "O" : "X"
  end

  def game_over
    # check the rows
    if @squares["a1"].state != "_" && @squares["a2"].state == @squares["a1"].state && @squares["a3"].state == @squares["a1"].state
        return true
    end
    if @squares["b1"].state != "_" && @squares["b2"].state == @squares["b1"].state && @squares["b3"].state == @squares["b1"].state
        return true
    end
    if @squares["c1"].state != "_" && @squares["c2"].state == @squares["c1"].state && @squares["c3"].state == @squares["c1"].state
        return true
    end

    # check the columns
    if @squares["a1"].state != "_" && @squares["b1"].state == @squares["a1"].state && @squares["c1"].state == @squares["a1"].state
      return true
    end
    if @squares["a2"].state != "_" && @squares["b2"].state == @squares["a2"].state && @squares["c2"].state == @squares["a2"].state
      return true
    end
    if @squares["a3"].state != "_" && @squares["b3"].state == @squares["a3"].state && @squares["c3"].state == @squares["a3"].state
      return true
    end

    # check the diagonals
    if @squares["a1"].state != "_" && @squares["b2"].state == @squares["a1"].state && @squares["c3"].state == @squares["a1"].state
      return true
    end
    if @squares["a3"].state != "_" && @squares["b2"].state == @squares["a3"].state && @squares["c1"].state == @squares["a3"].state
      return true
    end

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




puts "Please enter Player 1's name:"
player1 = Player.new(gets.chomp, "X")
puts "Please enter Player 2's name:"
player2 = Player.new(gets.chomp, "O")

# this will perpetually reset the game until a win condition occurs and the user types "N" when asked if they want to continue.
loop do

    # puts "Player 1's name is: #{current_game.player1.name}. They are using the #{current_game.player1.marker}"
    # puts "Player 2's name is: #{current_game.player2.name}. They are using the #{current_game.player2.marker}"
    puts "\n"
    puts "Player 1's name is: #{player1.name}. They are using the #{player1.marker}"
    puts "Player 2's name is: #{player2.name}. They are using the #{player2.marker}"

    current_game = TicTacToe.new(player1, player2)

    current_game.display_grid

    until current_game.game_over
      target_square = current_game.ask_player()
      current_game.update_square(current_game.turn, target_square)
      current_game.display_grid
      current_game.change_turn
    end

    puts "#{current_game.turn == "X" ? current_game.player2.name : current_game.player1.name} Wins!"
    puts "Want to play again with same players?  Y/N"
    # use .downcase to account for "N" and "n".  [0] is to check only the first letter, to account for if user types the whole word "no"
    break if gets.chomp.downcase[0] == "n"

end
puts "\nThanks for playing!"


# update_square(marker, target)
#   target.state = marker


# check for win
# ask next player for target
# update square
# display grid
# check for win
