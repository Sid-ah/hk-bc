# ORM: Object Relational Mappers

Written by [Torey Hickman](https://github.com/toreyhickman).
 
## Introduction

We've had practice modeling real-world systems in both Ruby and relational databases.  In other words you might say, in Ruby-land and SQL-land.  In SQL-land, we model the state of our system—where the data will exist so that we can persist the state of our models.  We want to make use of the data in our databases in Ruby-land.  We don't want to just pull the data from the database; we want to create Ruby objects from the data 

In the same way that we've parsed text in a .csv or .txt file into `Person`, `Task`, and `Flashcard` objects in Ruby, the data from our database needs to be translated into Ruby objects.  For example, the records in a `dogs` table should be used to create instances of the `Dog` class in Ruby.  

![Dogs in Ruby and SQL](dogs.gif)

*Figure 1.* Ruby `Dog` objects created from data in the `dogs` table in the database.

Figure 1 shows the two `Dog` objects that could be created from the data in a `dogs` table.  Remember the mapping between Ruby-land and SQL-land:  Ruby classes to database tables, instances of the class to table rows, and instance variables to table columns.

How do we get from our Ruby program wanting objects (e.g., all the dogs in the database, to SQL pulling the data from the database, and back to Ruby with the desired objects?  We use an *Object Relational Mapper* (ORM), software that maps the data in our databases to the objects that we want in Ruby.

## Translating SQL and Ruby

![Modeling in SQL and Ruby](sql-ruby-model.gif)

*Figure 2.*  Modeling the same system in SQL-land and Ruby-land.

Figure 2 represents the same conceptual model of a real-world system being modeled in both SQL and Ruby.  Our program will be running in Ruby-land, but it will need to interact with SQL-land, where the data our program needs resides.  Our program will be written in Ruby, but the database communicates in SQL.  Our Object Relational Mapper will take Ruby messages, translate them into SQL, receive the query results, and turn those results into Ruby objects (see Figure 3).

![ORM Process](animated-orm.gif)

*Figure 3.*  Object Relational Mapper translating Ruby to SQL and back to Ruby.

## Where is the ORM?

When we took the data from a .csv file and turned it into Ruby objects, we made use of Ruby's `CSV` library.  Ruby's `CSV` class allowed us to easily read from and write to a .csv file, but it didn't create objects for us.  While the library understood how to interact with a .csv file (e.g. the class methods `CSV::foreach` or `CSV::readlines`), we had to write our own methods that created the Ruby objects (see Figure 4).

```ruby
# Parsing module intended for extending classes
module Parsing
  require 'csv'
  
  def parse_csv(filename)
    CSV.readlines(filename, headers: true).map do |object_data|
      self.new(object_data)
    end
  end
end

class Recipe
  extend Parsing
  
  def initialize(args)
    # assign instance variables
  end
end
```

*Figure 4.* `Recipe` class with the ability to parse recipes from a .csv file.

In essence, we wrote an Object Relational Mapper.  Only, it mapped between Ruby and a .csv file.  The logic for how to do the mapping, the ORM, resides in the `Parsing::parse_csv` method.

Similarly, when we build our Object Relational Mapper to communicate with a database, we'll be depending on another library to interface with the database.  In this case, we'll use the [sqlite3 gem](https://rubygems.org/gems/sqlite3).  It will perform the same function as the `CSV` library did for us.  When we need to interact with the database—creating, reading, updating, and deleting records—we'll use a `SQLite3::Database` object to do so.

We will then write Ruby methods that tell the `SQLite3::Database` object to perform specific interactions with the database.  It will get the results from the database, and we'll have to take those results and turn them into the appropriate Ruby objects—just as we did with the results the `CSV` library gave us (see Figure 4 where for each row of csv data, `self.new` is called to instantiate the Ruby object).

```ruby
require "sqlite3"

# Set up database connection; creates database file if it doesn't exist
$db = SQLite3::Database.new("animal_shelter.db", results_as_hash: true)

# Create dogs table
$db.execute <<QUERY
CREATE TABLE dogs (
id INTEGER AUTO_INCREMENT PRIMARY KEY, 
name VARCHAR(64),
age INTEGER,
weight INTEGER);
QUERY
```

*Figure 5.* Creating a database with a dogs table using the SQLite3 gem.

In the case of the dogs example, we can create a database with a `dogs` table using the code in Figure 5.  At this point, we can use the `$db` object to execute SQL queries within our methods.

There are certain methods that we will want to write.  Methods that return all the dogs.  Methods that return the dogs where a certain condition is met.  Methods that return a specific dog.  Methods for creating new dogs.  

```ruby
# reliant upon the code in Figure 5

class Dog

  def self.all
    data_rows = $db.execute("SELECT * FROM dogs;")
    data_rows.map { |dog_data| Dog.new(dog_data) }
  end

  def initialize(args)
    @id = args[:id]
    @name = args[:name]
    @age = args[:age]
    @weight = args[:weight]
  end
end
```

*Figure 6.*  An example method for returning all records from a database table and creating a Ruby object from the data in each record.

Figure 6 shows an example method:  `Dog::all`.  Notice a couple things.  First, this is a class method.  The `Dog` class itself is responsible for getting the records from the database; in working with databases, we'll begin to write many more class methods than we have been.  Also, notice that once the results have been retrieved, they are then mapped into instances of the `Dog` class.  

This is the Object Relational Mapper—or at least, part of it.  We call a Ruby method:  `Dog::all`.  We get back Ruby objects based on the data in the `dogs` table.  The ORM, working from within this method, executes a SQL query and does the converting of the SQL response into the Ruby objects.

## Conclusion

Over the next couple days, we'll be writing our own Object Relational Mapping software.  Once we develop an understanding of how the ORM works, we'll graduate to working with [ActiveRecord](https://rubygems.org/gems/activerecord), the Rails Object Relational Mapper.  We'll be working with ActiveRecord during the last few days of Phase 1 and throughout Phases 2 and 3.  But, before we get there, we want to understand some of what it's doing under the hood.
