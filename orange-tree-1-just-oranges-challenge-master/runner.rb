require_relative 'orange'
require_relative 'orange_tree'


tree = OrangeTree.new

# Let seasons pass until the tree is ready to bear fruit.
tree.pass_growing_season until tree.mature?


# Report yearly harvest information for the lifetime of the tree.
until tree.dead?
  tree.pass_growing_season

  harvested_oranges = []

  while tree.has_oranges?
    harvested_oranges << tree.pick_an_orange
  end

  average_orange_diameter = # Need to calculate the average diameter for this harvest.

  # This is a heredoc, a way to create a formatted multiline string.
  # http://makandracards.com/makandra/1675-using-heredoc-for-prettier-ruby-code
  puts <<-HARVEST_REPORT.gsub(/^ {4}/, '')
    YEAR #{tree.age} REPORT
    -----------------------
    Height: #{tree.height} feet.
    Harvest: #{harvested_oranges.size} oranges with an average diameter of #{average_orange_diameter} inches.


  HARVEST_REPORT
end

puts "Alas, the tree, she is dead!"
