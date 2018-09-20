class List
  attr_reader :items

  def initialize(args = {})
    self.items = args.fetch(:items, Array.new)
  end

  def delete(target)
    item_to_delete = find(target)
    self.items = items.reject { |item| item == item_to_delete } if item_to_delete

    item_to_delete
  end

  def empty?
    items.empty?
  end

  def find(target)
    items.find { |item| item.match?(target) }
  end

  private
  attr_writer :items
end
