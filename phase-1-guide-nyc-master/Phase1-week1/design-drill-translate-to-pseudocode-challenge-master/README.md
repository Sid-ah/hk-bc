# Design Drill: Translate To Pseudocode

## Summary
Most of us do not "think in code" when we are living our daily lives. We interact with other humans who, unlike computers, are intuitive and emotive creatures. Logic and mathematical reasoning certainly play a role in our everyday thinking, but we have these wonderful things called senses which help us navigate the world and perform all kinds of complex calculations without much conscious effort.

Part of being an effective programmer is the ability to communicate the functionality of a program to other programmers.  [Pseudocode][pseudocode] is one method for communicating the functionality of our programs, and learning to write, think in, and interpret pseudocode will help us train our brains to understand how a computer "thinks". If we can think like computers, it will be easier to write in a way that a computer can understand.

In this challenge, instead of translating our solution to a problem into pseudocode and then into code, we'll practice writing pseudocode from the opposite direction. We'll start with working code, read it, and record—in pseudocode—our understanding of how the program functions.


## Releases
### Release 0: Understand the Code
We're going to write pseudocode that describes how the `grab_gold` method functions (see `grab_gold.rb`).  The first step is to read through the method to understand how it functions.  If it helps to see how the method is used, see and run `runner.rb`.

*Note:*  The code in the `grab_gold` method is not exemplary (e.g., poor variable naming).  This is intentional; we need to be able to read and understand code—even poorly written code.


### Release 1: Translate to Pseudocode
Once we understand how the `grab_gold` method is working, we can record that understanding as pseudocode; we'll write our code in the file `pseudocode.txt`.  There are not hard-and-fast rules around pseudocode, but we should follow some [guidelines].  If we're struggling to find the right level of detail, the right mix of English and coding terms, etc. we can reference this [standard], which provides some examples.


## Conclusion
Writing pseudocode can help us organize our approach to solving a problem without getting bogged down in the syntax of a specific language.  It's effective both for developing our own understanding and also communicating our thoughts.  As with writing actual code, developing pseudocode takes time and practice.


[pseudocode]: https://en.wikipedia.org/wiki/Pseudocode
[guidelines]: http://www.cs.cornell.edu/Courses/cs482/2003su/handouts/pseudocode.pdf
[standard]: http://users.csc.calpoly.edu/~jdalbey/SWE/pdl_std.html
