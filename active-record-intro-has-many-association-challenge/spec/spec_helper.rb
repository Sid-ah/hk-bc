# Set variable so that we connect
# to the test database.
ENV['AR_ENV'] = 'test'

require_relative '../config/environment'

require 'rspec'
require 'database_cleaner'


RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each) { DatabaseCleaner.start }
  config.after(:each)  { DatabaseCleaner.clean }
end
