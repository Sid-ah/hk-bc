```ruby
# no actors
quad_stage_directions([])
# => [[]]


# one actor
quad_stage_directions([:otter])
# => [[], [:otter]]


# two actors
quad_stage_directions([:nighthawk, :otter])
# => [[], [:nighthawk], [:nighthawk, :otter], [:otter]]


# three actors
quad_stage_directions([:coyote, :nighthawk, :otter])
# => [ 
#   [], 
#   [:coyote], 
#   [:coyote, :nighthawk], 
#   [:nighthawk], 
#   [:nighthawk, :otter], 
#   [:coyote, :nighthawk, :otter], 
#   [:coyote, :otter], 
#   [:otter]
# ]


# four actors
quad_stage_directions([:bison, :mantis, :nighthawk, :otter])
# => [
#   [],
#   [:bison],
#   [:bison, :mantis],
#   [:mantis],
#   [:mantis, :nighthawk],
#   [:bison, :mantis, :nighthawk],
#   [:bison, :nighthawk],
#   [:nighthawk],
#   [:nighthawk, :otter],
#   [:bison, :nighthawk, :otter],
#   [:bison, :mantis, :nighthawk, :otter],
#   [:mantis, :nighthawk, :otter],
#   [:mantis, :otter],
#   [:bison, :mantis, :otter],
#   [:bison, :otter],
#   [:otter]
#  ]
```
*Figure 1*.  Example output for various numbers of actors.