# Anagrams 1: Detecting Anagrams

## Summary
In this challenge, we'll write a method that will tell us if two words are *anagrams*.  An [anagram][wikipedia anagram] is a word formed by rearranging the letters of another word. For example, we can spell *melon* by rearranging the letters in *lemon*.  Therefore, melon is an anagram of lemon.  We could also say that lemon is an anagram of melon.  Or, we could just say that lemon and melon are anagrams.  Regardless of how we say it, two words are anagrams if we can rearrange the letters of one to spell the other.


## Releases
### Release 0: How to Detect Anagrams
To begin this challenge, let's think about how we might detect whether two words are anagrams.  Each student in a pair should define a process for detecting anagrams and then explain the process to the pair.

Was the process easy to explain?  Did the pair understand?  If it was difficult to explain the process to another person, it will probably be difficult to put it into code.  Refactor each process's explanation until each process is easily communicated.

Then, select one of the processes for detecting anagrams and translate it into pseudocode.  Our pseudocode should be both easy for a human to understand and to translate into code.

*Note:*  Timebox this release:  if we have spent more than 20 minutes trying to figure out how to detect anagrams, check in with other students or an instructor.


### Release 1: Implement in Ruby
```ruby
anagrams?('melon', 'lemon')
# => true
anagrams?('melon', 'bike')
# => false
```
*Figure 1*.  Detecting anagrams.

We'll write a method `anagrams?` that accepts two string arguments and returns `true` if the strings are anagrams and `false` if they are not (see Figure 1).

No tests have been provided.  We'll need to write them ourselves.  Remember our test-driven development approach: start with the simplest case and move toward more complex cases.


### Release 2: Edge Cases
```ruby
# Argument order does not matter.
anagrams?('melon', 'lemon')
# => true
anagrams?('lemon', 'melon')
# => true

# A word is an anagram of itself.
anagrams?('melon', 'melon')
# => true

# Anagrams are case-insensitive.
anagrams?('MELON', 'lemon')
# => true

# The arguments don't need to be valid English words.
anagrams?('abcde2', 'c2abed')
# => true
anagrams?('kilso', 'osilk')
# => true
```
*Figure 2*.  Edge case examples for detecting anagrams.

To be more certain that our method behaves as we expect, let's test for some edge cases.  Figure 2 demonstrates some requirements for the behavior of our method.  Each requirement should be documented in our test suite and our method updated so that all tests pass.


### Release 3: Extracting a Method
As we refined our method's behavior in *Release 2*, how many changes did we have to make for each edge case—for example, making anagrams case insensitive?  Did we have to make the same change to our code in more than one place?

In comparing the two string arguments, our method is probably manipulating each string and then comparing the results of each manipulation, and there's a decent chance that we were repeating ourselves in our code, which led to making the same change to our code in more than one place.  We can improve our code, making it easier to update and maintain, by extracting the manipulation of each string into its own method.

The manipulated version of each word represents its [*canonical*][wikipedia canonicalization] form, and two words are anagrams if their canonical forms are equal (i.e., the manipulated versions of the words are the same).  So, the canonical form of melon is the same as the canonical form of lemon.

```ruby
def anagrams?(word, possible_anagram)
  anagram_canonical_form(word) == anagram_canonical_form(possible_anagram)
end

def anagram_canonical_form(word)
  # Manipulate word into canonical form ...
end
```
*Figure 3*.  Extracting the logic for manipulating a word into its own method.

Let's refactor our `anagrams?` method by extracting the string manipulation into its own method (see Figure 3).  Since this is a refactor, we shouldn't need to change our tests, but we do want to be sure that each test continues to pass.


## Conclusion
In this challenge, we modeled a real-world system in Ruby.  Along the way, we had to understand how the real-world system behaves; develop and communicate a process for modeling that system; translate that process into pseudocode, tests, and Ruby code; and refine our process given new requirements.

What were the most challenging parts of completing this challenge?  Understanding the real-world system?  Communicating our process for detecting anagrams to another person?  Translating our thinking into Ruby code?  Following a test-driven development approach to programming?  If we can become aware of where we struggle most, we can concentrate on improving those areas.


[wikipedia anagram]: http://en.wikipedia.org/wiki/Anagram
[wikipedia canonicalization]: https://en.wikipedia.org/wiki/Canonicalization
