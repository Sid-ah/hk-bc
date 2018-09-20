class Screen
  attr_reader :number
  attr_accessor :screenings

  def initialize(args)
    @number = args.fetch(:number)
    @screenings = args.fetch(:screenings, Array.new)
  end

  def <<(screening)
    screenings << screening
  end

  def cancel(args)
    self.screenings = screenings.reject do |screening|
      screening.start_time == args[:start_time] &&
      screening.movie_title == args[:movie_title]
    end
  end
end
