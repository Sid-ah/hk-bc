# Working with Legislator Data

## Summary
This challenge is a fairly comprehensive reflection of our understanding of and abilities in applying object-oriented principles, schema design, and Active Record.  The challenge is to build a command line application that allows us to interact with data on U.S. legislators.  We'll be designing a database to hold data pulled from the [Sunlight Foundation][Sunlight Foundation].

We'll be given a list of required functionality for our application, but it's up to us to figure out how to build out that functionality.  What tables should our database have?  What models do we need?  What are the relationships between our classes?  What about views and controllers?  How will we get input from users?  We'll need to make and implement all of these decision ourselves.


### Active Record Query Interface
We should be familiar now with some of the more common Active Record queries: `.all`, `.find`, `.where`, etc.  In completing this challenge, we'll likely want to be familiar with how to use [Active Record's query interface][AR Query Interface] for filtering, sorting, etc. as well as some other techniques for loading objects.  For example, we can [load an object with its associated objects][Eager Loading].  We can define [scopes][Scopes] or class methods to provide an interface for other objects to ask for subsets of a class's records.  If we're unsure whether or not a record might already exist in the database, we can first [try to find it and then build/create it if it's not there][Find or Build].  There are powerful features built into Active Record; we need to build familiarity with them.


### Required Functionality

For a given state ...
- obtain a list of all the state's legislators.
- obtain a list of just the state's representatives.
- obtain a list of just the state's senators

For a given political party ...
- obtain a list of legislators affiliated with the party.
- obtain a list of representatives affiliated with the party.
- obtain a list of senators affiliated with the party.
- obtain a list of legislators currently in office

For a given legislator ...
- obtain a list of attributes:
  - birthday
  - fax
  - gender
  - name
  - party affiliation
  - phone
  - twitter id 
  - webform for e-mail
  - website url
- determine whether the legislator is currently in office.


## Releases

### Pre-release: Running Your Application
Take a minute to get acquainted with the provided code base.  When we run our application, we'll execute the `runner.rb` file.  This file requires another file, `config/environment.rb`, that more-or-less requires everything else we'll need.

Before moving on, let's bundle and create our database.


### Release 0: Models and Migrations
We'll begin this challenge by reflecting on the requirements described in the *Summary*, determining the models we'll need, and determining the design of the database that backs up the models.

After making a decision about what we need, we'll need to implement our decision.  Create the models, write and run the migrations, etc.

What makes our models valid or not?  How will we know whether or not our models behave as expected?


### Release 1: Seed the Database
In order to use our application, we'll need to get the legislator data into the database.  The legislator data can be found in the file `db/data/legislators.csv`.  Based on the requirements of our application, there's data in the CSV file that we don't need and don't want to store.  In addition, the data is not necessarily in the format that we want or it might not conform to our validations.  We might want or need to *scrub* the data before we save it in our database.

A `SunlightLegislatorsImporter` module is provided in the file `lib/sunlight_legislators_importer.rb`.  This module will be responsible for populating our database based on the data in the provided CSV file—we need to define its `.import` method though.

A `db/seeds.rb` file has been provided that calls this `.import` method.  Once we've defined the method, we can run the `db:seed` rake task to seed our database with the legislator data.  Before we try to seed our database, can we know whether or not our importer is working as we expect?

### Release 2: Build the User Interface
With our models and database built and our legislator data in the database, let's proceed to creating the user interface.  Looking at our requirements, what information will we need to collect from users?  How will provide this information?  What is responsible for interpreting that input?  What is responsible for acting on the information?  What is responsible for making data presentable to users?

This release is complete when a user can access all of the data described in the requirements.  For example, a user should be able to specify a state and see a list off all legislators from that state.


### Release 3:  Update Listing Legislators
```
Senators:
  Barbara Boxer (D)
  Diane Feinstein (D)
Representatives:
  Xavier Becerra (D)
  Howard L. Berman (D)
  Brian P. Bilbray (R)
  
  list continues ...
```
*Figure 1*.  Example output for displaying a list of legislators from a given state.

Our application is now working as originally described, but we need to make an update.  We want a specific format for the display our list of legislators from a given state (see Figure 1):

- Display only active legislators.
- Senators should be listed before representatives.
- Alphabetize the lists of senators and representatives by last name.
- Identify legislators by party.

As we make this change, reflect on what changes we're making?  Which parts of our application are effected by this change?  Do seemingly unrelated parts of our application need to change?

In deciding how to implement this change, what parts of our program know how legislators are marked as active or not?  How do we order legislators by last name?  Take time to think through what we're doing and why we're making each decision.


### Release 4: List States with Legislator Count
```
CA: 2 Senators, 53 Representative(s)
TX: 2 Senators, 32 Representative(s)
NY: 2 Senators, 29 Representative(s)

list continues ...
```
*Figure 2.*  Example output for a list of states and their legislator counts.

Let's add a new feature to our application.  We want to display a list of all states along with the count of their legislators (see Figure 2):

- The states should be ordered by number of legislators.
- For each state, display the counts of senators and representatives.


## Conclusion
This challenge forces us to apply a lot of what we're learning at Dev Bootcamp: how to organize our code, schema design, Active Record, etc.  It's also more open-ended than some of the other challenges.  We've been given a description of an application, and we've had to build it, making almost all of the decisions along the way.

How did that feel?  Did we know when to apply a concept?  Did we struggle with how to approach a problem?  Or how to implement a decision?  Take a minute to reflect on this challenge.  What did we do well?  Where could we use improvement?


[AR Query Interface]: http://guides.rubyonrails.org/active_record_querying.html
[Eager Loading]: http://guides.rubyonrails.org/active_record_querying.html#eager-loading-associations
[Find or Build]: http://guides.rubyonrails.org/active_record_querying.html#find-or-build-a-new-object
[Scopes]: http://guides.rubyonrails.org/active_record_querying.html#scopes
[Sunlight Foundation]: https://sunlightfoundation.com/

