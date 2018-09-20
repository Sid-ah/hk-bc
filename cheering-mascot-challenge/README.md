# Cheering Mascot

##Summary

In this challenge we'll model some behavior based on a handful of rules, which will be explained to you.  We will be writing Ruby, employing and building on the skills that we've already developed.

The main focus of this challenge is flow control.  For example, we will need to determine how to control how long our program runs.  And, our program will behave differently under one condition than it will under another.  We'll be using these same techniques to write more complex algorithms throughout Dev Bootcamp.

In addition to flow control, we'll need to handle user interaction.  We'll have to get input from users and also display text back to the user.  Furthermore we're going to practice writing small methods, each of which does one thing.

The following resources might be helpful to you.

- [intro to getting user input](http://ruby-doc.org/docs/Tutorial/part_02/user_input.html)
- [displaying text: puts vs print](http://www.codecademy.com/glossary/ruby/puts-vs-print)
- [case statements](http://www.skorks.com/2009/08/how-a-ruby-case-statement-works-and-what-you-can-do-with-it/)
- [loops](http://www.tutorialspoint.com/ruby/ruby_loops.htm)


### Rules
We are leading some cheers, and we have a mascot helping us by holding up signs that correspond to our cheers.  Here are the rules for how the mascot behaves.  While these rules might feel a little arbitrary, we are practicing writing to specifications.

-  The cheering only ends (i.e., the program exits) when we call out, "GAME OVER".

- Shouting is the only way for the mascot to hear us; we shout by typing in all caps.  If we shout out the name of a cheer, the mascot responds with the appropriate sign.  For example, if we call out for the "RED HOT" cheer, the mascot holds up the "H-O-T!" sign.

- If we call out a cheer without shouting, the mascot doesn't understand us and holds up a generic sign.  For example, if we call out for the "red hot" cheer, the mascot holds up the "Go Team!" sign.

- The mascot only knows a handful of cheers.  If we call out for a cheer the mascot doesn't know, it responds with the generic "Go Team!" sign.

  | KNOWN CHEER     | SIGN           |
  | :-------------: | :------------: |
  | RED HOT         | H-O-T!         |
  | DO IT AGAIN     | Go, Fight, Win |
  | 2 BITS          | Holler!        |
  | STOMP YOUR FEET | STOMP!         |

  *Table 1*.  Cheers known by the mascot and their corresponding signs.

##Releases

### Release 0: Helper Methods

Take a look at the `mascot.rb` file.  Four empty methods are defined.  During this challenge, we'll flesh these out, and we'll begin with the `call_out_cheer`, `mascot_sign_for`, and `display` methods.  Each of these methods will do one thing, providing a specific piece of functionality that the `coordinate_cheers` method will use.

- **`call_out_cheer`**

  We'll use the `call_out_cheer` method when we need the user to specify a cheer.  The method should get user input and return that input.

- **`display`**

  We'll use the `display` method when we need to print information for the user to see—for example, the sign the mascot holds up.  The method should take an argument and print it out.

- **`mascot_sign_for`**

  We'll use the `mascot_sign_for` method to determine how the mascot will respond to user input.  We'll pass an argument to the method, and the method will return the appropriate response based on the rules for our application.

RSpec tests have been provided in the file `spec/mascot_spec.rb` to guide us through writing these methods.  When the tests pass, our methods should be behaving as described.


### Release 1: Calling Out Multiple Cheers

After our helper methods are in place, it's time to write the `coordinate_cheers` method.  This is the method that is going to coordinate us calling out cheers and the mascot's responses.

When we call the `coordinate_cheers` method, as is done at the bottom of the `runner.rb` file, we should find ourselves in a setting that conforms to the rules described in the *Summary*.  Until we call out "GAME OVER", we should be calling out cheers and the mascot should be responding appropriately to each call.

To begin cheering, run `ruby runner.rb`.


### Release 2: Changing Specifications

- The cheering ends if no cheer is called out two times in a row.

The rules have changed.  We now need a second way to end a conversation (i.e., exit the program).  Users can end the conversation by not calling for another cheer.

Update the `coordinate_cheers` method to model this behavior: when prompted to call out a cheer, entering an empty string *twice in a row* causes the program to exit.


## Conclusion

We wrote a small program that conforms to a set of prescribed specifications.  Writing code to match specifications is a skill, and we'll be practicing it going forward.

In order to get the specified functionality, we had to control the flow of our application, causing it to behave appropriately under different conditions.  In addition, we combined the behaviors of small methods to create a more complex behavior.  We'll want to continue that going forward.

Finally, before moving on, read through your code.  Is your code easy for humans to read?  Are your variable names descriptive of their values?  Does your indentation conform to Ruby conventions?  Could another of your cohort mates read through your code and know what each line does?

