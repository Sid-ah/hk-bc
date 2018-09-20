#Active Record Intro:  Code Base

## Summary
This challenge introduces the code base with which we'll be working as we become acquainted with Active Record, the object-relational mapper that we'll be using.  Before we jump into the challenges proper, we should take a look at this code base, familiarizing ourselves with the directory structure and what each part is doing.  This directory structure mimics the structures we'll see in our Phase 2 and 3 applications.


### Environment Configuration
Going forward, the setup of our applications will be a little more complex than it has been in previous challenges.  We're going to be more intentional about how we organize our files.  Also, we'll need to do some configuration (e.g., connecting to our database).  This code base—or skeleton—provides the configuration that we'll need to interact with a database using Active Record; however, we should understand what it's doing.

The configuration of our application is done in the file `config/environment.rb`.  It requires all the gems and Ruby libraries that we'll be using.  It loads all of our model files and sets up the database connection.  Take some time to look through the code.  We'll probably find something new, like the [`Pathname`][Ruby Docs Pathname] and [`Dir`][Ruby Docs Dir] classes and the configuration of `ActiveRecord::Base` to connect with the database.  It's okay if not all of this makes perfect sense right now, but we should have the gist of what's happening ... if not exactly how.


### Rakefile
```
$ bundle exec rake -T
```
*Figure 1*.  Listing available Rake tasks.

The code base also supplies a Rakefile, providing us with a number of helpful tasks to get our application up and running.  Defining Rake tasks save us time by automating tasks that we regularly do.  The tasks defined in this Rakefile mimic the tasks that we'll be working with moving forward at Dev Bootcamp (see Figure 1 for how to list available tasks).

- `rake console`

  The console task opens IRB with our application's environment loaded:  the models are available, the connection with the database is established, etc.  Whereas before we would interact with our database from the command line by running `SQLite3`, now we'll use the rake console.


- `rake spec`

  The spec task will run all of the spec files in our application (i.e., run the tests).  It's an alternative to the `rspec` command.

- `rake db:taskname`

  The Rakefile includes a `:db` namespace that encapsulates a number of tasks related to the database:  `create`, `drop`, `migrate`, `rollback`, `seed`, and `version`.  We'll become very familiar with these tasks over the course of Dev Bootcamp.

- `rake generate:taskname`

  Just like the `:db` namespace, the `:generate` namespace encapsulates tasks for creating or generating files:  `model` for creating files for Active Record models, `migration` for creating files for updating our database, and `spec` for creating test files for our models.


### Model-view-controller Organization
This code base is setup for implementing the model-view-controller design pattern.  The files for each will be located in individual folders under `app/`.  As we begin working with Active Record, we won't work much with controllers and views, rather we'll focus on working with Active Record models.

All of the model classes that we write will be located within the `app/models` folder.  Each class should be defined in its own file.  As an example, a `Dog` class has been written in the file `app/models/dog.rb`. This folder can contain both our Active Record models (i.e., the classes backed by the database) and also our normal Ruby classes.


### Database
The `db/` directory is where files associated with our database are located.  Our SQLite3 database will be located in this directory after we've created it.

We'll be creating files called *migrations* that help to build our database schema (e.g., creating tables).  All of the migrations that we write will be located within the `db/migrate` folder:  one migration for each change to the database schema.  The `db:migrate` Rake task tells `ActiveRecord::Migrator` to look here for migration files.  An example migration file, `20140901164300_create_dogs.rb`, has been provided—it will create a dogs table in our database.

Sometime we'll want to populate our database with data, so that we can use it or manually test it.  To do so, we can open the rake console and add records, or we could write a script to do it for us.  We can write Ruby code in the `seeds.rb` file.  The code is then executed through the Rake task:  `rake db:seed`.  An example seeds file has been provided that adds a couple dogs to the database.


### Organizing Test Files
All of our testing files will be located within the `spec/` directory.  All of the specs can be run with the `spec` Rake task.  An example spec file has been provided:  `spec/schema/dogs_table_spec.rb`.


### Specifying Gems
The `Gemfile` and `Gemfile.lock` files specify the gems used in this application.  Bundler will use these files to install required gems if they're not installed on our system and to determine which version of a gem to use.


## Releases

### Release 0:  Installing Gems
This challenge is more like a tutorial.  It is designed to give exposure to working with Bundler, Rake tasks, and the console.  To begin, we're going to make sure that we have the required gems installed on our system.

```
$ gem install bundler
```
*Figure 2*.  Installing the Bundler gem.

We're going to use Bundler to install gems and to determine which versions of gems to use.  We first need to make sure that it's installed on our system (see Figure 2).

```
$ bundle install
```
*Figure 3*.  Installing gems listed in the Gemfile.

When bundler is installed, it provides a command-line utility.  We can use this utility to install any necessary gems that are missing from our system (see Figure 3).  Because the code base provides a `Gemfile.lock` file, Bundler will use this file to determine exactly which version of each gem to install.  We'll begin most of our challenges going forward with this step of ensuring that all necessary gems are installed.

*Note:*  The `Gemfile.lock` file is generated by Bundler; we should not edit this file ourselves.


### Release 1:  Create the Database
```
$ bundle exec rake db:create
```
*Figure 4*.  Executing the Rake task for creating the database.

Our next step is to create the database for our application.  Run the Rake task for creating the database (see Figure 4).  This task will create the SQLite3 database file in the `db/` directory.  Prefacing our command with `bundle exec` executes the command within the context of the gems specified for this application (i.e., we use the right version of the gems).

*Note:* We'll actually be creating two databases at the same time.  One for development, which we'll use in the console and when running an application.  Another strictly for testing.


### Release 2:  Check Database Version
```
$ bundle exec rake db:version
```
*Figure 5*.  Executing the Rake task for checking the database version.

We'll be creating migrations that change our database by adding or dropping tables, adding columns, changing column names, etc.  Active Record will keep track of which migrations it's run—this is done based on a file naming convention that we'll address later.

We can determine the last migration to have run by asking for the version of the database (see Figure 5).  In our case, we haven't run any migrations, so we should see something like `Current version: 0`.


### Release 3:  Run the Test Suite
```
$ bundle exec rake spec
```
*Figure 6*.  Executing the Rake task for running the test suite.

As mentioned in the *Summary*, the Rake spec task is an alternative to the rspec command for running the test suite (see Figure 6).  In our app, we have a `spec/schema/dogs_table_spec.rb` file that tests the structure of our database.  According to the tests, there should be a `dogs` table with a series of expected columns (i.e., columns that are properly named and of the right type).  Because we've yet to run any migrations, all the tests should fail.


### Release 4:  Run the Migrations
```
$ bundle exec rake db:migrate
```
*Figure 7*.  Executing the Rake task for running the database migrations.

As mentioned, a migration file that creates a dogs table in our database has been provided.  We can run our migrations with the `db:migrate` Rake task (see Figure 7).  When we run this task, any migration files that have yet to be run, will be run.

Let's take a look at the output in the console.  The first line of output should read something like `CREATE TABLE "schema_migrations" ("version" ... )`.  Active Record is creating a table where it can track which migrations have been run, using the timestamp from the filename as an identifier.  The last bit of SQL run should read something like `INSERT INTO "schema_migrations" ("version") VALUES (?)  [["version", "20140901164300"]]`.  Active Record is noting that it's run our migration file, so that it won't run it again.

In the middle of the output, we should see a line similar to `Migrating to CreateDogs (20140901164300)`.  Active Record is letting us know which migration is being run.  And a few lines after this one, we find the SQL statement that is executed:  `CREATE TABLE "dogs" ("id" INTEGER ... "updated_at" datetime NOT NULL)`.  Finally, Active Record lets us know that it's done with this migration:  `20140901164300 CreateDogs: migrated (0.0028s)`.


### Release 5:  Check Database Version
Now that we've run our migration, the database version should no longer be `0`.  When we run the Rake task to check the database version, Active Record will check the `schema_migrations` table and let us know the the timestamp of the last migration that was run.  We should see something like `Current version: 20140901164300`.  Remember, this version number is taken from the timestamp at the beginning of our migration's filename:  `20140901164300_create_dogs.rb`.


### Release 6:  Run the Test Suite
Now that we've run our migration to create the dogs table, all of our tests should pass—the provided `CreateDogs` migration matches the specs.  Let's run the tests again; all of the tests should pass.


### Release 7:  Populate the Database with Seed Data
```
$ bundle exec rake db:seed
```
*Figure 8*.  Executing the Rake task to seed our database.

We'll begin referring to putting data into our database as seeding the database.  We can write scripts that add data for us in the file `db/seeds/rb`.  An example file is provided that saves two dogs to our database.

A Rake task is provided to execute the code in the seeds file (see Figure 8).  As the file is read in, the code executes.  Active Record is set up to log its activity, and, if we read through the output in the console, we can see that two SQL `INSERT` statements were executed - one for each dog.  For example something like, `INSERT INTO "dogs" ("name", ... ) VALUES (?, ... )  [["name", "Jayda"], ... ]`.


### Release 8:  Open and Use the Console
```
$ bundle exec rake console
```
*Figure 9*.  Executing the Rake task to open the console.

We can open IRB with our environment loaded (see Figure 9).  We'll refer to this as the *console*.  Here we can interact with our models:  selecting records from the database, inserting new records, destroying records, etc.

  To sample what we can do from within the console, run ...

  -  `ActiveRecord::Base.connection.tables`

      This returns an array containing the names of the tables in our database.

  -  `ActiveRecord::Base.connection.columns(:dogs)`

      This returns an array of objects representing the columns in the `dogs` table—one object for each column.  The objects themselves happen to be instances of the `ActiveRecord::ConnectionAdapters::Column` class.

  -  `Dog`

      This will return the `Dog` class itself, and we will see in parentheses a list of attribute names and types that are associated with instances of `Dog`.  Active Record derives these attributes from the columns in the `dogs` table in our database.

  - `Dog.all`

      `Dog::all` is a class method that returns all of the records in the `dogs` table as instances of the `Dog` class.  The individual instances are returned within a collection, an `ActiveRecord::Relation` object that acts much like an array.  In the console output, we can see the SQL statement that was executed: `SELECT "dogs".* FROM "dogs"`.

  - `exit`

     This will exit the console, just like IRB.  Alternatively, use *control + d*.


### Release 9:  Rollback the Database
```
$ bundle exec rake db:rollback
```
*Figure 10*.  Executing the Rake task to undo the last migration.

Sometimes we want to undo a change to our database—undo a migration.  We call this rolling back the database, and we have a Rake task to handle this (see Figure 10).

The default behavior of the Rake task is to undo the last migration, but you could specify multiple steps.  In executing this task, Active Record pulls the last timestamp from the `schema_migrations` table, found the `change` method defined there, and undid it.  In our case, the `CreateDogs` migration creates the `dogs` table.  So, to rollback this migration, Active Record would drop the `dogs` table.  As a side effect, any data in the table was lost.

When we run the rollback task, we can see in the output that Active Record executed the SQL statement `DROP TABLE "dogs"`.  It also updated the `schema_migrations` table, so that it no longer has a record of running our migration:  `DELETE FROM "schema_migrations" WHERE ... "version" = '20140901164300'`.

### Release 10:  Drop the Database
```
$ bundle exec rake db:drop
```
*Figure 11*.  Executing the Rake task to drop the database.

Sometimes we'll decide to get rid of our database completely, though this shouldn't become a habit.  If we do want to remove our database we can drop it with a Rake task (see Figure 11).  Our SQLite3 database file will be removed.


### Release 11:  Reflect

Once we've worked through Release 0 to 10, we should checkout a new branch and create a file in the root directory:  `reflections.txt`.  Let's reflect on what we've learned through this challenge and write our learnings in the file.  Then commit our changes, push our branch, and submit a pull request.


## Conclusion
This challenge was designed to get us working with the code base that we'll be using as we proceed through Dev Bootcamp.  We'll grow accustomed to bundling, running Rake tasks, opening the console, etc.  We've also been exposed to a little bit of what Active Record does for us and how we interact with it, though this might be confusing at the moment.  The challenges that follow will focus on developing our understanding of specific aspects of Active Record.

[Ruby Docs Pathname]: http://www.ruby-doc.org/stdlib-2.1.2/libdoc/pathname/rdoc/Pathname.html
[Ruby Docs Dir]: http://www.ruby-doc.org/core-2.1.2/Dir.html
