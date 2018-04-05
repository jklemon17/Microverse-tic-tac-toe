require_relative '../lib/game.rb'

# Begin game
# puts 'Please enter Player 1's name:'
# player1 = Player.new(gets.chomp, 'X')
# puts 'Please enter Player 2's name:'
# player2 = Player.new(gets.chomp, 'O')

# redone to account for the user not entering a name before pressing enter
# solved by prividing a default value:
puts "Please enter Player 1's name:"
name = gets.chomp
player1 = Player.new(name == '' ? 'Player 1' : name, 'X')
puts "Please enter Player 2's name:"
name = gets.chomp
player2 = Player.new(name == '' ? 'Player 2' : name, 'O')

# This will perpetually reset the game until a win condition occurs and
# the user types 'N' when asked if they want to continue
# or until the player types 'quit'
loop do
  quit = false

  puts "\n"
  puts "#{player1.name} is using the #{player1.marker}."
  puts "#{player2.name} is using the #{player2.marker}."

  current_game = TicTacToe.new(player1, player2)

  current_game.display_grid

  until current_game.game_over?
    target_square = current_game.ask_player
    # Allow player to quit at any time by typing 'quit'
    if current_game.update_square(current_game.turn, target_square) == 'q'
      quit = true
      break
    end
    current_game.display_grid
    current_game.change_turn
  end

  break if quit

  if current_game.game_outcome == 'win'
    puts "\n#{current_game.turn == 'X' ? current_game.player2.name : current_game.player1.name} Wins!"
  else
    puts "\nThe game is a draw."
  end

  puts 'Want to play again with same players?  Y/N'
  # use .downcase to account for 'N' and 'n'.
  # [0] is to check only the first letter, accounting for user typing 'no'
  break if gets.chomp.downcase[0] == 'n'
end

puts "\nThanks for playing!"
