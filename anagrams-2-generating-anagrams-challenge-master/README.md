# Anagrams 2: Finding Anagrams

## Summary
This challenge builds upon a [previous challenge][anagrams-1-detecting-anagrams-challenge] dealing with identifying [anagrams][wikipedia anagrams]—it's assumed that we've completed this previous challenge.

```ruby
list = ['melon', 'lemon', 'apple']
# => ['melon', 'lemon', 'apple']
find_anagrams('melon', list)
# => ['melon', 'lemon']
```
*Figure 1*. Finding anagrams of melon in a list of words.

In this challenge we're going to write a `find_anagrams` method that takes two arguments: a target word and a list of words.  The method returns all the anagrams for the target word that can be found in the list. (see Figure 1)

*Note:*  We are free to reference our solution to the earlier anagrams challenge.


## Releases
### Release 0: Pseudocode
Given a word and a dictionary, how could we create a list of the word's anagrams by hand?  Our `find_anagrams` method will model how we would perform this task in the real-world.  Do we understand the process we would use well enough to teach it to someone else?  The better we understand our process, the easier it will be to translate it into instructions for the computer.

Before we begin to code our solution, let's pseudocode our own mental procedure in a way that's both easy for a human to understand and also to translate into a programming language.


### Release 1: Developing our Method
The general behavior of our `find_anagrams` method is described in the *Summary*, and one test example has been written for us that describes this basic behavior.

In addition to the basic behavior, we'll want to make sure that we write tests that describe the behavior of our method in specific cases.  Each item from the following list of requirements should be covered by tests.

- Anagrams are case-insensitive.
- A word is an anagram of itself.
- If the list contains no anagrams of the target word, the return value is empty.
- Neither the target word nor the words in the list need to be real English words.
- If the target word is in the list of words, it should be included in the return value.


### Release 2: Refactor
Once our method is working and all our tests are passing, let's refactor our code.  We'll want to ensure that our code follows Ruby style conventions and is as readable as possible.

Let's also take a look at the performance of our method.  Is there any rework going on?  Do we perform the same calculations on the same data multiple times?  If so, can we eliminate this without our code becoming a mess?


## Conclusion
This challenge presented us with an opportunity to reuse code and to combine the functionality of different methods to make a new program.  Piecing together different libraries and bits of code is a common programming behavior.

We've also been working on writing tests.  Are we comfortable writing RSpec tests?  Do we understand how tests provide insight into whether or not our code behaves as we expect?  Are we able to follow a test-driven approach to development?


[wikipedia anagrams]: http://en.wikipedia.org/wiki/Anagram
[anagrams-1-detecting-anagrams-challenge]: ../../../anagrams-1-detecting-anagrams-challenge
