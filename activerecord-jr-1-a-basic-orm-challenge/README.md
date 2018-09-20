# ActiveRecord Jr 1 A Basic ORM

##Learning Competencies

* Use Ruby commands to encapsulate standard SQL CRUD operations on a relational database
* Abstract a pattern for a model after identifying repetitions in code and relationships in data
* Organize code for consistency and readability
* Use database tools (like sqlite3) to view data and test outcomes of Ruby code
* Build rspec tests for existing code

##Summary

 In previous challenges we've drawn a map between Ruby World and SQL World that looked something like this:

<table class="table table-striped table-bordered">
  <tr>
    <th>SQL World</th>
    <th>Ruby World</th>
  </tr>
  <tr>
    <td>A table named <code>politicians</code></td>
    <td>A class named <code>Politician</code></td>
  </tr>
  <tr>
    <td>A row from <code>politicians</code></td>
    <td>An instance of <code>Politician</code></td>
  </tr>
  <tr>
    <td><pre>SELECT * FROM politicians WHERE party = 'D'</pre></td>
    <td><pre>Politician.where('party = ?', 'D')</pre></td>
  </tr>
  <tr>
    <td><pre>SELECT * FROM politicians WHERE id = 10</pre></td>
    <td><pre>Politician.where('id = ?', 10)</pre></td>
  </tr>
</table>

In SQL World we talk in terms of tables, rows, and relations.  In Ruby World we talk in terms of classes, objects, and associations.  The table above elucidates a kind of mapping that has a name: [Object-relational mapping](http://en.wikipedia.org/wiki/Object-relational_mapping) or ORM.

There are many libraries in Ruby which implement an ORM, including

* [ActiveRecord](http://guides.rubyonrails.org/active_record_querying.html), which is what Rails uses by default
* [Sequel](http://sequel.rubyforge.org/)
* [DataMapper](http://datamapper.org/)

The idea behind most Ruby ORMs is that your model classes inherit from a base class that implements the general functionality to interact with the database and any model-specific code lives in the model (child) class.  This can be tricky because the parent class doesn't know beforehand anything about the structure of your database.  How is it supposed to know that the class `Student` corresponds to the table `students`?

We're going to implement **ActiveRecord, Jr.** to get an idea of how one might build an ORM.  This will make it much easier to reason about how the real ActiveRecord works once we get there, and will answer many of your questions about how to organize database calls in your code.

#### Working with a Skeleton Application

This challenge starts with a base skeleton application which is located in the `source/active_record_jr` directory.
The skeleton code assumes there are two tables: `students` and `cohorts`.  A student belongs to a single cohort and a cohort has many students.

There are a lot of files in the skeleton, so start by exploring the code.  Here's what each file means:

<table class="table table-bordered table-striped">
  <tr>
    <th>Filename</th>
    <th>Description</th>
  </tr>
  <tr>
    <td><code>app.rb</code></td>
    <td>Loads all of ActiveRecord, Jr. and our application-specific code</td>
  </tr>
  <tr>
    <td><code>Gemfile</code></td>
    <td>A <a href="http://gembundler.com/" target="_blank">bundler</a> Gemfile, used to track the gems the app needs to run</td>
  </tr>
  <tr>
    <td><code>Gemfile.lock</code></td>
    <td>A misc. file related to the Gemfile</td>
  </tr>
  <tr>
    <td><code>models</code></td>
    <td>A directory containing all your model classes</td>
  </tr>
  <tr>
    <td><code>models/cohort.rb</code></td>
    <td>Contains the <code>Cohort</code> class</td>
  </tr>
  <tr>
    <td><code>models/database_model.rb</code></td>
    <td>Contains the <code>Database::Model</code> class, our "ActiveRecord, Jr."</td>
  </tr>
  <tr>
    <td><code>models/student.rb</code></td>
    <td>Contains the <code>Student</code> class</td>
  </tr>
  <tr>
    <td><code>Rakefile</code></td>
    <td>A list of <a href="http://en.wikipedia.org/wiki/Rake_%28software%29" target="_blank">rake</a> tasks, used to perform misc. one-off tasks like creating a database and seeding the database with dummy data</td>
  </tr>
</table>


##Releases

###Release 0 : Set up the Skeleton App

Run the following commands inside the `activerecord_jr` directory to start interacting with the code:

1.  **Run bundle**

    ```text
    $ bundle
    ```

    This will read the `Gemfile` and install all the necessary gems for your app to run.
2.  **Set up the database**

    ```text
    $ rake db:setup
    ```

    This will create a database in `db/students.db` and create the `students` and `cohorts` tables.  Read the `Rakefile` if you're curious how this works.
3.  **Populate the database**

    ```text
    $ rake db:seed
    ```

    This will populate your database with dummy cohort and student data.  It will fail if you don't run `rake db:setup` first.
4.  **Playtime!**

    ```text
    $ rake console
    ```

    This will drop you into an [IRB session](http://en.wikipedia.org/wiki/Interactive_Ruby_Shell) with all your application code loaded and working.  Try it out by running the below.  (BTW, "Ramon" may not be a student in your database because it is dynamically generated by a rake task.  You may need to try another common first name or peek in your .db file in sqlite3 to see who's there.)

    ```ruby
    ramons = Student.where('first_name = ?', 'Ramon')
    ramons.first[:first_name]

    cohort = Cohort.where('name = ?', 'Alpha').first
    cohort.students.count
    cohort.students.first[:email]
    ```

###Release 1 : Write Simple Tests

Before we refactor, we should write some simple tests.  They should exercise each of the methods that are in the `Student` and `Cohort` classes.  Once you have your tests that pass for the code you were given, you'll be more certain that your refactoring isn't inadvertently changing anything.  If you refactor and the tests now fail, you'll know something has changed.

`rake db:seed` should continue to work the same before and after your refactoring, for example.

To run your specs, navigate into the following folder:

```ruby
activerecord-jr-1-a-basic-orm-challenge/source/activerecord_jr
```
Just type the following command to run your spec files:

```ruby
> rspec
```
It will pick up all of your rspec tests in your spec folder and run them.

###Release 2 : Refactor Into the Base Class

There are three core files to this application:

1. `models/database_model.rb`
2. `models/student.rb`
3. `models/cohort.rb`

If you look at `student.rb` and `cohort.rb` you'll see they have tons and tons of code in common.  We're going to start by abstracting out the most simple of the common code into the base `Database::Model` class.

Be careful because the base class only knows what it's told.  `Database::Model` doesn't know that `Student` maps to the `students` table, for example.  Refactor out the following shared methods from `Student` and `Cohort` without doing anything to the `Student` and `Cohort` classes beyond removing the methods.  The code in the methods might need to change, though.

**NOTE: After each small incremental change you complete, run your specs.  Change one thing and make sure you are still green!  Avoid going down rabbit holes.**

1. Move `Student#initialize` and `Cohort#initialize` to `Database::Model#initialize`
2. Move `Student#save` and `Cohort#save` to `Database::Model#save`
3. Move `Student#[]` and `Cohort#[]` to `Database::Model#[]`
4. Move `Student#[]=` and `Cohort#[]=` to `Database::Model#[]`

Feel free to play around in the ActiveRecord, Jr. console to get a feel for how it works.  And **remember**, once a method is moved to `Database::Model` you might need to change hard-coded references to the classes the method came from.

##Optimize Your Learning

Discuss the following questions with your pair or answer in a journal entry:

  * What did these refactorings accomplish?
  * If we decided to add or remove a field in the database, how many changes on the code would you have had to make before? What about after?  What about other changes to the databases?
  * Using your new code, can you write a script to populate the database with dummy data?

##Resources

* [Object-relational mapping](http://en.wikipedia.org/wiki/Object-relational_mapping)
* [ActiveRecord](http://guides.rubyonrails.org/active_record_querying.html), which is what Rails uses by default
* [Sequel](http://sequel.rubyforge.org/)
* [DataMapper](http://datamapper.org/)
* [IRB session](http://en.wikipedia.org/wiki/Interactive_Ruby_Shell)
