class Theater
  attr_reader :name, :screens

  def initialize(args)
    @name = args.fetch(:name)
    @screens = args.fetch(:screens, Array.new)
  end
end
