require_relative 'quad_stage_directions'

actors = [:blue, :green, :red, :yellow]

quad_stage_directions(actors).each { |actors_on_stage| puts actors_on_stage.inspect }
