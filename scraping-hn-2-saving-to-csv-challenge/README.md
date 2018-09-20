# Hacker News HTML to CSV

## Summary
In this challenge we're going to translate data from one format to another.  We'll take data that we find in Hacker News HTML and translate it into comma separated values (CSV).  Specifically, we'll be saving the comments made on a Hacker News post in a CSV file.  We should have experience [scraping Hacker News][scraping hn challenge] and [working with CSV][csv challenge] from previous challenges.


## Releases
### Release 0: HTML to CSV
Write an application that dumps each comment from a Hacker News post to a CSV file.  Here are the requirements:

- The name of the CSV file should be the id of the Hacker News post (e.g. `5003980.csv `).

- Each line in the CSV file should include the commenter's name and the content of the comment.

- The application should run using command line arguments:

  ```
  $ ruby runner.rb http://news.ycombinator.com/item?id=5003980
  
  Comments saved to the file 5003980.csv
  ```



*Note:*  We may reuse code from the [scraping HN challenge].


## Conclusion
When we develop an application, there are a lot of design decisions to make.  What objects do we need?  How do they interact?  

What design decisions did we make?  Did they lead to maintainable, changeable code?  For example, if Hacker News changed its site, would the changes affect any other objects than the object responsible for parsing the HTML?


[csv challenge]: ../../../parsing-data-1-csv-in-csv-out-challenge
[scraping hn challenge]: ../../../scraping-hn-1-building-objects-challenge

