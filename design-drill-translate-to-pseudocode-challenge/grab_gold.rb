# The grid is an array of arrays containing
# rocks and gold, something like this:
# [ [:R, :R, :G],
#   [:R, :G, :R],
#   [:R, :G, :G] ]

def grab_gold(grid)
  gold_satchel = []
  x, y         = 0, 0

  while y < grid.length
    current_sq  = grid[y][x]

    if current_sq == :G
      gold_satchel.push :G
      grid[y][x] = :R
    end

    if x == (grid[y].length - 1)
      x = 0
      y += 1
    else
      x += 1
    end
  end

  gold_satchel
end
