# Command Line Todo List

## Summary
We're going to build a todo list application.  We're going to build our application feature-by-feature.  We'll start by displaying a list of items and proceed step-by-step until we've added all the required functionality. When our application is complete, a user will be able to display items, add items, remove items, and mark items as complete.

As we build our application, our design should follow object-oriented principles.  Think through each decision, keeping the [single responsibility principle][wikipedia srp], [separation of concerns][wikipedia soc], and other design principles in mind.

As we work through each release, pay close attention to how *change* impacts our application.  When a new feature is added, how many files do we have to change?  How frustrating is it to make each change?  Did our previous design decisions make the application easier or more difficult to modify?


## Releases
### Release 0: Display Todo List Items
We have a CSV file that contains descriptions of some todo list items (see `todo_list_data.csv`).  We want to begin our application by displaying a list of items (see Figure 1).

Before writing any code, think through the process necessary to display the list.  What do we need to do?  For example, we need to read the contents of the data file, represent the todo list in Ruby, represent each list item in Ruby, format the list for display, etc.  What other responsibilities are there?

Once we've identified the responsibilities of our application, then determine what objects we need to fulfill those responsibilities—remembering to apply object-oriented design principles.  Then test and develop those objects and complete the release.

```
$ ruby todo_list_runner.rb
- Walk the cat.
- Go to the gym.
- Buy groceries for the week.
- Call Penelope.
```
*Figure 1*.  Example of displaying a todo list.


### Release 1: Add New Items to the List
Add a new feature to the application:  users should be able to add new items to the list.  When running the application, users will now need to specify what they want to do; users will pass command line arguments to  display the todo list or add a new item (See Figure 2).

In adding this feature, our application will have additional responsibilities.  We'll need to parse command line arguments and write to a file.  Anything else?  What object should be responsible for these new responsibilities?  Would it be appropriate for our existing objects to handle them?  Do we need new objects?

```
$ ruby todo_list_runner.rb list
- Walk the cat.
- Go to the gym.

$ ruby todo_list_runner.rb add "Finish code challenge."
Appended "Finish code challenge." to the list.

$ ruby todo_list_runner.rb list
- Walk the cat.
- Go to the gym.
- Finish code challenge.
```
*Figure 2*.  Use command line arguments to display a todo list or add a new item.


### Release 2: Remove Items from the List
Oh, the best laid plans ... Sometimes we add an item to the list, but as time passes we no longer want or need to complete it.  Rather than have such items sit on the list forever, add a feature that allows users to remove items (see Figure 3).


```
$ ruby todo_list_runner.rb list
- Walk the cat.
- Go to the gym.

$ ruby todo_list_runner.rb remove "gym"
Removed "Go to the gym." from the list.

$ ruby todo_list_runner.rb list
- Walk the cat.
```
*Figure 3*.  Removing an item from the list.


### Release 3: Mark Items as Complete
What do we do when we complete an item?  Given the current feature set, we'd have to remove it from the list; otherwise, it looks like we still need to take action on the item.  Add a feature that allows for completeness (see Figure 4).

Completing this feature will involve a number of changes.  We'll have to update our data file to store whether each item is complete.  We'll have to change how an item is represented in Ruby; its state will need to reflect its completeness.  We'll need to modify how a list is displayed.  We'll need to update our tests.  What other changes will we need to make?  As we add this completeness feature, be mindful of how our design decisions facilitate and/or hinder the change.


```
$ ruby todo_list_runner.rb list
[ ] Walk the cat.
[ ] Go to the gym.

$ ruby todo_list_runner.rb complete "walk the cat"
Marked "Walk the cat." as complete.

$ ruby todo_list_runner.rb list
[X] Walk the cat.
[ ] Go to the gym.
```
*Figure 4*.  Marking an item as complete.


### Release 4: Change the Data Store
Our todo list application is working well, but it's confined to the terminal.  Without their computers handy, users cannot access their todo lists.  But what if users could print out their lists before going to run errands or what-have-you?  To facilitate printing a todo list, we'll format our data file to be more readable.

Update the data store file in which we're storing the item data.  We'll switch from using a CSV file to using a plain text file (.txt) formatted as seen in Figure 5.

We're changing the backend data store file.  Pay attention to the effect this change has on our application.  For example, we won't be using Ruby's `CSV` library any longer, so we'll need to update the way we read in and write out item data.  Which objects do we expect to be affected by this change?  Which objects are actually affected?


```text
[X] Walk the cat.
[ ] Go to the gym.
[X] Buy groceries for the week.
[ ] Call Penelope.
[ ] Finish code challenge.
[ ] Book hotel for vacation.
```
*Figure 5*.  Format for the new data file.


## Conclusion
Think about the responsibilities in our application.  There are four high-level responsibilities.

1. Manipulating in-memory Ruby objects that model a real-life todo list (Model).
2. Formatting information and displaying it to the user (View).
3. Interpreting user input and taking the appropriate action (Controller).
4. Reading and writing data from a data file (Persistance).

Model-View-Controller is a design pattern that we'll use to design almost all of our applications—both our command-line applications and our web applications later at Dev Bootcamp.  We'll learn more about this design pattern going forward.  Which parts of our todo list application represent the model, the view, and the controller?



[wikipedia soc]: http://en.wikipedia.org/wiki/Separation_of_concerns
[wikipedia srp]: http://en.wikipedia.org/wiki/Single_responsibility_principle


