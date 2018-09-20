# Database Drill: A Table for Students 
 

## Summary
We're going to design a database table to support persisting `Student` class objects (see `student.rb`).  When we want to save the state of objects in an application, we need to store the data somewhere.  We've seen object data stored in CSV file, text files, etc.  In building our web applications at Dev Bootcamp, we'll be using databases to store data.

If we want to persist objects in a database, the database will need a table for each object type.  For example, to persist `Student` objects, the database will need a table designed to hold student data.


### Designing a Database Table for a Class
Each class that we want to persist will need its own database table.  What do we name the table?  What data should it hold?  There are a number of conventions to follow that will help us design a database table to support a given class.

***Table Names***.  Database table names are plural, snake case, and based on the class name.  For example, a database table for an `Employee` class would be named `employees` (see Table 1 for more examples).

| Class Name     | Table Name       |
| :------------- | :---------       |
| Employee       | employees        |
| InsuranceClaim | insurance_claims |
| Person         | people           |

*Table 1*.  Class names and their mappings to table names.

***Rows and Columns***.  It can be helpful to envision a database table as a spreadsheet.  Each object is stored in its own row.  Each of the object's attributes is stored in a column with that attribute's name.  Given an `Employee` class with *name*, *hired_on*, and *payroll_number* attributes, we could persist employees in a table like Table 2 (notice the additional *id*, *created_at*, and *updated_at* columns).

| id  | name           | hired_on   | payroll_number | created_at          | updated_at          |
| :-- | :------------- | :--------- | :------------- | :------------------ | :------------------ |
| 1   | Myriam Gosse   | 1995-11-01 | ARSI-9383720   | 2016-03-29 09:15:03 | 2016-03-29 09:15:03 |
| 2   | Jung Pearson   | 1981-05-22 | AWKL-0394239   | 2016-02-29 12:00:00 | 2016-02-29 12:00:00 |
| 3   | Ronald Ferrari | 1991-04-18 | KMBW-4893023   | 2016-03-17 13:57:35 | 2016-03-20 14:46:34 |
| 4   | Priska Fodor   | 1993-04-20 | TYUR-7383921   | 2016-03-21 18:14:12 | 2016-03-21 18:14:12 |

*Table 2*.  Data held in an example employees table.


***Unique Identifier***.  Each record in a database table needs a value that distinguishes it from all other records in the table.  The convention is to use an *id* column whose value is set by the database using an auto-incremented integer:  1, 2, 3, etc.  By convention, the *id* field also serves as the table's *primary key*.


***Timestamps***.  It is also convention to keep track of when a record is first inserted into the database table and when the record was last updated.  To do this we use *created_at* and *updated_at* fields.


## Releases
### Release 0: Design a Table
Design a table to support the `Student` class written in the file `student.rb`.  Use [Schema Designer](https://schemadesigner.devbootcamp.com/) to design the table with all of the necessary fields for the class's attributes.  Pick a [data type](http://www.w3schools.com/sql/sql_datatypes_general.asp) for each field (e.g., integer, varchar, date, etc.).  Ensure that the *id* and timestamp fields are included.

When the table is complete, take a screenshot of the schema, commit it, and submit the challenge.

## Conclusion
Designing database tables to support our classes is a skill we will be using throughout the rest of our time at Dev Bootcamp.  We need to understand how our Ruby objects map to the database.  Each class gets a table.  Each instance of the class is saved as a separate record in the database (i.e., is a separate row in the database).  The values of the object's attributes are stored in the table's fields (i.e., the columns).
