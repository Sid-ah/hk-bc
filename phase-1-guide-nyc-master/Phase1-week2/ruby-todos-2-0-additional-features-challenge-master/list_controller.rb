class ListController
  class NoFilenameError < StandardError; end
  class NoParserError < StandardError; end
  class NoWriterError < StandardError; end
  class UnsupportedCommand < StandardError; end

  attr_reader :filename, :parser, :writer

  def initialize(args = {})
    @filename = args[:filename] || raise(NoFilenameError, "A list controller needs a filename where item data can be persisted.")
    @parser = args[:parser] || raise(NoParserError, "A list controller needs a parser to read from the data file.")
    @writer = args[:writer] || raise(NoWriterError, "A list controller needs a writer to write to the data file.")
  end

  def run(command, option = nil)
    case command
    when "add"      then add(option)
    when "list"     then display_list
    when "remove"   then remove(option)
    when "complete" then complete(option)
    else raise(UnsupportedCommand, "The command \"#{command}\" is invalid.")
    end
  end

  private
  def items
    @items ||= parser.parse(filename)
  end

  def add(description)
    item = Item.new(description: description)
    writer.append(filename, item)

    appended_message(item)
  end

  def appended_message(item)
    "Appended \"#{item.description}\" to the list."
  end

  def complete(target_text)
    item_to_complete = list.find(target_text)

    if item_to_complete
      item_to_complete.mark_complete
      writer.write(filename, list.items)
      marked_complete_message(item_to_complete)
    else
      no_match_message(target_text)
    end
  end

  def display_list
    ListView.render(list)
  end

  def list
    @list ||= List.new(items: items)
  end

  def marked_complete_message(item)
    "Marked \"#{item.description}\" as complete."
  end

  def no_match_message(target_text)
    "No item matching \"#{target_text}\" could be found."
  end

  def remove(target_text)
    removed_item = list.delete(target_text)

    if removed_item
      writer.write(filename, list.items)
      removed_message(removed_item)
    else
      no_match_message(target_text)
    end
  end

  def removed_message(item)
    "Removed \"#{item.description}\" from the list."
  end
end
