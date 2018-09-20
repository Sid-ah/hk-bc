# Ruby Drill: Command Line Arguments

## Summary
When we write an application, we sometimes need to get data from the user.  For example, if we wanted to write an application that allows users to convert English to Pig Latin, the user would need to supply the English.  One option is to build a user interface that asks the user for input.  We can see an example of this in Figure 1.

![user interface animation](readme-assets/user-interface-animation.gif)

*Figure 1*.  A script which prompts the user for input.

Alternatively, we can write an application so that users pass in data right when the application is executed.  In other words, users supply *command line arguments* when they run the application.  Just like passing arguments to a method when we call it, we can provide arguments to our applications when we run them.  We can see an example of this in Figure 2.

![argv interface animation](readme-assets/argv-animation.gif)

*Figure 2*.  A script which relies on command line arguments.


### Accessing Command Line Arguments
If a user runs our application and passes in command line arguments, how do we access them?  What type/types of objects are they represented by?

When we execute a Ruby script, Ruby creates a constant for us: `ARGV`—short for argument vector.  The value of `ARGV` is always an array.  Each of the command line arguments we pass when running the script becomes an element in the array—specifically, each argument is a string in the array.

When we execute a Ruby script we use the `ruby` command followed by the name of the file to run.  Any additional text is used as the command line arguments. Each individual word is considered a separate argument, but we can use quotation marks to get around this.  In Table 1, we have some examples of running a ruby script and what `ARGV` would look like in each example.

| Example       | Executing the Script                | Value of `ARGV` in Ruby |
| :---          | :--                                 | :---                    |
| No arguments  | `$ ruby runner.rb`                  | `[]`                    |
| 1 Argument    | `$ ruby runner.rb Chris`            | `["Chris"]`             |
| 2 Arguments   | `$ ruby runner.rb Chris Seidel`     | `["Chris", "Seidel"]`   |
| 1 With quotes | `$ ruby runner.rb "Chris Seidel"`   | `["Chris Seidel"]`      |
| 2 With quotes | `$ ruby runner.rb "Chris Seidel" 5` | `["Chris Seidel", "5"]` |

*Table 1*.  Example `ARGV` values based on command line arguments.


## Releases
### Release 0: Refactor to Use Command Line Arguments
Take a minute to run the provided script:  `ruby runner.rb`.  We'll be asked to input two words, and the script will report whether or not the two words we input are anagrams.

Refactor the code in the file `runner.rb` so that instead of asking the user for input, the user provides both words as command line arguments.  Remember, each command line argument will be accessible as a string in the `ARGV` array.


## Conclusion
This was a first look at writing code that works with command line arguments.  We'll see them pop up from time to time, and we'll use them regularly.

```
$ rspec --no-color  --format progress spec/anagram_spec.rb
```
*Figure 3*.  Running RSpec with command line arguments for configuration.

Actually, we're already using them.  When we run the `rspec` command we sometimes specify different options, like a specific file to run. And we might configure its color options or format the output a certain way.  When we do so we're using command line arguments (see Figure 3).  And, being that RSpec is written in Ruby, those options end up in `ARGV` (see [code][rspec-core argv]).  When we begin working with Rails, we'll use the `rails` command and use command line arguments to specify what we want to do:  start the server, open the console, etc.  As we can probably guess, these command line arguments end up in `ARGV` (see [code][rails argv]).

[rails argv]: https://github.com/rails/rails/blob/master/railties/lib/rails/commands.rb
[rspec-core argv]: https://github.com/rspec/rspec-core/blob/be0e1bc0a2b03e3f820195f54b0fe96c87fa587f/lib/rspec/core/runner.rb#L45
