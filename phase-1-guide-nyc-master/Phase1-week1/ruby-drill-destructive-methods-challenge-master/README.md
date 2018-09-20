# Ruby Drill: Destructive Methods

## Summary
```ruby
class_name = "SomeClassName"
# => "SomeClassName"
to_snake_case(class_name)
# => "some_class_name"
class_name
# => "SomeClassName"
to_snake_case!(class_name)
# => "some_class_name"
class_name
# => "some_class_name"
```
*Figure 1*. A `to_snake_case` method and a dangerous equivalent method with a side effect.

What is the difference between the `to_snake_case` and `to_snake_case!` methods in Figure 1?  Both take the same object as input and return the same output value.  The difference is in what happens to the argument to each method.  In addition to providing a return value, the `to_snake_case!`method changes the object passed to it.

In Ruby, it's not uncommon to encounter such pairs of methods—for example, `String#upcase` and `String#upcase!` or `Array#map` and `Array#map!`.  We'll be writing a pair of such methods in this challenge.

We generally think of methods in terms of their *inputs* and *outputs*.  Arguments are passed into the methods.  Some value comes out of the method.  In Figure 1, we input the string `'SomeClassName'` to the `to_snake_case` method, and the string `'some_class_name'` comes out of the method.  And that's all that happens.

Methods that take input and provide an output are sometimes known as *[pure functions]* because they don't affect anything outside of themselves. The only things that change happen between `def` and `end`; the world before and after the method runs is exactly the same.

Other methods have what we call *side effects*.  Side effects are changes that occur outside of a method when the method runs.  Maybe a file is written or text is printed to the command line.  Methods with side effects are also known as *impure functions*.

A common side effect, as seen in Figure 1, is mutating, or changing, an object.  What happens to the value of our variable `class_name` when we pass it to the `to_snake_case!` method?  The object changes.  The variable `class_name` still points to the same string object, but the object has changed.  Its value was changed from `'SomeClassName'` to `'some_class_name'`—it was *modified in place*.  Methods that have the side effect of changing objects' values are often referred to as *destructive methods*.


### Convention for Using ! in Method Names
> The bang (!) does not mean "destructive" nor lack of it mean non
destructive either.  The bang sign means "the bang version is more
dangerous than its non bang counterpart; handle with care".

> Yukihiro Matsumoto (see [post][Matz comment])

In the example methods that we've mentioned, we've seen pairs of similarly named methods wherein one method's name ends in a *bang*, an exclamation point.  For example, `String#upcase` and `String#upcase!`.  What does the bang mean, and when do we use it?

The bang signifies danger.  What type of danger?  That depends.  Sometimes the danger is that the method is destructive, while sometimes it's another danger.  We understand the danger when we compare a dangerous method to a similar non-dangerous method.  In our example of converting a string to snake case in Figure 1, we can compare `to_snake_case` to `to_snake_case!` and see the danger is that `to_snake_case!` mutates its argument.

We should only add a bang to a method name if there is a non-dangerous equivalent.

*Note:*  For more detail, see David A. Black's blog post *[Bang methods; or, Danger, Will Rubyist!][bang post]*




## Releases
### Release 0: Writing a Method with No Side Effects
We are going to write a pair of methods: one method with no side effects and a more dangerous equivalent method.  We'll start with the method that has no side effects, the `destroy_message` method.

```ruby
destroy_message("For your eyes only: Have a great day!")
# => "For your eyes only:"
destroy_message("Important: Read the error message.")
# => "Important:"
destroy_message("Lacking an alert.")
# => "Lacking an alert."
```
*Figure 2*.  Using the `destroy_message` method.

Our `destroy_message` method needs to conform to the following rules (see Figure 2 for example usage).  We'll refer to the string passed when calling the method as the *message*.  Any characters from the beginning of the message through the first colon are considered the *alert*; not all messages have alerts.

- The method does not alter the object passed when calling the method.
- If the message contains an alert, the method returns just the alert.
- If the argument does not contain an alert, the method returns the whole message.

Some test have been provided to help verify our solution.  We can add more as we discover bugs and edge cases.


### Release 1: The Dangerous Version
```ruby
message = "Note: Come prepared for yoga."
# => "Note: Come prepared for yoga."
destroy_message!(message)
# => "Note:"
message
# => "Note:"
```
*Figure 3*.  The `destroy_message!` method is destructive.

Now we'll write a more dangerous version:  `destroy_message!`.  This method will behave the same as `destroy_message` except that this dangerous method will have a side effect:  it's destructive and permanently modifies its argument (see Figure 3).

Again, some tests have been provided.


### Release 2: Don't Repeat Yourself and Other Refactoring
We have two methods that behave almost identically.  This could result in us repeating ourselves.  Are our methods implementing the same logic?  Let's take a moment to refactor our code, making it DRY and generally improving its quality.

*Note:* Equivalent methods like these are often written so that one of the methods relies on its pair for the basic behavior.


## Conclusion
When we write a method—or consume one, for that matter—we need to be aware of what all the method does.  Is it a pure function?  Or, does the method produce side effects?  What types of side effects?  How could they possibly impact our program?


[bang post]: http://dablog.rubypal.com/2007/8/15/bang-methods-or-danger-will-rubyist
[Matz comment]: https://www.ruby-forum.com/topic/176830#773946
[pure functions]: https://en.wikipedia.org/wiki/Pure_function
