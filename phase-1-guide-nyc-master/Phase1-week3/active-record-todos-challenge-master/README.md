# ActiveRecord Todos

## Summary
This challenge will require us to employ a fairly comprehensive set of the skills that we've been developing at Dev Bootcamp.  We'll take what we've learned about object-oriented programing, the model-view-controller design pattern, Active Record, etc. and put them all together to build a command line application.

Our challenge is to build a functioning todo list application using a database and command line interaction.  We might have built a command-line todo list application before—perhaps using CSV for persistence.  If so, this is an opportunity to build upon that design and improve our object-oriented implementation.


### Design Decisions
There will be few hard and fast rules regarding implementation (i.e., how to build the application).  Instead, we'll be given features to build out, and we'll have to decide how best to implement them.

As we work through the features, it will be important to think about the responsibilities of our application.  These responsibilities aren't just user-facing commands like (*add*, *delete*, etc.); they're also back-end responsibilities like reading and writing from the database, parsing command-line arguments, formatting data for printing to the console, etc.  We'll want to implement solid design choices, keeping concepts such as the [single responsibility principle][Wikipedia SRP] and [separation of concerns][Wikipedia SOC] in mind.

As we work through the releases in this challenge, we'll want to pay close attention to how change impacts our application.  What happens when a new feature is added?  How many parts of our application require changing?  How frustrating is it to make those changes?  Are we modifying unexpected parts of our application?  We should try to employ the advice from [the POODR book][POODR]:  write code that is easily changeable.


## Releases

### Pre-release: Review the Code Base
This challenge uses a code base similar to ones we've seen in other challenges.  The `Gemfile` specifies the gems the skeleton needs; we need to make sure they're installed on our systems.  And a `Rakefile` is provided.  We can review the tasks that we have available by running `bundle exec rake -T`; all of the tasks we're accustomed to using are available.

We'll run our program by executing the `runner.rb` file.


### Release 0: Add a Task
```
$ bundle exec ruby runner.rb add Walk the dog
Added "Walk the dog".
```
*Figure 1*.  Adding a "Walk the dog" task.

The first feature to build out is the ability to add tasks.  A user should be able to run our application with the command line argument *add* followed by a description of the new task.  The new task should be persisted in the database, and the user should receive confirmation that the task was saved. (see Figure 1)


### Release 1: List the Tasks
```
$ bundle exec ruby runner.rb list
1. Walk the dog
2. Bake a delicious blueberry-glazed cheesecake
3. Write up that memo and fax it out
```
*Figure 2*.  Viewing a list of the tasks.

Now that we can add tasks, let's add a feature that allows users to see the tasks that have been created. (see Figure 2)


### Release 2: Delete a Task
```
$ bundle exec ruby runner.rb list
1. Walk the dog
2. Bake a delicious blueberry-glazed cheesecake

$ bundle exec ruby runner.rb delete 2
Deleted "Bake a delicious blueberry-glazed cheesecake"

$ bundle exec ruby runner.rb list
1. Walk the dog
```
*Figure 3*.  Deleting a task.

Add a feature that allows users to delete a specific task by running our application with the command line argument *delete* followed by the number displayed next to the task when the list is shown.  (see Figure 3)


### Release 3: Completing a Task
```
$ bundle exec ruby runner.rb list
1. [ ] Walk the dog
2. [ ] Bake a delicious blueberry-glazed cheesecake

$ bundle exec ruby runner.rb complete 2
Marked "Bake a delicious blueberry-glazed cheesecake" as complete

$ bundle exec ruby runner.rb list
1. [ ] Walk the dog
2. [X] Bake a delicious blueberry-glazed cheesecake
```
*Figure 4*.  Marking a task as complete.

Now we'll add task completion to our application.  Users should be able to mark tasks as complete by running our application with the command line argument *complete* followed by the number displayed next to the task when the list is shown.  When listing tasks, we'll also want to show users whether or not a task is complete.  (see Figure 4)


### Release 4: Listing Outstanding and Completed Tasks
```
$ bundle exec ruby runner.rb list
1. [ ] Walk the dog
2. [X] Bake a delicious blueberry-glazed cheesecake

$ bundle exec ruby runner.rb list outstanding
1. [ ] Walk the dog

$ bundle exec ruby runner.rb list completed
2. [X] Bake a delicious blueberry-glazed cheesecake
```
*Figure 5*.  Displaying lists of outstanding and completed tasks.

Add a feature that allows for displaying only outstanding or only completed tasks. (see Figure 5)


### Release 5: Tagging Tasks and Filtering Lists
```
$ bundle exec ruby runner.rb list
1. [ ] Walk the dog
2. [X] Bake a delicious blueberry-glazed cheesecake

$ bundle exec ruby runner.rb tag 1 pet-care dog
Tagged "Walk the dog" with tags: pet-care, dog

$ bundle exec ruby runner.rb tag
Tags: "dog", "pet-care"

$ bundle exec ruby runner.rb filter dog
1. [ ] Walk the dog
```
*Figure 6*.  Adding tags to a task, viewing tags, and filtering the list of tasks to just those tagged *dog*.

Add tagging and filtering by tags to our application.  Users should be able to add multiple tags to a specific task, view a list of tags that they've added to tasks, and filter their list of task by a specific tag.  (see Figure 6)


### Release 6: Support for Multiple Todo Lists
We need to support multiple todo lists.  For example, a user might have separate *home* and *work* lists.  Where previously all tasks were lumped together, now we want to organize them into specific lists.

Our application will need to support ...

- Creating and deleting todo lists.
- Viewing a list of existing todo lists.
- Viewing the tasks in all lists (all, outstanding, completed, or tagged).
- Viewing tasks in a particular todo list (all, outstanding, completed, or tagged).
- Adding, deleting, completing, and tagging a task in a particular list.

In order to support this new feature, we'll need to update our interface (i.e., the commands which our application understands).  What would make for intuitive commands?  We should feel free to modify our previous commands if necessary.


### Release 7:  Help Support
```
$ bundle exec ruby runner.rb --help
```
*Figure 7*.  Asking for help in running the application.

Let's add a help feature.  When users ask for help (see Figure 7), they should see a list of commands they can run with a description of what each command does and how to run each command.


## Conclusion
This challenge is more open-ended than most other challenges we've encountered.  How was it being directed what to build without much guidance on how to build it?  Was it hard to know where to start?  Did we know which tools would be effective in different situations?  Were we able to make good design decisions or were we more interested in just making it work?

As noted in the *Summary*, this challenge provides a comprehensive look at the material we've covered at Dev Bootcamp.  Reflect back on this challenge.  Where were you strong?  Where do you need to improve?


[POODR]: http://www.poodr.com/
[Wikipedia SOC]: http://en.wikipedia.org/wiki/Separation_of_concerns
[Wikipedia SRP]: http://en.wikipedia.org/wiki/Single_responsibility_principle
