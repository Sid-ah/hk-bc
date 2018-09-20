# Congress Database 1 From Csv To Sqlite With Ruby
##Learning Competencies

* Use sqlite gem to create a database using Ruby commands
* Use sqlite gem to perform CRUD operations on tables in a database using Ruby commands

##Summary

 In this lab we will be using Ruby to create and manipulate a database from existing data.  To keep with our political theme, let's import [Sunlight Labs](http://sunlightlabs.com/) data of current U.S. Senators and Representatives into an SQLite database and do a little research.

After you import the database and get it running, you will run some queries against it from within the SQLite console and then create Ruby methods to run these queries from a script.

The Sunlight Labs database has already been copied and formatted as a CSV file and is included in this repository.

Sunlight labs also provides a bunch of great Ruby gems for accessing political info!  We'll be getting more into their gems later.  Here's an [article](http://tpmdc.talkingpointsmemo.com/2012/05/congress-speaking-grade-level.php) that's based on the database we'll be using!

##Releases

###Release 0 : Import the database with Ruby

Download the CSV file and save it locally.  Create a Ruby script to parse the CSV file and create a SQLite database containing the CSV file's columns and rows.

You'll need the [Ruby gem for SQLite](https://github.com/luislavena/sqlite3-ruby).  Install it by running:

```bash
gem install sqlite3
```

You should also create a Politicians class, with all the relevant attributes.  Create a couple politician objects, assigning values to their attributes, then save each object into an SQLite database by calling a `save` instance method.

If you've forgotten how to parse CSV files in Ruby, review [Parsing Data 1](https://github.com/fireflies-2014/parsing-data-1-csv-in-csv-out-challenge) from way way back a week ago.  You'll create the database in Ruby in the same way you did in recent SQLite and ruby challenges.

### Query the Congress members DB

Let's make sure the database is working properly.  Open up the Sqlite console and let's run a few queries. (Run `sqlite3 database_name.db`).

Let's start with some COUNT queries:

1. How many Republican representatives are there?
2. How many Democrats?
3. How about senators, Republican and Democrat?

Now let's move on to INSERT and UPDATE and DELETE:

1. Quick, while no one is looking, add Shereef Bishay to the database.
2. Copy the information for Dianne Feinstein and add that data as if it was his.
3. Now let's delete Dianne's entry so nobody sees anything fishy with three senators from California.

###Release 1 : Running SQL statements from Ruby

Now that we know our database is sound, we will use Ruby to create methods that run SQL commands.

Recreate the DELETE, INSERT, UPDATE, and COUNT methods above in Ruby.  What arguments should you be passing into the methods? Where should these methods be defined?

<table class="table table-striped table-bordered">
  <tr>
    <th>SQL land</th>
    <th>Ruby land</th>
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
  <tr>
    <td><pre>SELECT COUNT(*) FROM politicians</pre></td>
    <td><pre>Politician.count</pre></td>
  </tr>
  <tr>
    <td><pre>INSERT INTO politicians (field1, field2, ...)
VALUES(value1, value2, ...)</pre></td>
    <td>
      <pre>politician = Politician.new(data)
politician.save</pre>
    </td>
  </tr>
  <tr>
    <td><pre>UPDATE politicians SET field1=value1, etc.
WHERE id = 20</pre></td>
    <td>
<pre># Politician.where should return
# an Array of Politician objects
politician = Politician.where(:id =>20).first
politician.name = 'Jim DeMint'
politician.save</pre>
    </td>
  </tr>
  <tr>
    <td><pre>DELETE FROM politicians WHERE id = 40</pre></td>
    <td>???</td>
  </tr>
</table>

You'll need tests to (at least) demonstrate all the behavior you see in the "Ruby Land". This might be a good opportunity to try TDD!

###Release 2 : Oratory skills

Now, you're really moving.   Build and run queries to answer these questions (first test these in Sqlite and then create methods in Ruby):

1. What 10 representatives are speaking at the lowest grade level?
2. What 10 Democrat representatives are speaking at the lowest grade level?
3. What 10 Republican representatives are speaking at the lowest grade level?

Use the column that has data since 1996.  Neatly print their names, state, Republican or Democrat, if they are in the Senate or House of Representatives, and how many years they have been in Congress.  They should be ordered from lowest to highest grade level.

(This is the actual grade level that they are communicating publicly at, newspapers are usually in the 11th to 14th grade level! )

Expand your test coverage to include the new methods you wrote for Release 2.

<!-- ##Optimize Your Learning  -->

##Resources
