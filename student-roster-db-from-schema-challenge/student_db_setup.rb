require_relative 'config'

module StudentDBSetup
  def self.create_students_table
    # Drop the table if it exists ... we'll recreate it.
    $db.execute("DROP TABLE IF EXISTS students")

    # Create the students table.
    $db.execute(
      <<-QUERY_STRING
        CREATE TABLE students (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          first_name VARCHAR(64) NOT NULL,
          last_name VARCHAR(64) NOT NULL,
          birthday DATETIME NOT NULL,
          gender VARCHAR(32),
          phone VARCHAR(32),
          email VARCHAR(64),
          created_at DATETIME NOT NULL,
          updated_at DATETIME NOT NULL
        );
      QUERY_STRING
    )
  end

  def self.seed
    #Delete existing records from the students table before inserting these new records; we'll start from scratch.
    $db.execute("DELETE FROM students")

    # Insert records.
    $db.execute(
      <<-QUERY_STRING
        INSERT INTO students
          (first_name, last_name, birthday, created_at, updated_at)
        VALUES
          ('Brick','Thornton', DATETIME('1971-07-04'), DATETIME('now'), DATETIME('now')),
          ('Alyssa','Diaz', DATETIME('1977-07-04'), DATETIME('now'), DATETIME('now')),
          ('Matt','Jones', DATETIME('1978-07-04'), DATETIME('now'), DATETIME('now')),
          ('Matt','Baker', DATETIME('1984-07-04'), DATETIME('now'), DATETIME('now')),
          ('Lauren','Scott', DATETIME('1990-05-04'), DATETIME('now'), DATETIME('now')),
          ('Dave','Hoover', DATETIME('1974-07-04'), DATETIME('now'), DATETIME('now'));
      QUERY_STRING
    )

  end
end
