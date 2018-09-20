module ItemWriter
  def self.append(filename, item)
    open(filename, "a") do |file|
      add_item_to_file(file, item)
    end
  end

  def self.write(filename, items)
    open(filename, "w") do |file|
      items.each { |item| add_item_to_file(file, item) }
    end
  end

  private
  COMPLETE_MARKER = "[X]"
  INCOMPLETE_MARKER = "[ ]"

  def self.add_item_to_file(file, item)
    file << "#{marker_for(item)} #{item.description}\n"
  end

  def self.marker_for(item)
    item.complete? ? COMPLETE_MARKER : INCOMPLETE_MARKER
  end
end
