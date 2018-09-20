require_relative 'grab_gold'

grid = [
  [:R, :R, :G],
  [:R, :G, :R],
  [:R, :G, :G]
]

gold_pieces = grab_gold(grid)

puts "We grabbed #{gold_pieces.count} pieces of gold!"
