# Congress Database 2 Scrub And Analyze With Ruby 
 
##Learning Competencies 

* Use sqlite gem to create a database using Ruby commands
* Use sqlite gem to perform CRUD operations on tables in a database using Ruby commands

##Summary 

 Continuing with our Congressmembers database from Sunlight Labs, let's use Ruby to clean up the database and start doing some analysis that just plain old SQL queries can't.  What can be inferred from data that is extracted from the database?  It's an immense number of combinations.

Make sure you practice good OO principles!  Compact methods (no megamoths!), DRY things up, and good naming.


##Releases

###Release 0 : Analyzing the data with ruby

Let's write some methods to do some more interesting data analysis.  

<!-- this constraint not included for now
Important: we must access the database each time we do some analysis.
This ruby program will eventually be tied to a live database that is changing constantly, and it's imperative that the latest data is always used!
--> 

####1) Displaying objects, not entries
First we'll start out with a simple method to print out a list of all the politicians ordered by how many years they have been in Congress. Don't do this with a database call, use your ruby to manipulate your object's data.  Does your method have a single responsibility? 


####2) Summing and averaging object attributes
Now, let's do some statistics. We want a method that sums and averages the DW1 score of Democrats and Republicans, and creates a percentage that will be called the "Political Extremism Index". (That number should be between -1 and 1, and when multiplied by 100 will yield a percentage.) The answer should be printed - ie "Democrats 35% Political Extremism Index, Republicans 42% Political Extremism Index". Which party seems to be more hard line on their party's ideology? *(What enumerable methods can help you calculate this?)*


###Release 1 : Scrubbing the database with ruby

We need to set up a program that automates the scrubbing of data in the database. Don't worry about perfecting an MVC framework or the separation of meta-concerns at this point.  DO break down and name methods correctly and make them DRY.

####1) Scrubbing a column by modifying and saving an object
Write a method to clean up the location field.  Take out the GPS coordinates that are listed in the location, leaving only the state listed.  Make sure you update the database along with your objects!  Use the methods you created in Part 1.  *(There's one tool in your toolbox that is perfect for this kind of manipulation of text.)*

####2) Parsing objects, creating a new column
Write a method to create a new column that denotes whether the politician is a representative or a senator. You'll need to parse that from their title and name in the database. - ie "Rep. Jim Mcgovern" is a Representative. Let's remove this title from the name column, so it only contains their full name.
*(How do you create a new column in ruby?  Make sure your model reflects your database table!)*


####3) Analyzing objects, modifying objects and columns
Create method(s) to find the 20 politicians whose voting is most extremely tied to their party's ideology (10 for Democrat and 10 for Republican). (Hint: use the DW1 score. If it's negative, their voting is more liberal, if it's positive, their voting is more conservative.) Update the politician's title so it includes a new, appropriate title. ie "Right Winger Ron Paul" or "Liberal Lefty Barbara Lee".  Keep it DRY with tight methods and good naming!


Save your code in the source file `congress2.rb`.  Open the database in sqlite3 and make sure your data has been updated.  What's the SQL call to see the top 10 extreme politicians for each party? (Keep it simple with 2 different calls)  Can you also find this by searching for the "Right Winger" string?  Include these practice SQL queries as comments in the source file.
 

<!-- ##Optimize Your Learning  -->

##Resources