require_relative 'die'
require_relative 'ruby_racer'
require_relative 'reset_screen'


players = [:a, :b]
die = Die.new

game = RubyRacer.new(players, die)

# Clear the screen and print the board
# with players in their starting positions.
# Then pause, so users can see the starting board.
reset_screen
puts game.board_visualization
sleep(1)

# Play the game.
until game.finished?
  # Do this each round until the game is finished.

  # Move each player forward.
  game.players.each do |player|
    game.advance_player(player)
  end

  # Now that each player has moved,
  # reprint the board with the new player positions
  # and pause so users can see the updated board.
  reset_screen
  puts game.board_visualization
  sleep(0.2)
end

# Once the game is finished, report the winner.
puts "Player '#{game.winner}' wins!"
