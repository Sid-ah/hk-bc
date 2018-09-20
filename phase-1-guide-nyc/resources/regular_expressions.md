# Regular Expressions

When working with strings, you will eventually find yourself saying something like "how do I retrieve all of the email addresses from this string?" or "how can I check if this string is a valid credit card number?"

If we take a step up the ladder of abstraction, we notice that both of these questions deal with **pattern matching** – there is a pattern of characters in a string that we want to discover or manipulate. Regular Expressions are the tool for the job.

Here is a (very loose) regular expression for matching an email:

```ruby
/\w+@\w+\.[a-z]{2,5}/i
```

Let's break this apart **[DESCRIBE EACH COMPONENT]**

- `/`
- `\w`
- `+`
- `@`
- `\.`
- `[a-z]`
- `{2,5}`
- `/i`

#### Appropriate use

When matching patterns of characters in a string.

```ruby
# Problem: count all of the vowels in a sentence
sentence = "The quick brown fox jumps over the lazy dog."

# Without RegExp =>
vowels    = ['a', 'e', 'i', 'o', 'u']
instances = []

vowels.each { |vowel| instances << sentence.scan(vowel) }
instances.flatten!
puts instances.count

# With RegExp =>
vowels = sentence.scan(/[aeiou]/)
puts vowels.count
```