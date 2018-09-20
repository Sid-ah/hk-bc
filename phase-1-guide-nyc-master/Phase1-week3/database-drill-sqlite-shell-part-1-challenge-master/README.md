# SQL Queries:  Part Orders

## Summary 
This challenge will build on the SQL queries that we've already written.  We'll be writing more complex queries that make use of GROUP BY and HAVING, the [LIKE][SQLite like operator] operator, SQLite [aggregate functions][sqlite aggregate functions], SQLite [DATE functions][sqlite date functions], and [subqueries][SQLite subqueries].


## Releases
### Pre-release:  Review the Schema
We're going to work with the database `orders.db`.  Get oriented by reviewing the `.schema`.  Take note of the tables and their columns.  It might help to break out the [Schema Designer][] and model the schema visually.


### Release 0:  Query the Database
For each of the data requests below, write a single SQL query that will retrieve the requested data. Copy the working query for each request to the file `queries.md`.

If we want to double-check the results of our queries, each desired result set is recorded as a CSV file in the query_results directory—viewing the CSV files on GitHub will present them as nicely formatted tables.


1. Generate a report for parts ordered more than five times. The report should contain the number of times the part has been ordered, the part name, and the part code.  Order the data by the number of times the part was ordered from most to least and then alphabetically by name.

2. Our Engineering Department has designed a new part that needs to be made of copper.  We want to contact our suppliers who produce copper parts to get quotes for how much each would charge to make the part.  Generate a report with the name and phone number of any supplier from whom we've ordered copper parts.  Order the data alphabetically by supplier name.

3. For whichever part we've ordered most frequently, generate a report on the delivery performance of each time the part was ordered.  Include the part's id, the part's name, the order invoice number, the supplier's name, the date the part was ordered, the date the part was expected, the date the part was received, and the number of days the delivery was late.  Order the data based on the order date beginning with the most recent order.

  *Note:* Don't hardcode values related to the part ordered the most times.
  
4. We want to review the delivery performance of our most frequent suppliers.  Generate a report with the names of any suppliers from whom we've ordered more than twenty parts.  Include the average number of days late that each supplier's parts were received.  Order the data by the average number of days late beginning with the highest average.


## Conclusion
The queries we wrote in this challenge were a step up in complexity from other queries we've written.  We were able to explore some additional SQL operators, functions, and techniques.  We'll use some of them more often than other, but we should be somewhat familiar with all of them and how they allow us to manipulate the data in our databases. 


[Schema Designer]: https://schemadesigner.devbootcamp.com
[SQLite aggregate functions]: https://www.sqlite.org/lang_aggfunc.html
[SQLite date functions]: https://www.sqlite.org/lang_datefunc.html
[SQLite like operator]: http://www.tutorialspoint.com/sqlite/sqlite_like_clause.htm
[SQLite subqueries]: http://www.techonthenet.com/sqlite/subqueries.php

