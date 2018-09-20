# Design Drill: Code Style

## Summary
Good code is clean and organized. It follows a set of grammatical and syntactical conventions.  The best programmers follow the accepted standard for a given language, framework, or [domain specific language](http://martinfowler.com/bliki/DomainSpecificLanguage.html).  As we continue to write code, we'll probably develop a personal style, but we should stay within conventions.

Whether it's open source or proprietary, any piece of software should use a style guide, which its contributors should follow.  For a Ruby project, there are plenty of style guides from which to choose.  Which style guide is selected isn't as important as everyone on the team following it.

In this challenge, we'll practice refactoring code to match a given style guide.


## Releases
### Pre-release: Read the Style Guide
Before we begin to refactor our code, let's first read through the style guide that we'll be expected to follow:  [Ruby Style Guide](https://github.com/bbatsov/ruby-style-guide).  In particular, make sure to read the sections on [naming](https://github.com/bbatsov/ruby-style-guide#naming), [comments](https://github.com/bbatsov/ruby-style-guide#comments), and [source code layout](https://github.com/bbatsov/ruby-style-guide#source-code-layout).


### Release 0: Implement Style Consistency
We are provided with some code in the file `guessing_game.rb`.  The code is tested and working (see file `spec/guessing_game_spec.rb`)—run the tests to confirm that they pass.  The code for the guessing game is extremely messy, and our task is to clean up this code by following the conventions defined in the style guide we read through.

As we make changes, we need to ensure that the tests still pass.  We can make any changes necessary, so long as we don't break the tests.  We are just adding a fresh layer of paint to the walls, not tearing them down.


## Conclusion
During our time at Dev Bootcamp, we should always strive to write readable, maintainable code.  Doing so entails following style conventions:  two-space indentation, whitespace around operators, naming, etc.  As we move forward, let's continue to apply this Ruby style guide to our code.
