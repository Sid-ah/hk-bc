## Executing SQL using Ruby

### Example - table setup and population

```ruby
require 'sqlite3'

$db = SQLite3::Database.new "store.db"

module StoreDB
  def self.setup
    $db.execute(
      <<-SQL
        CREATE TABLE products (
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name VARCHAR(64) NOT NULL,
          description VARCHAR(250) NOT NULL,
          created_at DATETIME NOT NULL,
          updated_at DATETIME NOT NULL
        );
        # I might have other statements to fully create the db here.
      SQL
    )
  end

  def self.seed
    $db.execute(
      <<-SQL
        INSERT INTO products 
          (name, description, created_at, updated_at)
        VALUES
          ('spoon', 'Utensil for eating ice cream', DATETIME('now'), DATETIME('now')),
          ('fork', 'Utensil for eating stuff', DATETIME('now'), DATETIME('now')),
          ('knife', 'Utensil for cutting things', DATETIME('now'), DATETIME('now'));
          # I can insert more data here
      SQL
    )
  end
end

StoreDB.setup
StoreDB.seed
```

### Example - retrieve object (select)

```ruby
require 'sqlite3'

$db = SQLite3::Database.open "store.db"

class Product

  attr_reader :id
  attr_accessor :name, :description
  
  COLUMNS = [:id, :name, :description]

  def initialize(data)
    @id = data[:id]
    @name = data[:name]
    @description = data[:description]
  end
  
  def self.retrieve(id)
    result = []
    $db.execute("select * from products where id = #{id}") do |row|
      result << Product.new(Hash[COLUMNS.zip(row)])
    end
    result
  end
end

puts Product.retrieve(1).inspect
```

## Protecting Data (or how to prevent SQL injection)

Above is one way I can do a select.  But it leaves our database vulnerable to attack.  

### What is SQL Injection?

![SQL Injection Funny](http://imgs.xkcd.com/comics/exploits_of_a_mom.png)

SQL Injection is where someone can inject sql statements into your existing sql statements because they are insecure.  They can thus gain access to potentially sensitive data in your database.  

I could get a string into the product query since I am using string concatenation to build my query

```ruby
    id = "1;  DROP TABLE products;"
    $db.execute("select * from products where id = #{id}")
```

Oops!  What does this do?

### How can you guard against it?

Instead, use placeholders (this the question mark).  This data is sent to the database separately and not concatenated into a sql statement as shown above.  

```ruby
require 'sqlite3'

$db = SQLite3::Database.open "store.db"

class Product

  attr_reader :id
  attr_accessor :name, :description
  
  COLUMNS = [:id, :name, :description]

  def initialize(data)
    @id = data[:id]
    @name = data[:name]
    @description = data[:description]
  end
  
  def self.where(statement, *values)
    result = []
    $db.execute("select * from products where #{statement}", values) do |row|
      result << Product.new(Hash[COLUMNS.zip(row)])
    end
    result
  end
end

puts Product.where("id = ?", 1).inspect
```