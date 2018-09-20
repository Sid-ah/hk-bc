# Combating Smells: Extract Method

##Summary
As we become more experienced developers, we'll begin to develop a sense for problems in code.  We'll notice qualities in the code that give us pause.  Something about the code won't look or feel right.  We call these qualities code smells.

Code smells are signals that portions of code could be improved. Identifying smelly code is not enough because all code has smells. Choosing which smells to address and which to ignore is a key survival skill.  When we do decide to fix a smell, we need to know how to improve the code.

In this challenge, we're going to read about common code smells and look at approaches to correcting them.  We'll then apply this to some code that we've written.


## Releases
### Pre-release:  Reading on Code Smells
Before we get into our refactoring, we'll do a little bit of reading on code smells.  We'll begin by reading an [article on code smells](http://martinfowler.com/bliki/CodeSmell.html).  We'll follow that by reading through this [reference list](http://www.industriallogic.com/wp-content/uploads/2005/09/smellstorefactorings.pdf) of common code smells.


### Release 0: Extract a Method
In the reference list that we read through in the *Pre-release* section, a number of code smells could be combated by extracting a method out of a chunk of our code.

In the file `refactor.rb`, list each smell that can be dealt with by the *Extract Method* refactoring.


### Release 1: Find an Example to Refactor
Let's review some of our previously written code.  Find a piece of code that exhibits one of the smells we listed in Release 0. Copy the code to the `refactor.rb` file and name each of the smells detected in the code.


### Release 2: Refactor
Now let's refactor our code to eliminate the code smells that we listed in *Release 1*.

Let's remember the role that tests provide when we refactor code.  As we refactor, we want to ensure that we don't break functioning code.


## Conclusion
Being new developers, code smells won't necessarily be obvious to us.  We need to be intentional about examining our code and looking for ways to improve its quality.  Over time, this intentional practice will train our senses until detecting code smells becomes more automatic.
