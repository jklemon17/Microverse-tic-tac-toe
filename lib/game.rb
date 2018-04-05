require_relative 'player'
require_relative 'square'

# This is the class that controls the gameplay.
class TicTacToe
  attr_accessor :player1, :player2
  attr_reader :turn, :squares

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @turn = 'X'
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
    puts "#{@turn == 'X' ? @player1.name : @player2.name}, choose a square: (a1 to c3)"
    gets.chomp
  end

  def update_square(marker, target)
    # if player wants to quit
    # use .downcase to account for 'Q' and 'q'.  [0] is to check only the first letter, to account for if user types the whole word 'Quit'
    return 'q' if target.downcase[0] == 'q'

    # check if valid input
    if @squares.keys.include?(target) == false
      puts "That is not a valid square,\n
      target must be made of a letter from a to c, followed by a number from 1 to 3.\n
      Example 'b2'.\n
      Please enter a target square:"
      update_square(marker, gets.strip.chomp)

    # check if blank:
    elsif @squares[target].state != '_'
      puts 'That target is not blank, please pick a blank one'
      update_square(marker, gets.chomp)
    else
      @squares[target].state = marker
    end
  end

  def display_grid
    puts "\n"
    puts '  1 2 3'
    puts "a #{@squares['a1'].state}|#{@squares['a2'].state}|#{@squares['a3'].state}\n"
    puts "b #{@squares['b1'].state}|#{@squares['b2'].state}|#{@squares['b3'].state}\n"
    puts "c #{@squares['c1'].state}|#{@squares['c2'].state}|#{@squares['c3'].state}\n\n"
  end

  def change_turn
    @turn = @turn == 'X' ? 'O' : 'X'
  end

  def outcome
    a1 = @squares['a1'].state
    a2 = @squares['a2'].state
    a3 = @squares['a3'].state
    b1 = @squares['b1'].state
    b2 = @squares['b2'].state
    b3 = @squares['b3'].state
    c1 = @squares['c1'].state
    c2 = @squares['c2'].state
    c3 = @squares['c3'].state

    all_squares = [a1, a2, a3, b1, b2, b3, c1, c2, c3]

    # check the rows, columns, diagonals
    return 'win' if (a1 != '_' && a2 == a1 && a3 == a1) ||
                    (b1 != '_' && b2 == b1 && b3 == b1) ||
                    (c1 != '_' && c2 == c1 && c3 == c1) ||
                    (a1 != '_' && b1 == a1 && c1 == a1) ||
                    (a2 != '_' && b2 == a2 && c2 == a2) ||
                    (a3 != '_' && b3 == a3 && c3 == a3) ||
                    (a1 != '_' && b2 == a1 && c3 == a1) ||
                    (a3 != '_' && b2 == a3 && c1 == a3)

    # check for draw
    return 'draw' if all_squares.none? { |square| square == '_' }
  end

  def game_over?
    # game_over? is only true when one of the below is true.
    outcome == 'win' || outcome == 'draw'
  end
end
