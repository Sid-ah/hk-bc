# Many To Many Schema To Database 
 
##Learning Competencies 

* Use sqlite gem to create a database using Ruby commands
* Use sqlite gem to perform CRUD operations on tables in a database using Ruby commands

##Summary 

 Build a database that represents a many to many relationship.

Revisit the [Design Your Own Many-To-Many Schema](../../../database-drill-many-to-many-schema-challenge)  and write a ruby program to create Objects to represent the relationships and create the database.

##Releases

###Release 0 : Create the database

Create the SQL Schema that represents your database tables.  Then, create a file called  `setup.rb` which you will run only once and will create your database.  
All other parts of your code will assume that the database has already been created.

Populate this database with dummy data.

To create the dummy data, use the Faker gem. You will need to download it and reference it in your ruby app. Look up the gem to see how to install and use it!


###Release 1 : Build the Ruby classes

Create classes that correspond to your tables, e.g., a "contacts" table corresponds to a Contact class.  These classes should have factory methods that allow you to add, delete, update records in the database. 

#### Manipulate the data in Ruby

Next, create a program that allows you to complete 5 meaningful tasks on your data.   Write the specs for these tasks first, then write code to make the specs work.

Make sure your code is following OO principles.

Submit your code in the `many_to_many`.rb file.
 

<!-- ##Optimize Your Learning  -->

##Resources

* [Ruby gem for SQLite](https://github.com/luislavena/sqlite3-ruby)
* [SQLite 3](http://sqlite-ruby.rubyforge.org/sqlite3)

