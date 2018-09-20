# SQL Queries: Insert, Update, and Delete 
 
## Summary 
In our work with the  SQL Tutor and previous challenges, we've had some practice reading data from a database.  In other words, we've written a lot of SELECT statements.  Now we're going to get some practice modifying the data in a database:  creating, updating, and deleting records.

*Note:*  When discussing database functions, programmers often refer to CRUD operations: *Create*, *Read*, *Update* and *Delete*. The SELECT commands we've been practicing correspond to the R, read.  This challenge focuses on the C, U, and D.


## Releases
### Pre-release:  Review the Schema
We'll be working with the `voting_results.db` SQLite database.  Take a look at the database's schema (`.schema`), so we know which tables exist in the database, which fields are on those tables, and how the tables relate to each other.


### Release 0:  Inserting Records into the Database
Write SQL to fulfill each of the requests below.  Copy the working SQL queries for each request into the file `queries.md`.

1.  Insert a new politician located in New Jersey (NJ) and named Sen. Ada Lovelace.

2.  Add two new voters (make up their names and other data).  For each of the new voters, create a vote for each of the two Texas (TX) senators.


### Release 1:  Updating Records in the Database
Write SQL to fulfill each of the requests below.  Copy the working SQL queries for each request into the file `queries.md`.

1. Update the votes for New Jersey's Sen. Frank Lautenberg.  Change them to be votes for Sen. Ada Lovelace, the politician we created in *Release 0*.

2. Update the votes for all males over the age of 80 who have no children.  Change their votes to be for Rep. Ed Whitfield.

3. Update the votes for politician with the highest speaking level (`grade_1996`).  Change them to be votes for the politician who speaks at the lowest grade level.



### Release 2:  Deleting Records from the Database
Write SQL to fulfill each of the requests below.  Copy the working SQL queries for each request into the file `queries.md`.

1. In our database we've essentially replaced Sen. Frank Lautenberg with Sen. Ada Lovelace.  The last thing to do is to delete Sen. Frank Lautenberg from the database.

2. Delete all the voters who are not registered as a Republican or Democrat and who have only voted once.

3. Delete all the voters who are homeowners, are employed, have no children, have been with their party for less than three years, and have voted for at least one politician who speaks at a grade level higher than 12.


### Release 3:  Clean up Orphaned Data
In the last release we deleted a number of voters from the database.  This left us with a number of votes that were cast by ... well, we can't tell any more.  The `voter_id` for these orphaned votes now points to a record in the `voters` table that no longer exists.

Is this a problem?  Maybe, maybe not.  It would depend on our application.  But, let's clean up these orphaned votes anyway.  Delete all the votes whose voter cannot be found in the database.


## Conclusion
As with the SELECT statements that we've worked with previously, we'll soon begin to use software that will handle writing and executing these SQL queries for us.  We should leave this challenge with a good understanding of what happens in INSERT, UPDATE, and DELETE statements and also a solid familiarity with the syntax involved in making each type of statement.



