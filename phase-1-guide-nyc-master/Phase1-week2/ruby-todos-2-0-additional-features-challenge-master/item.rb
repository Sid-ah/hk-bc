class Item
  class InvalidItemDescription < StandardError; end

  attr_reader :description

  def initialize(args = {})
    self.description = args[:description]
    self.complete = args[:complete]
  end

  def complete?
    @complete
  end

  def incomplete?
    !complete?
  end

  def mark_complete
    self.complete = true
  end

  def match?(text)
    description.match(/#{text}/i) ? true : false
  end

  private
  def complete=(status)
    @complete = !!status
  end

  def description=(description)
    raise InvalidItemDescription unless description && !description.empty?
    @description = description
  end
end
