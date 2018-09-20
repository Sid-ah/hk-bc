require_relative "item"
require_relative "item_parser"
require_relative "item_writer"
require_relative "list"
require_relative "list_view"
require_relative "list_controller"

if ARGV.any?
  DATA_FILENAME = "todo_list_data.txt"

  command = ARGV[0]
  option = ARGV[1]

  controller = ListController.new(filename: DATA_FILENAME, parser: ItemParser, writer: ItemWriter)

  puts controller.run(command, option)
end
