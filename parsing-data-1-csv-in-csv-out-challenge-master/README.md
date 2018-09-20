# Parsing Data: CSV to Ruby to CSV

## Summary
When we run our applications, Ruby objects are created that exist in our computer's memory.  These objects have state, or information, associated with them.  In-memory state is lost when our application ends, so if we want to save this state, we need to record it somewhere.

In addition to saving the state of our programs for ourselves, we sometimes want to share this information with other systems or programs.  To accomplish this, in addition to merely saving the data, we need to save it in a format that is both compatible with these other systems and easily transfered.

One common approach to saving state in an exchangeable format is to translate the information to text.  XML, JSON, CSV, and YAML are all examples of text-based data exchange formats.

In this challenge, we'll use [CSV][wikipedia csv] as our format for storing data.  We'll be representing people in Ruby as instances of the class `Person`.  We'll both build `Person` objects from data in a CSV file and also save the state of Ruby `Person` objects in a CSV file.


### Ruby's CSV Library
Ruby provides a library for working with CSV files (see [Ruby docs][ruby docs csv]).  It is part of Ruby's Standard Library, so we always have access to it.  However, it's not a part of Ruby's Core, so it's not automatically loaded for us when our programs run.  We need to explicitly require it.  This is done for us at the top of the `person_parser.rb` file.

We'll use this CSV library to both read and write CSV files.  The library provides the [`CSV.foreach`][docs foreach] method as the "primary interface for reading CSV files" and the [`CSV.open`][docs open] method as the "primary interface for writing a CSV file."

When we read a CSV file, the default behavior for `CSV.foreach` is to convert each row in the file to an array of strings.  However, we can change that behavior by specifying different options.  For example, specifying that our CSV file contains a header row changes the data structure used to represent each row from an array to a [`CSV::Row`][ruby docs csv row] object.  For an overview of these options, read the blog post *[Parsing CSV with Ruby][technical pickles csv]*.

*Note:*  The blog post explains these options using the method `CSV.new`, but they are the same when using `CSV.foreach`.


## Releases
### Release 0: Represent People as Ruby Objects
We'll begin by creating a `Person` class; in our Ruby program, each instance of this class will represent a person.  Our person class should be designed to represent the data found in the file `people.csv`.  In other words, an instance of our `Person` class should have a first name, a last name, etc.

We'll need to write tests for our class.  What behaviors does our `Person` class need?  To start, let's ensure that we can ask an instance of the class for each of its attributes:  first name, last name, etc.


### Release 1: Parsing from CSV to Ruby
We now have a custom Ruby class designed to represent a person.  In order to build a `Person` object, we need to supply some data:  the first name, last name, etc.  It doesn't matter where that data comes from.  The data could be supplied through a user interface, it could exist on a webpage, anywhere.  In this challenge, the data comes from a CSV file.

We'll build a `PersonParser` module whose responsibility is to parse the text in a file into `Person` objects.  Write out the method body for the `.parse` method.  This method should convert each line in the file into a `Person` object and return those objects in an array.

We need to test the behavior of our `PersonParser` module.  Given a CSV file with specific data in it, when we tell our parser to parse that file, what do we expect to be returned?


### Release 2: Appropriate Data Types in Ruby
In our CSV file everything is text.  That means everything comes into our Ruby application as a string.  Sometimes this is appropriate.  Names, phone numbers, and e-mail addresses are represented well as strings.  In other cases, it can be beneficial to convert the CSV text into a different type of object.

In `people.csv` the date and time a person was born is saved in the `born_at` field.  In the CSV file this is a string formatted `YYYY-MM-DD HH:MM:SS`.  While this string does represent a date and time, Ruby provides classes like [DateTime][] specifically built for representing dates and times.  
 
When we create `Person` objects from our CSV file, ensure that their `born_at` attributes are `DateTime` objects, not strings. We might want to check out the [DateTime.parse][] method.

*Note:*  Like Ruby's CSV library, the `DateTime` class is not automatically loaded when our programs run.  We need to require it:  `require 'date'`.  


### Release 3: Working with the Ruby Objects
![runner animation](readme-assets/runner_animation.gif)  
*Figure 1*.  Filtering the ruby objects created from the CSV file.

One of the advantages of loading the data from the CSV file into Ruby objects is that it becomes easier for us to filter the collection of people or to manipulate their attributes.  For example, we could order the people by first name.  Or, we could update a person's phone number.

Read through `runner.rb`. We want our program to allow users to filter people using different commands: filtering people from a specific area code, with a specific last name, with an e-mail address from a specific domain, or born after a given year.  When we're done, the program should operate similar to the example in Figure 1.

Begin by completing the feature for searching for people by area code.  Run the program and follow the error messages (Hint:  we'll be adding to our `Person` class).  Once users can search for people by area code, implement the other three features:  searching by last name, by e-mail domain, and by birth year.  Then think up and add another feature of our own.


### Release 4: Saving Ruby State to CSV
```ruby
jane = Person.new(...)
john = Person.new(...)

PersonWriter.write('friends.csv', [jane, john])
```
*Figure 1*.  Creating people in ruby and saving their data to a CSV file.

We can parse CSV data into Ruby objects which we can use in our programs.  Now we're going to take Ruby objects and save their state to a CSV file.  To do this, we'll build a `PeopleWriter` module with a `.write` method.  We can create a collection of `People` objects and then tell the writer to write them to a file.  (see Figure 1)

We do not need to write tests for the writing behavior.

*Note:* When we read and write to a file, we can choose a mode (like `"r"` for read and `"w"` for write).  The CSV modes are the same as the [modes available for File][ruby file modes].


### Release 5: Collect and Save Information
Now that we can write data to CSV, let's write a script that will allow us to create a CSV address book based on user input.  We'll enter people's names, phone numbers, etc. and then save the data to a CSV file.  Let's modify the runner file so that when it runs, we're prompted to enter information.  We'll enter the data for as many people as we want.  And then, once we're done making entries, the data we've entered will be written to a CSV file.


## Conclusion
The overall goal of this challenge is to learn to manipulate Ruby objects and CSV as part of a single application. All the data we needed to represent people was held in a CSV file, but the CSV file is just text and lacks person-like behavior (e.g., returning a name).  By creating Ruby objects based on the data, we were able to create objects whose behaviors matched the needs of our application. This is a common pattern in software engineering: change the representation of data from Format A to Format B to make it easier to do X with it.

[DateTime]: https://ruby-doc.org/stdlib-2.2.0/libdoc/date/rdoc/DateTime.html
[DateTime.parse]: http://www.ruby-doc.org/stdlib-2.2.0/libdoc/date/rdoc/DateTime.html#method-c-parse
[docs foreach]: http://ruby-doc.org/stdlib-2.2.0/libdoc/csv/rdoc/CSV.html#method-c-foreach
[docs open]: http://ruby-doc.org/stdlib-2.2.0/libdoc/csv/rdoc/CSV.html#method-c-open
[ruby docs csv]: http://ruby-doc.org/stdlib-2.2.0/libdoc/csv/rdoc/CSV.html
[ruby docs csv row]: http://ruby-doc.org/stdlib-2.2.0/libdoc/csv/rdoc/CSV/Row.html
[ruby file modes]: http://ruby-doc.org/core-2.2.0/IO.html#method-c-new-label-IO+Open+Mode
[technical pickles csv]: http://technicalpickles.com/posts/parsing-csv-with-ruby/
[wikipedia csv]: https://en.wikipedia.org/wiki/Comma-separated_values
[wikipedia lazy initialization]: https://en.wikipedia.org/wiki/Lazy_initialization
[wikipedia memoization]: https://en.wikipedia.org/wiki/Memoization
