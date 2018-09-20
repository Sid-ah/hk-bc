# Working in the SQLite Shell

## Summary 
We've worked with storing data for our applications in text files—CSV files for example.  Now we're going to begin using databases to persist the state of our applications.  We'll be working with relational databases, though there are other types.  But, there are also different types of relational databases: PostgreSQL, MySQL, etc.  To begin, we'll be working with [SQLite](http://en.wikipedia.org/wiki/SQLite) databases.

Why are we starting with SQLite?  They are relatively simple relational databases, and they are saved in a single file, which makes them easy to move around—for example, checking them into a GitHub repo.  Also, if we're on a mac, software for interacting with SQLite databases comes installed; [downloads][sqlite downloads] are available for Windows and other systems.

In this challenge, we're going to begin working in the SQLite shell.  We'll create a new database and begin writing some SQL.  We'll create and alter a table in the database and insert and update some records.


### Configure SQLite Output
The default way that the SQLite shell displays data is not the most readable, but we can improve it by configuring the output with a `.sqliterc` file.

To do so, paste the following into the Terminal:

```bash
cat << EOF > ~/.sqliterc
.headers on
.mode column
EOF
```

## Releases
### Release 0:  Opening the SQLite Shell
Similar to opening IRB in Ruby, we can open a [SQLite shell] in order to interact with a SQLite database.  We open the shell using the `sqlite3` command.  When opening the shell, we can also provide the name of the database file to which we want to connect.  It doesn't matter if the file already exists or not. If it doesn't exist, the file will be created once we modify the database.  We'll be naming our database files with the extension `.db`.

Open the SQLite shell, connecting to a database as we do so:
```bash
$ sqlite3 database.db
```

This will take us to a SQLite shell prompt where we can execute SQL statements:

```text
SQLite version 3.8.10.2 2015-05-20 18:17:19
Enter ".help" for usage hints.
sqlite> 
```

When we're done working in the shell, we can exit by entering `.quit`.


### Release 1:  Creating a Table
In *Release 0*, we opened the shell, but we didn't do anything.  In this release, we're going to create a new table in the database.  Begin by opening the SQLite shell, connecting to `database.db`.

Once in the shell, we are going to create a `users` table in the database.  To do so, we'll enter a [SQL create table statement][].  When we create a table, we declare the name of the table and each of the columns that we want to include in the table.  For each column we specify the column's name, [data type][sqlite data types], and any [constraints][] on the data.

Create the `users` table by entering the following SQL statement.  Read through the statement.  Do we understand what we're creating?  What columns will exist on the table?  What is each column's data type?  What do those data types mean, why are they appropriate?  What constraints are placed on each column?  What does each constraint mean?

```sql
CREATE TABLE users (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  first_name VARCHAR(64) NOT NULL,
  last_name  VARCHAR(64) NOT NULL,
  email VARCHAR(128) UNIQUE NOT NULL,
  created_at DATETIME NOT NULL,
  updated_at DATETIME NOT NULL
);  /* Don't forget the semicolon */
```

*Note:*  In the shell, our statements won't execute until we end them with a semicolon.


### Release 2:  Check the Schema
We've been designing database schemas visually using the schema designer tool.  When we're in the SQLite shell, we can check on the current schema of our database by entering `.schema`.  Using this command will present us with the structure of our database as it currently exists:  what tables are in the database, the columns on those tables, etc.

Take a look at our database's schema.  How is the schema presented?  Did we notice the create table statement?  Could we use this to recreate the structure of our database?


### Release 3: Insert User Data
Now that we have a table, let's insert user records with a SQL insert statement.  In an insert statement, we specify the name of the table into which we want to insert data, the columns for which we are providing data, and the values of that data.

Insert users into the `users` table by entering the following SQL statement.  Read through the statement.  Do we understand what it's doing?  For which columns are we providing a value?  For which columns in the users table are we not providing a value, why not?  What type of data is each value?  What does the [`datetime()`][datetime function] function do?  Why do we pass `'now'` to the function?

```sql
INSERT INTO users
(first_name, last_name, email, created_at, updated_at)
VALUES
('Kevin', 'Solorio', 'kevin@devbootcamp.com', DATETIME('now'), DATETIME('now')),
('Alyssa', 'Diaz', 'alyssa@devbootcamp.com', DATETIME('now'), DATETIME('now'));
```

Execute another insert statement to add an additional user or two.  Then, let's explore the constraints that we placed on the columns in our `users` table.  What happens if we try to insert a record without providing a first name?  What about trying to insert a record with an email address already in the table?


### Release 4: Selecting Records from a Table
Take a look at the data that is now in the `users` table by entering the following SQL select statement.  When we write a select statement, we specify which columns' data we want returned and from which table we want it.  What does the `*` mean?

```sql
SELECT * FROM users;
```

What would a select statement look like if we only wanted to see first and last names?


### Release 5: Altering a Table
We design databases to support applications.  When the needs of our application change, that can affect our database.  A change in the application might mean adding a table to our database, altering an existing table, or really any number of things.

In this release, we want to alter our `users` table by adding a `nickname` column.  We'll need to write and execute an `ALTER` statement.  After executing the statement, check the database schema to see the change reflected.

*Note:* If something goes wrong, it's okay.  We can `DROP` the users table and recreate it.  If something really goes wrong, we can delete the database file and start completely over.


### Release 6: Update a Record
There's a reason we added a nickname column: we want our users to have nicknames.  But, right now none of our users has a nickname.  Let's change that.

Write and execute an `UPDATE` statement to give Kevin Solorio the nickname *ksolo*.  In addition to changing the value of the nickname, we want to note the time at which the record was updated; in the update statement, remember to update the `updated_at` column to be the current time.

Run a select statement to see Kevin's nickname.

*Note:* There is nothing to turn in for this challenge.


## Conclusion
We're just beginning to work with databases.  As we begin, we're focusing on how to interact directly with a database by executing SQL statements.  How we create a table, insert data, update data, etc.  As we move forward, we'll look at more advanced SQL queries.  Then we'll transition to relying on Ruby to handle database interactions for us.

Leaving this challenge, we should be comfortable working in the SQLite shell: connecting to a database and executing SQL statements.  We should also be able to write SQL to create and alter database tables, insert and update records in a table, and select records from a table.


[constraints]: http://www.w3schools.com/sql/sql_constraints.asp
[datetime function]: http://www.techonthenet.com/sqlite/functions/datetime.php
[sql create table statement]: http://www.w3schools.com/sql/sql_create_table.asp
[sqlite data types]: http://www.sqlite.org/datatype3.html
[sqlite downloads]: https://www.sqlite.org/download.html
[sqlite shell]: https://www.sqlite.org/cli.html

