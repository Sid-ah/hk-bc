require_relative "../item"
require_relative "../list"
require_relative "../item_parser"
require_relative "../item_writer"
require_relative "../list_view"
require_relative "../list_controller"

RSpec.configure do |r|
  TEST_DATA_FILENAME = "spec/support/test_item_data.txt"
end
