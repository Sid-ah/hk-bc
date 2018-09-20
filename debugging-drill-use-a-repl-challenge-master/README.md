# Debugging Drill: Use A REPL 
 
## Summary
In this challenge, we're going to explore working in the [Interactive Ruby Shell](http://en.wikipedia.org/wiki/Interactive_Ruby_Shell)—IRB, for short. As the name indicates, the Interactive Ruby Shell is a command-line interface for interacting with Ruby.  IRB has access to the full Ruby language, so we can utilize all its features from within a console.

IRB is Ruby's [read-eval-print-loop](http://en.wikipedia.org/wiki/Read%E2%80%93eval%E2%80%93print_loop), or REPL.  Most languages have a REPL and they work roughly the same way:

- **Read.**  A user is prompted to input Ruby expressions (e.g., `5 + 4`).
- **Evaluate.**  The expression entered by the user is evaluated.
- **Print.**  The result of the evaluation is displayed.
- **Loop.**  Repeat until the user exits.


Think of IRB as a sandbox where we can experiment and play with Ruby.  As we're introduced to new Ruby [libraries](https://www.ruby-lang.org/en/libraries/), IRB is a great place to explore the capabilities of the library.  We can also load and use code that we ourselves write.


## Releases

### Pre-release:  Start the IRB Session
```bash
$ irb
2.2.1 :001 >
```
*Figure 1*.  Opening IRB.

After cloning this repository, open Terminal and navigate to the challenge directory.  From there we'll start an IRB session (see Figure 1).

When IRB opens, we should see the command prompt change to display the version of Ruby we're using.  In Figure 1, we can see that the Ruby version used in the example is version `2.2.1`  And, with our IRB session started, we can now write Ruby code that will execute immediately.

*Note:* The prompt identifies the Ruby version used, so it might be different on different machines.


### Release 0: Read, Evaluate, Print, Loop ...
```
2.2.1 :001 > 1 + 1
 => 2
```
*Figure 2.*  Evaluating the expression `1 + 1`.

As mentioned in the *Summary*, in IRB we can input expressions, which will be evaluated and whose value is printed.  In Figure 2, our expression, `1 + 1`, will be evaluated and the result of the evaluation displayed for us:  `2`.

Run the code in Figure 2 in our open IRB session.  As we work through later releases, be sure to run the code from each of the example figures in our open IRB session.

*Note:* In IRB  we can use `ctrl + c`, if we make a typo or otherwise need to cancel what we're currently typing.


### Release 1: Variables and Methods
```
2.2.1 :002 > sum = 1 + 1
 => 2
2.2.1 :003 > sum
 => 2
```
*Figure 3*. Declaring, assigning, and accessing a variable in IRB.

We can declare variables and define methods in IRB.  These variables and methods exist only for this particular IRB session.  Once we exit this IRB session, these variables and methods are lost.

In Figure 3, we declare and assign a variable `sum` and then access its value.

```
2.2.1 :004 > def greeting
2.2.1 :005?>   return "Hello."
2.2.1 :006?>   end
 => nil 
2.2.1 :007 > greeting
 => "Hello." 
```
*Figure 4*.  Defining and calling a method in IRB.

Some Ruby code is generally typed over multiple lines—for example, when declaring a method or writing `if` statements.  We can do the same in IRB; our expressions won't be evaluated until we close our expressions with `end`.

In Figure 4, we define a method that returns a string.  Notice that while we're defining the method a `?` is added to the prompt and our entries are indented until we finish defining the method.  After the method is defined we can call it.  


### Release 2: Requiring Other Libraries
When we start an IRB session, we have access to the [Ruby Core libraries](http://ruby-doc.org/core-2.0.0/#class-index).  We used the `Fixnum` object, `1`, and the instance method `:+`.  We also created a `String` instance in our `greeting` method.  We could also use the classes `Array`, `Hash`, etc.

There are other Ruby libraries than those which are part of the Ruby Core.  Some of them are part of the [Ruby Standard Library](http://ruby-doc.org/stdlib-2.0.0/).  They are installed as part of Ruby, but they are not automatically loaded into the environment when Ruby runs.  Instead we have to require them manually.

The same is true for installed Ruby gems.  Once they've been installed, we can require them in our programs.

```
2.2.1 :008 > require 'date'
 => true
2.2.1 :009 > my_birthday = Date.new(1980,4,15)
  => #<Date: 1980-04-15 ((2444345j,0s,0n),+0s,2299161j)>
```
*Figure 5*. Requiring a library in IRB.


In Figure 5, we require the date library, which is part of the Ruby Standard Library.  If the library loads successfully, `true` will be printed.  We now have access to two classes:  `Date` and `DateTime`.  We can use them in our IRB session.


### Release 3: Loading a File
```
2.2.1 :010 > load "dog.rb"
 => true
2.2.1 :011 > jayda = Dog.new("Jayda", "OH-123456")
 => #<Dog:0x007fd9aa3605e8 @name="Jayda", @license="OH-123456"> 
2.2.1 :012 > jayda.name
 => "Jayda" 
2.2.1 :013 > jayda.license
 => "OH-123456" 
```
*Figure 6*.  Loading code in a file in IRB.

We can also load files that we've written.  An example file has been provided:  `dog.rb`.  This file defines a `Dog` class.  In Figure 6, we load the file and then make use of our code by creating an instance of the `Dog` class.


### Release 4: End the IRB Session 
```
2.2.1 :014 > exit
```
*Figure 7*.  Exiting IRB.

When we're done exploring, we can exit the IRB session (see Figure 7). When we exit IRB, our command line prompt returns to normal.

*Note:* There is no code to submit for this challenge.


## Conclusion
Being able to explore Ruby is a critical skill—whether the Ruby Core, the Standard Library, a gem, or our own code.  Working in a REPL like IRB is useful for both learning how to use an unfamiliar library and also working with code we're writing.

If you find yourself wondering how a piece of code is working or why something isn't working, opening a REPL and exploring is a great place to look for answers.
