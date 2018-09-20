require 'pathname'
require 'sqlite3'

APP_ROOT = Pathname.new(File.dirname(File.expand_path(__FILE__)))

# This converts a Hash with Strings as keys to a Hash with symbols as keys
# If a key doesn't response to to_sym, do nothing
class Hash
  def symbolize_keys
    dup.symbolize_keys!
  end

  def symbolize_keys!
    keys.each do |key|
      self[(key.to_sym rescue key) || key] = delete(key)
    end
    self
  end
end

require APP_ROOT.join('models', 'database_model')
require APP_ROOT.join('models', 'student')
require APP_ROOT.join('models', 'cohort')

Database::Model.database = APP_ROOT.join('db', 'students.db')
