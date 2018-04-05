def name_players(player1, player2)
  puts "Please enter player 1's name:"
  player1.name = gets.chomp
  player1.name = 'Player 1' if player1.name == ''

  puts "Please enter Player 2's name:"
  player2.name = gets.chomp
  player2.name = 'Player 2' if player2.name == ''
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
