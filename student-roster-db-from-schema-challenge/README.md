# Write a Class Backed by a Database

## Summary
| Ruby | SQL |
| :--- | :--- |
| a class named `Student` | a table named `students` |
| instances of the `Student` class | records/rows in the `students` table |
| attributes of `Student` objects | fields/columns on the `students` table |

*Table 1.*  Mapping Ruby objects to database tables.

We've spent some time working with databases using raw SQL to create tables and to create, retrieve, update, and delete records.  Now we're going to begin using Ruby to interact with the database.  At the end of this challenge, we'll have built a `Student` class that is backed by a `students` table in our database (see Figure 1 to see how Ruby objects map to database tables).

| Ruby Method | SQL Query |
| :--- | :--- |
| `Student.all` | `SELECT * FROM students;` |
| `Student.find(5)` | `SELECT * FROM students WHERE id = 5;` |
| `Student.where({ first_name: 'bob' })` | `SELECT * FROM students WHERE first_name = 'bob';` |
| `new_student_instance.save` | `INSERT INTO students (first_name, ...) VALUES ('Jane', ...);` |

*Table 2.*  Example Ruby methods and comparable SQL queries.

As we progress through Dev Bootcamp, we'll eventually come to rely on the Active Record gem to provide our classes with behaviors for interacting with a database.  After learning some SQL, this challenge is another step in that direction.

We are going to define a `Student` class.  We will write methods that mimic the behaviors provided by ActiveRecord; in other words, we will recreate a scoped down version of the interface that Active Record provides—we won't recreate all the methods, just a sample.

Just as Ruby classes and database tables correlate, the methods we're going to write in this challenge are the Ruby counterparts to common SQL queries that we would run (see Table 2).


### Class Methods
Some of the methods we write will be class methods.  The class methods will generally have the responsibility of retrieving records from the database and creating student objects based on the data.  We've already seen that a class is responsible for creating instances of itself through the `.new` class method (e.g., `Array.new`).  The class methods we'll write in our `Student` class will provide an expanded interface for instantiating students.


### Instance Methods
We will also write two instance methods: `#save` for saving records (inserting or updating) and `#delete` for deleting records.  In addition, we'll need to provide some accessor methods for object attributes.


## Releases
### Pre-release: Ensure SQLite3 Gem is Installed
```
gem install sqlite3
```
*Figure 1*. Installing the SQLite3 gem.

We will be using the SQLite3 gem to connect to and interact with our database.  Before we begin this challenge, let's ensure that the [Ruby gem for SQLite](https://github.com/luislavena/sqlite3-ruby) is installed.  From the command line, run the code in Figure 1.


### Release 0: Create a Students Table in the Database
```ruby
require 'sqlite3'

$db = SQLite3::Database.new("database.db")
$db.results_as_hash = true
```
*Figure 2*.  The code in `config.rb` configures the database connection.

The file `config.rb` establishes a connection with our database and configures how records are returned (see Figure 2).  In this file we're creating a global variable, `$db` and assigning it the value of a `SQLite3::Database` object.  Our interactions with the database will be handled by this database object.

The argument we pass to `.new` is the name of the database file to which we want to connect—if the file does not exist, it will be created.  In other words loading or requiring this file will create our database.

We do need to create a table in that database to store our data.  The code to do this is provided in the file `student_db_setup.rb`.  The file provides a module with a `.create_students_table` method.  Within this method we call the [`Database#execute`](http://www.rubydoc.info/gems/sqlite3/1.3.10/SQLite3/Database#execute-instance_method) method on our `$db` variable, passing a string of SQL that creates a table; we'll be using this `#execute` method when we need to execute a SQL query.

```
$ irb
:001 > load 'student_db_setup.rb'
:002 > StudentDBSetup.create_students_table
:003 > exit
```
*Figure 3*.  In IRB, loading and running the code to create the students table.

To create the table we need to execute the `.create_students_table` method.  Let's open IRB, load the file and call the method.  In Figure 3, we begin an IRB session and then load the `student_db_setup.rb` file.  As a result, the `StudentDBSetup` module will be available to us.  We continue by calling `StudentDBSetup.create_students_table`, which creates a `students` table in our database.

At this point we should have a database with a `students` table. To verify this, from the command line, open up the SQLite3 console with the `database.db` database and take a look at the schema.  Does it match our expectations based on the SQL query in the `.create_students_table` method?


### Release 1: Creating a Student Class
Now it's time to build our class. We're going to begin by creating a normal Ruby class.  We want to be able to instantiate new `Student` objects and set the values of their attributes:  first name, last name, gender, birthday, email address, and phone number—notice that these match up with the columns in the `students` table.

```
$ rspec --example "object attributes"
```
*Figure 4*. Running the tests for student attributes.

Tests for these attributes have been written in the example group labeled `"object attributes"`.  Make these tests pass before moving on to the next release (see Figure 4).


### Release 2: Attributes Related to Persistence
In *Release 0* we created a `Student` class whose attributes matched some of the columns in our `students` table.  But, our table has a few additional columns that we haven't addressed:  `id`, `created_at`, and `updated_at`.  We're going to add these attributes to our `Student` class.

When we pull a row of data from our `students` table, we'll use it to create a `Student` object, and we want to be able to ask the object for its id, the time it was first saved to the database (`created_at`), and the time it was last updated in the database (`updated_at`).

However, we don't want to assign these attributes ourselves.  The values of these attributes should be based on the data in the database.  For example, ID's are set by the database automatically when we insert a new record; we don't want to set an ID ourselves.  Similarly, when we insert a new record into our database, we tell the database to use the current time (`DATETIME('now')`) for determining when an object was created and updated.  When we update a record in our database, we'll also tell the database to change the updated at time to reflect the current time.

Let's make sure that we can instantiate `Student` objects with ID's, the times they were created in the database, and the times they were last updated in the database.  Tests for these behaviors have been written in the example group labeled `"attributes related to persistence"`.


### Release 3: Make a Collection of Students from Data in the Database
```
Student.all
# => [ #<Student:0x007fb72ba034c8 @id=2, ... >,
       #<Student:0x007fb72ba00958 @id=3, ... >,
       #<Student:0x007fb72c2ff3d8 @id=7, ... > ]
```
*Figure 5*.  Returning a collection of all the students in the database using the `.all` method.

So far, our `Student` class has no connection to the database.  In this release we're going to add some behaviors to our class that will allow us to create `Student` objects based on the data in our database (see Figure 5 for example usage).

In the *Summary*, we mentioned that the `Student` class itself will be responsible for creating new instances of itself.  Now we're going to begin adding the behaviors that allow it to do so.  In this release, we'll write class methods that return collections of `Student` objects:

- `.all` returns a collection of all the students in the database.
- `.where` returns a collection of students from the database that match a given condition.
- `.all_by_birthday` returns a collection of all the students in the database sorted by birthday.

Tests have been provided in the example group labeled `"returning multiple students"`.


### Release 4:  Make a Single Student from Data in the Database
```ruby
Student.find(5)
# => #<Student:0x007fb72ba034c8 @id=5, ... >
```
*Figure 6*.  Returning a single student found by id.

In the previous release, we wrote methods that returned collections of students.  In this release, we're going to write a couple methods that return a single `Student` object (see Figure 6 for example usage):

- `.find` returns a student found in the database by its id.
- `.find_by_first_name` returns a student found in the database by first name.

Tests have been provided in the example group labeled `"returning a single student"`.


### Release 5:  Remove a Student from the Database
```ruby
student = Student.find(5)
# => #<Student:0x007fb72ba034c8 @id=5, ... >
student.delete

# ...

Student.find(5)
# => nil
```
*Figure 7*.  Removing student data from the database.

We can create `Student` objects based on data in our database, but we haven't looked at using Ruby to create and delete records.  In this release, we'll give instances of our `Student` class the behavior to remove data from the database.

In Figure 7 we create a `Student` object based on data in the `students` table—the row where the ID is five.  We want to remove that data, so we call `#delete` on the `Student` object.  As a result, the data where `id = 5` was removed from the database and we can no longer find a student with an ID of five.

Tests have been provided in the example group labeled `"removing data from the database"`.


### Release 6:  Save a Student to the Database
```ruby
student = Student.new(hash_of_student_data)
# => #<Student:0x007fb72ba034c8 @id=nil, ... >
student.id
# => nil
student.save
student.id
# => 16
```
*Figure 8*. Saving a `Student` object's data to the database.

The final behavior that we'll add to our `Student` class is writing data to the database.  If we create a `Student` object in Ruby, we want to be able to save that object's data in the database.  Also, if we update a student's name or birthday, we want to be able to save those changes as well.

We'll need to insert or update data into the database when we save, but we'll also need to update our Ruby objects.  We'll need to handle setting the attributes related to persistence that we dealt with in *Release 2*.

Tests have been provided in the example group labeled `"writing to the database"`.


### Release 7: Use the Student Class
```
$ irb
:001 > load 'config.rb'
:002 > load 'student.rb'
:003 > Student.all
:004 >
```
*Figure 9*. Loading and using the `Student` class in IRB.

We just built a class that interacts with a database.  Let's use it (see Figure 9).  Use the methods that we just wrote to create new records in the database, retrieve records from the database, and delete records from the database.

*Note:* If we want to load a few records into the database, we can use the `StudentDBSetup` module to seed the database with some student data, similar to how we asked it to create the `students` table for us in *Release 0*.


## Conclusion
In this challenge we've begun to move away from writing SQL.  We'll be working with databases throughout Dev Bootcamp, but we'll be seeing less and less SQL. The SQL will still be executed and we need to understand what it does, but it will be hidden behind Ruby.

Already with our `Student` class, we can work totally in Ruby but have SQL executed in the background.  We are still interacting with a database and ultimately SQL is being executed, but we only need to know which Ruby methods to call.
