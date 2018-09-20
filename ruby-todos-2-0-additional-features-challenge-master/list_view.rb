module ListView
  def self.render(list)
    list.items.map { |item| formatted_item(item) }.join("\n")
  end

  private
  ITEM_COMPLETE_MARKER = "[X]"
  ITEM_INCOMPLETE_MARKER = "[ ]"

  attr_reader :list

  def self.formatted_item(item)
    "#{marker_for(item)} #{item.description}"
  end


  def self.marker_for(item)
    item.complete? ? ITEM_COMPLETE_MARKER : ITEM_INCOMPLETE_MARKER
  end
end
