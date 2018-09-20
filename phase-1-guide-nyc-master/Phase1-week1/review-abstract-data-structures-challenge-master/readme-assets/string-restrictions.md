# String Restrictions

We may not use strings internally to represent text. Sound crazy? Read about [Strings](http://en.wikipedia.org/wiki/String_(computer_science)) then check out the `#chr` method in the `Integer` class. See if any lightbulbs turn on. The `#ord` method on Ruby's `String` class could help too.

Our custom string class should be able to *accept* a Ruby string and create an internal representation of that string via its `#new` method. Our implementation may not store Ruby strings.  It should also have a method to turn our internal representation of that string into a Ruby string (i.e., get the Ruby string back out); this will probably be our class's `#to_s` method.

```ruby
custom_string = MyString.new("This ruby string")
custom_string.to_s
# => "This ruby string"
```