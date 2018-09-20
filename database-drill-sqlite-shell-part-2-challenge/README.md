# Database Drill: Exporting and Dumping Data 
 
## Summary 
We're going to look at a couple approaches for sharing the data in our database.  We'll start by exporting data into another format (e.g., CSV), and we'll finish by dumping our data into another file so that we can recreate our data in another database.


## Releases
### Release 0:  Exporting Data to a File
Sometimes we want to share data from a database without giving access to the database itself.  Perhaps our database contains sensitive information like hospital patient records that we cannot legally share.  Or, we might need to share data with someone unfamiliar with SQL or who wants to work with the data in spreadsheet software like Microsoft Excel.  What can we do?  

Fortunately, most databases offer utilities for exporting data to other formats.  In the [command line shell for SQLite][SQLite] we can do this by configuring (1) the `.mode`, the output format of our queries, and (2) the `.output`, where we want to write the output (e.g., a specific file).

We have a database that contains data on parts that our company has ordered from our suppliers (`orders.db`).  We've received a request for a report related to the on-time performance of our suppliers.  Our Purchasing Department wants to follow up with any suppliers from whom we've ordered parts that have not arrived or that arrived late.

To assist the Purchasing Department, we need to provide a CSV file with data for any ordered part that has not been received or was received after the date its order was expected.  The data in the report should include (1) the order invoice number, (2) the date the order was made, (3) the date the order was expected, (4) the date the part was received, (5) the part name, (6) the part code, (7) the order supplier's name, and (8) the supplier's phone number.  Oh, and the data should be ordered by the supplier's name and then by invoice number.

*Note:* See the file `example_results/unreceived_and_late_parts.csv` for expected output.


### Release 1:  Dumping Data
Databases also provide methods for *dumping* their data: the database can output a series of SQL queries that could be used to recreate the database.  The output can be used as a backup or as a way of importing data into another database.

We need to move our suppliers table and all of its data to a new database.  To do so, we're going to create a dump of our database's `suppliers` table and then read it into a new database.  To begin, open the SQLite command line shell connected to our `orders.db`.  Set up the `.output` to write to a file (e.g., `suppliers.dump`) and then use the `.dump` command to dump only the `suppliers` table.  Close the SQLite command line shell and take a look at the output file.

The output file now contains a series of SQL statements that will recreate the `suppliers` table with all its data.  So, let's recreate it!  Reopen the SQLite command line shell, but this time without specifying a database—just type `sqlite3`.  Then use the `.read` command to execute the SQL in our output file.  View the schema and the entries in the recreated `suppliers` table.  Voila!  Our data has been moved from one database to another.


## Conclusion
Moving data from one database to another database or converting it to another format isn't something that we'll do everyday at Dev Bootcamp, but we should be aware of the possibility and understand conceptually what is happening.


[SQLite]: https://www.sqlite.org/cli.html