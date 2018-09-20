class Screening
  attr_reader :movie_title, :start_time

  def initialize(args)
    @movie_title = args.fetch(:movie_title)
    @start_time  = args.fetch(:start_time)
  end
end
