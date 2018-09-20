## Monday

### Schema Design and Intro to SQL

### Core

**Daily Retros**

- What is a relational database?
- From the weekend, did you find any learning strategy useful that could be useful after hours?

**Challenges**

- [Database Drill: SQL Tutor](https://sqltutor.devbootcamp.com/) _Switch driver/navigator roles on every question!_
  - Guidance: Some questions have additional sorting requirements that are not explicitly mentioned in the questions themselves, e.g. if you hit a question where your query is generating the same results as the desired results, but in a slightly different order.
  - Additional guidance: Note there [are three different syntactical forms for the COUNT() function](http://www.w3schools.com/sql/sql_func_count.asp).
  - Additional additional guidance: Become familiar with [GROUP BY](http://www.w3schools.com/sql/sql_groupby.asp) and [HAVING](http://www.w3schools.com/sql/sql_having.asp)
  - Additional additional additional guidance: In SQL Tutor, there is a difference between single quotes `'` and double quotes `"`, so if you are getting weird errors with double quotes, use single quotes, or vice versa.
  - Also: SQL docs [here](http://www.w3schools.com/sql/).
- [Database Drill: Intro to SQLite](../../../../tree/master/database-drill-intro-to-sqlite-challenge) - if not finished over the weekend.
- [Poll Database Design](../../../../tree/master/poll-database-design-challenge)  
  Guidance: You will need to design your database in such a way that you could write queries that answer the following questions: 1) Which polls did the user with id #2 create?, 2) Which polls did the user with id #2 respond to?, 3) What was user #2's response to poll #7?, 4) What are the choices for poll # 4?  
  Additional guidance: all of your users should be in _one_ table, and all of your polls should be in _one_ table.
- [Voting Results: Queries](../../../../tree/master/sql-voting-results-retrieving-data-challenge)  
  Guidance: Be aware of COUNT() and GROUP BY and HAVING, see links above
- [University DB Schema](../../../../tree/master/university-course-database-design-challenge)  
  Guidance for Release 0: Your database should be designed in such a way that it could successfully answer the following queries: 1) What classes is student #6 attending?, 2) What students are in class #6?, 3) What was the final grade for student #2 in class #7?, 4) Who is the teacher for class #12?, 5) Which class is teacher #9 teaching?  
  Guidance for Release 1: You will need to enforce constraints on your database to meet some of the criteria. If schema designer proves inadequate to display these constraints, you can write any constraints in a separate file. (Here is an example constraint: table1 will only allow a new record to save if that new record contains a unique value in field1 (no other record in table1 has the same value in field1))
- [Voting Results: Modifying Data](../../../../tree/master/sql-voting-results-modifying-data-challenge)  
  Guidance: Be sure to know how to use UPDATE, DELETE, and INSERT INTO

**Prep for Tomorrow**

- Retros

  - What are good ways to translate code to a schema design and vice versa?
  - What is normalized data and why?
  - What are the different programming tools that you learned and how do they fit together?
  - What is brought you to DBC? Don't lose sight of it.

- [Object-relational Mapping](../tree/master/readings/object-relational-mapping/README.md)

### Stretch

**Challenges**

- [Design Your Own Database](../../../../tree/master/design-your-own-database-challenge)
- [IMDB Database Design](../../../../tree/master/imdb-database-design-challenge)
- [Reddit Jr Database Design](../../../../tree/master/reddit-jr-database-design-challenge)
- [Forum Database Design](../../../../tree/master/forum-database-design-challenge)
- [Database Drill: SQLite Shell Part 1](../../../../tree/master/database-drill-sqlite-shell-part-1-challenge)
- [Database Drill: SQLite Shell Part 2](../../../../tree/master/database-drill-sqlite-shell-part-2-challenge)

### Additional Resources

- [Talk on schema design](http://shereef.wistia.com/medias/fd684c61cb)
- [Basic SQLite commands](http://zetcode.com/db/sqlite/tool/)
- [Visualization of SQL joins](http://www.codinghorror.com/blog/2007/10/a-visual-explanation-of-sql-joins.html)
