require_relative '../lib/game.rb'

# redone to account for the user not entering a name before pressing enter
# solved by prividing a default value:
def name_players(player1, player2)
  puts "Please enter player 1's name:"
  player1.name = gets.chomp
  puts "Please enter player 1's name:"
  player2.name = gets.chomp
end

def display_player_names(player1, player2)
  puts "\n#{player1.name} is using the #{player1.marker}."
  puts "#{player2.name} is using the #{player2.marker}."
end

def display_outcome(outcome, turn, player1, player2)
  if outcome == 'win'
    puts "\n#{turn == 'X' ? player2.name : player1.name} Wins!"
  else
    puts "\nThe game is a draw."
  end
end

def play_again?
  puts 'Want to play again?  Y/N'
  # use .downcase to account for 'N' and 'n'.
  # [0] is to check only the first letter, accounting for user typing 'no'
  gets.chomp.downcase[0] != 'n'
end

def rename_players_prompt(player1, player2)
  puts 'Would you like to rename the players? Y/N'
  name_players(player1, player2) if gets.chomp.downcase[0] == 'y'
end
# I know!

player1 = Player.new('Player 1', 'X')
player2 = Player.new('Player 2', 'O')

name_players(player1, player2)

# This will perpetually reset the game until a win condition occurs and
# the user types 'N' when asked if they want to continue
# or until the player types 'quit'
loop do
  quit = false

  display_player_names(player1, player2)
  current_game = Game.new(player1, player2)
  current_game.display_grid

  until current_game.game_over?
    target_square = current_game.ask_player
    # Allow player to quit at any time by typing 'quit'
    if current_game.update_square(current_game.turn, target_square) == 'q'
      quit = true
      break
    end
    current_game.change_turn
    current_game.display_grid
  end

  break if quit

  display_outcome(current_game.outcome, current_game.turn,
                  current_game.player1, current_game.player2)

  break unless play_again?
  rename_players_prompt(player1, player2)
end

puts "\nThanks for playing!"
