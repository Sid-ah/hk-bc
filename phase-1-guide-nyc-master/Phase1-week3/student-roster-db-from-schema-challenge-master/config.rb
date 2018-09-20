require 'sqlite3'

$db = SQLite3::Database.new "database.db"
$db.results_as_hash = true
