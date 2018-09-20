# String Matching with Regular Expressions

## Summary
In this challenge we'll be working with Ruby's [`String`](http://ruby-doc.org/core-2.1.0/String.html) and [`Regexp`](http://ruby-doc.org/core-1.9.3/Regexp.html) classes.  More specifically, we'll be searching strings for specific patterns of characters, which we'll be defining as regular expressions.

The Ruby `String` class defines over 100 public methods that give Ruby programmers remarkable power to process, manipulate, and transform textual data.  About a dozen of these string methods can be used with regular expressions in order to allow for high-powered string matching.

What do we mean by high-powered string matching?  Let's begin by looking at an example of low-powered string matching. If we're on a webpage, we can use our browser's search functionality (⌘f on a Mac) to search for a specific word within the page's text. This search is limited because we need to input the exact characters that we're looking for.

What if we wanted to search for something less specific?  Any phone number, or any e-mail address on the page? We wouldn't know the exact digits of any phone number that might be on the page, but we could guess that an American phone number would probably contain 10 digits, probably divided into groups of three, three, and four digits.  This is the type of high-powered matching that regular expressions offer and which we'll be exploring in this challenge.


### Troubleshooting Regular Expressions
Sometimes we think that we've defined a regular expression to match a specific pattern, but when we use it, we realize that there's a bug.  Fortunately, there are many resources available online to help us.  [Rubular](http://rubular.com) is a great online Ruby regular expression editor we can use to develop and debug our regular expressions.

We can also refer to the [Pickaxe Guide](http://www.ruby-doc.org/docs/ProgrammingRuby/html/language.html#UJ) or this [regular expressions overview](http://www.bluebox.net/about/blog/2013/02/using-regular-expressions-in-ruby-part-1-of-3/) if we get stuck.


## Releases
### Pre-release:  Organization
We'll be writing our code in the file `social_security_numbers.rb`.  A handful of empty method definitions have been provided, and we'll build each of these methods out during this challenge.  Tests for each method have been provided in the file `spec/social_security_numbers_spec.rb`.


### Release 0: Identifying a Social Security Number
In this challenge we'll be working with Social Security Numbers.  We'll begin by reporting whether or not we can find a social security number in a given string.  Let's build out the method `has_ssn?` so that it returns `true` if a given string contains a social security number and `false` otherwise (see the tests).

How will we define what a Social Security Number looks like?  Is there a pattern to the way they're written?  Which string methods seem appropriate for such matching?  If we need to, we should browse the `String` class [docs](http://www.ruby-doc.org/core-1.9.3/String.html) to find an appropriate method.


### Release 1: The Other Methods
We'll now define the rest of the methods until all of the tests pass.  For each of the methods we'll be writing, there is a specific string method that will help us to achieve the behavior defined by the tests.  Let's read through the docs and select the most appropriate methods we can find.


### Release 2: Improve Test Coverage
Tests provide us with valuable feedback on whether or not our methods are behaving as we expect.  However, sometimes our code works only as well as our tests.

As we were working through the methods in this challenge, we encountered the `format_ssns` method which requires us to match Social Security Numbers in different formats:  *123456789*, *123.45.6789*, and *123--45--6789*.  However, the tests for our `has_ssn?` method only test that the method finds Social Security Numbers in the format *123-45-6789*.  Is that acceptable, or should it also find Social Security Numbers in other formats?

Read through the test suite and add additional tests to make us feel more comfortable that our methods are behaving the way we want.  For instance, what do we want to happen when we pass a string with only a single Social Security Number into the `hide_all_ssns` or `get_all_ssns` methods?


## Conclusion
Did a user register for our site with what appears to be a real e-mail address?  What about a real phone number?  Can we find all of the links in that HTML?  Regular expressions and the string methods that utilize them are powerful tools.  Being comfortable with them and knowing when it's appropriate to use them will help us write concise, readable code when dealing with text.
