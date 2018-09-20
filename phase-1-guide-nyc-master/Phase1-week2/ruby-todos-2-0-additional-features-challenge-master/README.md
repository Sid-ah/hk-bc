# Todo List: Additional Features 
 

## Summary 
This challenge is a continuation of a [command line todo list challenge][].  We'll take an application that meets all the requirements specified in that challenge and add some additional features.  Write the best object-oriented code we can!


## Releases
### Pre-release: Review the Code Base
We're provided with a working todo list application, based on the requirements of the [command line todo list challenge][].  We can use the application to display a list of items, add items, remove items, and mark items as complete.  Run the tests and review the code.  What objects are there?  How do they work together?  Be sure to understand how the provided application works because we're going to dive into it when it's time to add new features.


### Release 0: Creation Date and Completion Date
We have an `Item` class with two attributes:  a complete status and a description.  We want to begin storing the dates when items are created and when they are completed.

So, when a new item is added to the list, we need to save the date when the item was added.  When an item is marked complete, we need to save the date when the item was completed.  How will we represent these timestamps in our data file?  How will we represent them in Ruby?  Could this change how an item determines whether or not it's complete or incomplete?

Think through how to implement this new feature.  What objects are affected?  How are they affected?  Write tests for any new behaviors and update any tests that are affected by this change.  

*Note:*  Edit the data file as necessary.


### Release 1: Display a Sorted List
Now that we're tracking when our items are created, let's update how we display the list of items.  Instead of printing them in any order, print them in chronological order—the newest item at the top and the oldest at the bottom.


### Release 2: Filter the List
When a user wants to view the list of items, our application displays every item—both completed items and incomplete items.  We are going to add a feature that allows users to display all the items, only completed items, or only incomplete items (see Figure 1).

```
$ ruby todo_list_runner.rb list
[X] Milk the cow.
[ ] Gather the eggs.
[X] Feed the pigs.

$ ruby todo_list_runner.rb list completed
[X] Milk the cow.
[X] Feed the pigs.

$ ruby todo_list_runner.rb list incomplete
[ ] Gather the eggs.
```
*Figure 1*.  Listing options:  all, complete, and incomplete.


### Release 3: Tagging Items and Filtering by Tag
Our todo list can often contain subsections of related items:  personal items, financial items, pet-related items, etc.  We want users to be able to filter a list to show a specific group of items.

We're going to implement item tagging.  We'll be adding two new commands for running our application:  one for tagging an item and one for displaying items with a specific tag (see Figure 2).  An item can have multiple tags.

```
$ ruby todo_list_runner.rb list
[X] Submit refund paperwork
[ ] Cash refund check.

$ ruby todo_list_runner.rb tag "cash refund" #blessed #financial
Tagged "Cash refund check." with the tags #blessed, #financial.

$ ruby todo_list_runner.rb list #blessed
[ ] Cash refund check.
```
*Figure 2*.  Tagging items and filtering the list by a tag.


*Note:*  Our data file might start to feel a little messy now that we're storing the complete status, description, date created, date completed, and any tags.  Try to keep the constraint that the file is human readable and is recognizable as a todo list if printed out.


## Conclusion
We had to jump into an existing code base.  Before beginning the challenge, we had to read and understand what how the existing code functions?  How was that?  Was it easy?  Overwhelming?  What have we learned about working with an existing code base?

As we added features we had to decide how to update our application.  Do we need new objects?  Should we modify existing objects?  How did we identify which object should be responsible for the new behaviors?  Do we feel good about the decisions we made?  What could we do better going forward?


[command line todo list challenge]: ../../../ruby-todos-1-0-core-features-challenge
